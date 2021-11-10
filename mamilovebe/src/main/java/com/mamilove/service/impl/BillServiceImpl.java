package com.mamilove.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.config.AuthEntryPointJwt;
import com.mamilove.dao.*;
import com.mamilove.entity.*;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.QuantityRequest;
import com.mamilove.request.dto.Res;
import com.mamilove.service.service.CustomerService;
import com.mamilove.service.service.OrderDetailService;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.mamilove.service.service.BillService;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class BillServiceImpl implements BillService{

	private static final Logger logger = LoggerFactory.getLogger(BillServiceImpl.class);

	@Autowired
	BillDao billDao;
	@Autowired
	OrderDetailDao orderDetailDao;
	@Autowired
	AccountDao accountDao;
	@Autowired 
	CustomerDao customerDao;
	@Autowired
	OrderDetailService orderDetailService;
	@Autowired
	MamipayServiceImpl mamipayService;
	@Autowired
	MamiPayDao mamiPayDao;
	@Autowired
	CustomerService customerService;

	@Autowired
	ObjectMapper objectMapper;

	@Autowired
	QuantityDao quantityDao;

	public BillServiceImpl(BillDao billDao,OrderDetailDao orderDetailDao){
		this.billDao = billDao;
		this.orderDetailDao = orderDetailDao;
	}
	@Override
	public List<Bill> BillByCustomer(Long id) {
		return billDao.BillByCustomer(id);
	}

	@Override
	public List<Bill> FindAll() {
		return billDao.findAll();
	}

	@Override
	public boolean existsById(String id) {
		return billDao.existsById(id);
	}

	@Override
	public Object create(BillDto billDto){
		//tim kiem nguoi dung
		Optional<Account> getAccount = accountDao.findByUsername(billDto.getUsername());
		
//		List<Customer> cus = customerService.findByAccount(billDto.getUsername());
		Customer customer = customerDao.findByAccount(getAccount.get());
		//
		Bill bill = objectMapper.convertValue(billDto, Bill.class);
		bill.setIdCustomer(customer.getId());
		//
		bill.setId(RandomStringUtils.randomNumeric(8));
		while (billDao.existsById(bill.getId())){
			bill.setId(RandomStringUtils.randomNumeric(8));
		}
		//dánh sách sp có quantiiy
		List<Quantity> quantities = new ArrayList<>();
		// danh sách chi tiết đơn hàng
		List<Orderdetail> orderdetails = new ArrayList<>();
		//
		List<QuantityRequest> quantityRequests = billDto.getList_quantity();

		if(!billDto.getPayment()){//không thanh toán qua ví

			for (QuantityRequest qty: quantityRequests) {
				Quantity quantity = quantityDao.findById(qty.getId_quantity()).
						orElseThrow(() -> new RuntimeException("Lỗi thêm sản phẩm"));
				Product product = objectMapper.convertValue(quantity.getProduct(), Product.class);

				Orderdetail orderdetail = new Orderdetail();
				orderdetail.setIdquantity(quantity.getId());
				orderdetail.setQuantitydetail(qty.getBill_quantity());
				orderdetail.setPrice(product.getPrice());
				orderdetail.setDownprice(product.getPrice()*(product.getDiscount()/100));
				orderdetail.setIntomoney(product.getPrice() - orderdetail.getDownprice());
				orderdetail.setIdbill(bill.getId());

				orderdetails.add(orderdetail);
			}
			//
			billDao.save(bill);
			orderDetailDao.saveAll(orderdetails);
		} else {//thanh toan bang vi

			Mamipay mamipay = mamipayService.ByCustomer(customer.getId());
			if(mamipay.getSurplus() < billDto.getTotal()){
				throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Số dư ví phải lớn hơn hoặc bằng: " + billDto.getTotal());
			}
			for (QuantityRequest qty: quantityRequests) {
				Quantity quantity = quantityDao.findById(qty.getId_quantity()).
						orElseThrow(() -> new RuntimeException("Lỗi thêm sản phẩm"));

				Product product = objectMapper.convertValue(quantity.getProduct(), Product.class);

				if(quantity.getQuantity() >= qty.getBill_quantity()){
					//tính số lượng còn lại trong kho
					quantity.setQuantity(quantity.getQuantity() - qty.getBill_quantity());
				} else throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Sản phẩm: " + product.getName() + "! này đã hết số lượng.");

				Orderdetail orderdetail = new Orderdetail();
				orderdetail.setIdquantity(quantity.getId());
				orderdetail.setQuantitydetail(qty.getBill_quantity());
				orderdetail.setPrice(product.getPrice());
				orderdetail.setDownprice(product.getPrice()*(product.getDiscount()/100));
				orderdetail.setIntomoney(product.getPrice() - orderdetail.getDownprice());
				orderdetail.setIdbill(bill.getId());

				quantities.add(quantity);
				orderdetails.add(orderdetail);
			}
			mamipay.setSurplus(mamipay.getSurplus() - billDto.getTotal());
			mamiPayDao.save(mamipay);
			billDao.save(bill);
			orderDetailDao.saveAll(orderdetails);
			quantityDao.saveAll(quantities);

		}
		return bill;
	}

}

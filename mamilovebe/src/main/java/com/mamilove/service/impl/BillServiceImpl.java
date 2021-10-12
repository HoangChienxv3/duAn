package com.mamilove.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.dao.OrderDetailDao;
import com.mamilove.entity.*;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.OrderDetailDto;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.BillDao;
import com.mamilove.service.service.BillService;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class BillServiceImpl implements BillService{

	@Autowired
	BillDao billDao;
	@Autowired
	OrderDetailDao orderDetailDao;
	@Override
	public List<Bill> BillByCustomer(Long id) {
		return billDao.BillByCustomer(id);
	}

	@Override
	public List<Bill> FinAll() {
		return billDao.findAll();
	}

	@Override
	public boolean existsById(Long id) {
		return billDao.existsById(id);
	}

	@Override
	public Bill save(BillDto billDto) {
		Customer ct = new Customer();
		BeanUtils.copyProperties(billDto.getCusTomerDto(), ct);
		Voucher vc = new Voucher();
		BeanUtils.copyProperties(billDto.getVoucherDto(), vc);
		Bill bill = new Bill();
		BeanUtils.copyProperties(billDto, bill);
		bill.setCustomer(ct);
		bill.setVoucher(vc);
		billDao.save(bill);
		List<OrderDetailDto> ods =  billDto.getOrderDetailDto();
		List<Orderdetail> orderdetails = new ArrayList<>();
		ods.forEach(od -> {
			Orderdetail oderdetail = new Orderdetail();
			oderdetail.setDownprice(od.getDownprice());
			oderdetail.setIntomoney(od.getIntomoney());
			oderdetail.setPrice(od.getPrice());
			oderdetail.setQuantitydetail(od.getQuantitydetail());
			oderdetail.setBill(bill);
			Quantity q = new Quantity();
			BeanUtils.copyProperties(od.getQuantityDto(), q);
			oderdetail.setQuantity(q);
			orderdetails.add(oderdetail);
		});
		orderDetailDao.saveAll(orderdetails);
		return bill;
	}
}

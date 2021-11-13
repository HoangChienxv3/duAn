package com.mamilove.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.common.EnumStatus;
import com.mamilove.controllers.BaseController;
import com.mamilove.dao.*;
import com.mamilove.entity.*;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.QuantityRequest;
import com.mamilove.request.dto.UpdateBillCutomer;
import com.mamilove.service.service.CustomerService;
import com.mamilove.service.service.OrderDetailService;
import com.mamilove.vnpay.MamipayServiceImpl;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.mamilove.service.service.BillService;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Service
public class BillServiceImpl extends BaseController implements BillService {

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
    VoucherDao voucherDao;

    @Autowired
    ObjectMapper objectMapper;

    @Autowired
    QuantityDao quantityDao;

    public BillServiceImpl(BillDao billDao, OrderDetailDao orderDetailDao) {
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
    public Bill create(BillDto billDto) {
        //tim kiem nguoi dung
        Customer customer = customerDao.findByIdaccount(getAuthUID());
        //
        Bill bill = objectMapper.convertValue(billDto, Bill.class);
        bill.setIdCustomer(customer.getId());
        //
        bill.setId(RandomStringUtils.randomNumeric(8));
        while (billDao.existsById(bill.getId())) {
            bill.setId(RandomStringUtils.randomNumeric(8));
        }
        //dánh sách sp có quantiiy
        List<Quantity> quantities = new ArrayList<>();
        // danh sách chi tiết đơn hàng
        List<Orderdetail> orderdetails = new ArrayList<>();
        //
        List<QuantityRequest> quantityRequests = billDto.getList_quantity();

        if (!billDto.getPayment()) {//không thanh toán qua ví

            for (QuantityRequest qty : quantityRequests) {
                Quantity quantity = quantityDao.findById(qty.getId_quantity()).
                        orElseThrow(() -> new RuntimeException("Lỗi thêm sản phẩm"));
                Product product = objectMapper.convertValue(quantity.getProduct(), Product.class);

                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setIdquantity(quantity.getId());
                orderdetail.setQuantitydetail(qty.getBill_quantity());
                orderdetail.setPrice(product.getPrice());
                orderdetail.setDownprice(product.getPrice() * (product.getDiscount() / 100));
                orderdetail.setIntomoney(product.getPrice() - orderdetail.getDownprice());
                orderdetail.setIdbill(bill.getId());

                orderdetails.add(orderdetail);
            }
            //
                bill.setDiscount(null);
            bill.setVoucher_id(null);
            billDao.save(bill);
            orderDetailDao.saveAll(orderdetails);
        } else {//thanh toan bang vi

            Mamipay mamipay = mamipayService.ByCustomer(customer.getId());
            if (mamipay.getSurplus() < billDto.getTotal()) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Số dư ví phải lớn hơn hoặc bằng: " + billDto.getTotal());
            }
            for (QuantityRequest qty : quantityRequests) {
                Quantity quantity = quantityDao.findById(qty.getId_quantity()).
                        orElseThrow(() -> new RuntimeException("Lỗi thêm sản phẩm"));

                Product product = objectMapper.convertValue(quantity.getProduct(), Product.class);

                if (quantity.getQuantity() >= qty.getBill_quantity()) {
                    //tính số lượng còn lại trong kho
                    quantity.setQuantity(quantity.getQuantity() - qty.getBill_quantity());
                } else
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Sản phẩm: " + product.getName() + "! này đã hết số lượng.");

                Orderdetail orderdetail = new Orderdetail();
                orderdetail.setIdquantity(quantity.getId());
                orderdetail.setQuantitydetail(qty.getBill_quantity());
                orderdetail.setPrice(product.getPrice());
                orderdetail.setDownprice(product.getPrice() * (product.getDiscount() / 100));
                orderdetail.setIntomoney(product.getPrice() - orderdetail.getDownprice());
                orderdetail.setIdbill(bill.getId());

                quantities.add(quantity);
                orderdetails.add(orderdetail);
            }
            Voucher voucher;
            if(billDto.getVoucher_id() != null){
                voucher = voucherDao.findByIdIsAndIsDeleteFalse(billDto.getVoucher_id()).orElseThrow(() -> {
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Không tìm thấy voucher");
                });

                if(voucher.getAmount()<= 0){
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"VOucher đã hết");
                }
                bill.setDiscount(voucher.getDiscount());
                bill.setVoucher_id(voucher.getId());
                voucher.setAmount(voucher.getAmount() - 1l);
                voucherDao.save(voucher);
            }

            mamipay.setSurplus(mamipay.getSurplus() - billDto.getTotal());
            mamiPayDao.save(mamipay);
            billDao.save(bill);
            orderDetailDao.saveAll(orderdetails);
            quantityDao.saveAll(quantities);

        }
        return bill;
    }

    @Override
    public Bill updateBillCustomer(UpdateBillCutomer updateBillCutomer, String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Không tìm thấy đơn hàng");
        });

        //tim kiem nguoi dung
        Customer customer = customerService.findByAccount(getAuthUID());
        if (customer.getId() != bill.getIdCustomer()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Không có quyền sửa đơn này");
        }

        bill.setAddress(updateBillCutomer.getAddress());
        bill.setSdt(updateBillCutomer.getSdt());
        bill.setFullname(updateBillCutomer.getFullname());
        bill.setNote(updateBillCutomer.getNote());

        return billDao.save(bill);
    }

    @Override
    public Bill cancelBill(String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy đơn hàng");
        });

        //tim kiem nguoi dung
        Customer customer = customerService.findByAccount(getAuthUID());
        if (customer.getId() != bill.getIdCustomer()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không có quyền sửa đơn này");
        }
        if(bill.getStatus() == EnumStatus.CHUA_XAC_NHAN){
            bill.setStatus(EnumStatus.HUY);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Không thể hủy đơn");
        }
        //hoàn số lượng về kho nếu thanh toán qua ví
        List<Quantity> quantities = new ArrayList<>();
        if(bill.getPayment()){
            List<Orderdetail> orderdetails = bill.getOrderdetails();
            orderdetails.forEach(orderdetail -> {
                Quantity quantity =  orderdetail.getQuantity();
                quantity.setQuantity(quantity.getQuantity() + orderdetail.getQuantitydetail());
                quantities.add(quantity);
            });
            Mamipay mamipay = mamipayService.ByCustomer(customer.getId());
            mamipay.setSurplus(mamipay.getSurplus() + bill.getTotal());
            mamiPayDao.save(mamipay);
            quantityDao.saveAll(quantities);

        }
        return billDao.save(bill);
    }

    @Override
    public Bill cancelBillManager(String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy đơn hàng");
        });

        //tim kiem nguoi dung
        Customer customer = bill.getCustomer();

        if(bill.getStatus() == EnumStatus.CHUA_XAC_NHAN || bill.getStatus() == EnumStatus.DA_XAC_NHAN){
            bill.setStatus(EnumStatus.HUY);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Không thể hủy đơn");
        }
        //hoàn số lượng về kho nếu thanh toán qua ví
        List<Quantity> quantities = new ArrayList<>();
        if(bill.getPayment()){
            List<Orderdetail> orderdetails = bill.getOrderdetails();
            orderdetails.forEach(orderdetail -> {
                Quantity quantity =  orderdetail.getQuantity();
                quantity.setQuantity(quantity.getQuantity() + orderdetail.getQuantitydetail());
                quantities.add(quantity);
            });
            Mamipay mamipay = mamipayService.ByCustomer(customer.getId());
            mamipay.setSurplus(mamipay.getSurplus() + bill.getTotal());
            mamiPayDao.save(mamipay);
            quantityDao.saveAll(quantities);

        }
        return billDao.save(bill);
    }

    @Override
    public Bill confirmBillManager(String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy đơn hàng");
        });
        //tim kiem nguoi dung
        Customer customer = bill.getCustomer();

        if(bill.getStatus() == EnumStatus.CHUA_XAC_NHAN){
            bill.setStatus(EnumStatus.DA_XAC_NHAN);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Không thể xác nhận đơn");
        }
        //hoàn số lượng về kho nếu không thanh toán qua ví
        List<Quantity> quantities = new ArrayList<>();
        if(!bill.getPayment()){
            List<Orderdetail> orderdetails = bill.getOrderdetails();
            orderdetails.forEach(orderdetail -> {
                Quantity quantity =  orderdetail.getQuantity();
                if(quantity.getQuantity() < orderdetail.getQuantitydetail()){
                    String er = "Sản phẩm: " + quantity.getProduct().getName()
                            + " Size: " + quantity.getSize().getName() + "-" + quantity.getProperty().getName()
                            + " đã hết hàng.";
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST,er);
                }
                quantity.setQuantity(quantity.getQuantity()-orderdetail.getQuantitydetail());
                quantities.add(quantity);
            });

            quantityDao.saveAll(quantities);

        }
        return billDao.save(bill);
    }

    @Override
    public Bill shipBillManager(String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy đơn hàng");
        });

        if(bill.getStatus() == EnumStatus.DA_XAC_NHAN){
            bill.setStatus(EnumStatus.DA_GIAO_BEN_VAN_CHUYEN);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Lỗi chuyển đơn");
        }

        return billDao.save(bill);
    }

    @Override
    public Bill receivedBillManager(String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy đơn hàng");
        });

        if(bill.getStatus() == EnumStatus.DA_GIAO_BEN_VAN_CHUYEN){
            bill.setStatus(EnumStatus.KHACH_DA_NHAN_HANG);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Lỗi chuyển đơn");
        }

        return billDao.save(bill);
    }

    @Override
    public Bill refundBillManager(String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy đơn hàng");
        });

        if(bill.getStatus() == EnumStatus.DA_GIAO_BEN_VAN_CHUYEN){
            bill.setStatus(EnumStatus.HOAN_HANG);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Lỗi chuyển đơn");
        }

        return billDao.save(bill);
    }

    @Override
    public List<Bill> findAllCustomer() {
        return billDao.findAllByIdCustomerOrderByCreateAtDesc(getAuthUID());
    }


}

package com.mamilove.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.common.EnumRefund;
import com.mamilove.common.EnumStatus;
import com.mamilove.common.Message;
import com.mamilove.controllers.BaseController;
import com.mamilove.dao.*;
import com.mamilove.entity.*;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.QuantityRequest;
import com.mamilove.request.dto.ShipingRequest;
import com.mamilove.request.dto.UpdateBillCutomer;
import com.mamilove.service.service.CustomerService;
import com.mamilove.service.service.OrderDetailService;
import com.mamilove.shiping.BillShiping;
import com.mamilove.shiping.GetBillShiping;
import com.mamilove.vnpay.MamipayServiceImpl;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.mamilove.service.service.BillService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import javax.mail.MessagingException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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
    MailServiceImpl mailService;
    @Autowired
    VoucherDao voucherDao;

    @Autowired
    ObjectMapper objectMapper;

    @Autowired
    QuantityDao quantityDao;

    @Autowired
    HistoryDao historyDao;

    public BillServiceImpl(BillDao billDao, OrderDetailDao orderDetailDao) {
        this.billDao = billDao;
        this.orderDetailDao = orderDetailDao;
    }

    @Override
    public List<Bill> BillByCustomer(Long id) {
        return billDao.findAllByIdCustomer(id);
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
    @Transactional
    public Bill create(BillDto billDto) throws MessagingException, UnsupportedEncodingException {
        //tim kiem nguoi dung
        Customer customer = customerDao.findByIdaccount(getAuthUID());

        Bill bill = objectMapper.convertValue(billDto, Bill.class);
        bill.setIdCustomer(customer.getId());
        bill.setCreateAt(new Date());
        bill.setUpdateAts(new Date());

        bill.setId(RandomStringUtils.randomNumeric(8));
        while (billDao.existsById(bill.getId())) {
            bill.setId(RandomStringUtils.randomNumeric(8));
        }
        //d??nh s??ch sp c?? quantiiy
        // danh s??ch chi ti???t ????n h??ng
        List<Orderdetail> orderdetails = new ArrayList<>();

        List<QuantityRequest> quantityRequests = billDto.getList_quantity();
        for (QuantityRequest qty : quantityRequests) {
            Quantity quantity = quantityDao.findById(qty.getId_quantity()).
                    orElseThrow(() -> new RuntimeException("L???i th??m s???n ph???m"));
            Product product = objectMapper.convertValue(quantity.getProduct(), Product.class);
            StringBuilder message = new StringBuilder();
            if (quantity.getQuantity() < qty.getBill_quantity()) {
                String er = "S???n ph???m: " + quantity.getProduct().getName()
                        + " Size: " + quantity.getSize().getName() + "-" + quantity.getProperty().getName()
                        + " ???? h???t h??ng.";
                message.append(er).append("\n");
            }
            if (message.toString().length() > 0) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, message.toString());
            }
            Orderdetail orderdetail = new Orderdetail();
            orderdetail.setIdquantity(quantity.getId());
            orderdetail.setQuantitydetail(qty.getBill_quantity());
            orderdetail.setPrice(product.getPrice());
            orderdetail.setDownprice(product.getDiscount() != null ? product.getPrice() * (product.getDiscount() / 100) : 0);
            orderdetail.setIntomoney(product.getPrice() - orderdetail.getDownprice());
            orderdetail.setIdbill(bill.getId());
            orderdetail.setCreateAt(new Date());

            orderdetails.add(orderdetail);
        }
        if (!billDto.getPayment()) {
            //kh??ng thanh to??n qua v??
            bill.setDiscount(0d);
            bill.setVoucher_id(null);
        } else {
            //thanh toan bang vi
            Mamipay mamipay = mamipayService.ByCustomer(customer.getId());
            if (mamipay.getSurplus() < billDto.getTotal()) {
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "S??? d?? v?? ph???i l???n h??n ho???c b???ng: " + billDto.getTotal());
            }
            Voucher voucher;
            if (billDto.getVoucher_id() != null) {
                voucher = voucherDao.findByIdIsAndIsDeleteFalse(billDto.getVoucher_id()).orElseThrow(() -> {
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y voucher");
                });
                if (voucher.getAmount() <= 0) {
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Voucher ???? h???t");
                }
                bill.setDiscount(voucher.getDiscount());
                bill.setVoucher_id(voucher.getId());
                voucher.setAmount(voucher.getAmount() - 1L);
                voucherDao.save(voucher);
            }
            mamipay.setSurplus(mamipay.getSurplus() - billDto.getDowntotal());
            mamiPayDao.save(mamipay);
            createPayBill(mamipay, bill);
        }
        billDao.save(bill);
        orderDetailDao.saveAll(orderdetails);
        if (customer.getAccount().getEmail() != null) {
            mailService.sendCreateBill(customer.getAccount(), bill);
        }
        return bill;
    }

    public void createPayBill(Mamipay mamipay, Bill bill) {
        History history = new History();
        history.setAmounts(bill.getTotal());
        history.setStatus(true);
        history.setSurplus(mamipay.getSurplus());
        history.setDescription("Thanh to??n h??a ????n m?? " + bill.getId());
        history.setContent("Thanh to??n h??a ????n");
        history.setTrading_code(0L);
        history.setTime(new Date());
        history.setIdmamipay(mamipay.getIdmamipay());

        historyDao.save(history);
    }

    @Override
    public Bill updateBillCustomer(UpdateBillCutomer updateBillCutomer, String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });
        if (!(bill.getStatus().equals(EnumStatus.CHUA_XAC_NHAN))) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "B???n kh??ng th??? s???a ????n khi ???? x??c nh???n");
        }
        //tim kiem nguoi dung
        Customer customer = customerService.findByAccount(getAuthUID());
        if (!Objects.equals(customer.getId(), bill.getIdCustomer())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng c?? quy???n s???a ????n n??y");
        }

        bill.setAddress(updateBillCutomer.getAddress());
        bill.setSdt(updateBillCutomer.getSdt());
        bill.setFullname(updateBillCutomer.getFullname());
        bill.setNote(updateBillCutomer.getNote());
        bill.setUpdateAts(new Date());
        return billDao.save(bill);
    }

    @Override
    @Transactional
    public Bill cancelBill(String idbill) throws MessagingException, UnsupportedEncodingException {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });

        //tim kiem nguoi dung
        Customer customer = customerService.findByAccount(getAuthUID());
        if (!Objects.equals(customer.getId(), bill.getIdCustomer())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng c?? quy???n s???a ????n n??y");
        }
        if (bill.getStatus() == EnumStatus.CHUA_XAC_NHAN || bill.getStatus() == EnumStatus.DA_XAC_NHAN_VA_DONG_GOI) {
            bill.setStatus(EnumStatus.HUY);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng th??? h???y ????n");
        }
        //ho??n ti???n v??? n???u thanh to??n qua v??
        if (bill.getPayment()) {
            Mamipay mamipay = mamipayService.ByCustomer(customer.getId());
            mamipay.setSurplus(mamipay.getSurplus() + bill.getTotal());
            mamiPayDao.save(mamipay);
            refundPayBill(mamipay, bill);
        }
        if (customer.getAccount().getEmail() != null) {
            mailService.sendCancelBill(customer.getAccount(), bill);
        }
        bill.setUpdateAts(new Date());
        return billDao.save(bill);
    }

    public void refundPayBill(Mamipay mamipay, Bill bill) {
        History history = new History();
        history.setAmounts(bill.getDowntotal());
        history.setStatus(true);
        history.setSurplus(mamipay.getSurplus());
        history.setDescription("Ho??n ti???n h??a ????n m?? " + bill.getId());
        history.setContent("Ho??n ti???n h??a ????n");
        history.setTrading_code(0L);
        history.setTime(new Date());
        history.setIdmamipay(mamipay.getIdmamipay());

        historyDao.save(history);
    }

    @Override
    @Transactional
    public Bill cancelBillManager(String idbill) throws MessagingException, UnsupportedEncodingException {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });

        //tim kiem nguoi dung
        Customer customer = bill.getCustomer();

        if (bill.getStatus() == EnumStatus.CHUA_XAC_NHAN || bill.getStatus() == EnumStatus.DA_XAC_NHAN_VA_DONG_GOI) {
            bill.setStatus(EnumStatus.HUY);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng th??? h???y ????n");
        }
        if (bill.getStatus() == EnumStatus.DA_XAC_NHAN_VA_DONG_GOI) {
            //ho??n s??? l?????ng v??? kho
            List<Quantity> quantities = new ArrayList<>();
            List<Orderdetail> orderdetails = bill.getOrderdetails();
            for (Orderdetail orderdetail : orderdetails) {
                Quantity quantity = orderdetail.getQuantity();

                quantity.setQuantity(quantity.getQuantity() + orderdetail.getQuantitydetail());
                quantities.add(quantity);
            }
            quantityDao.saveAll(quantities);
        }
        //ho??n ti???n v??? v?? n???u thanh to??n qua v??
        if (bill.getPayment()) {
            Mamipay mamipay = mamipayService.ByCustomer(customer.getId());
            mamipay.setSurplus(mamipay.getSurplus() + bill.getDowntotal());
            mamiPayDao.save(mamipay);
            refundPayBill(mamipay, bill);
        }
        if (customer.getAccount().getEmail() != null) {
            mailService.sendCreateManagerBill(customer.getAccount(), bill);
        }
        bill.setUpdateAts(new Date());
        return billDao.save(bill);
    }

    @Override
    public Bill confirmBillManager(String idbill) throws MessagingException, UnsupportedEncodingException {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });

        if (bill.getStatus() == EnumStatus.CHUA_XAC_NHAN) {
            bill.setStatus(EnumStatus.DA_XAC_NHAN_VA_DONG_GOI);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng th??? x??c nh???n ????n");
        }
        //ho??n s??? l?????ng v??? kho
        List<Quantity> quantities = new ArrayList<>();
        StringBuilder message = new StringBuilder();
        List<Orderdetail> orderdetails = bill.getOrderdetails();
        for (Orderdetail orderdetail : orderdetails) {
            Quantity quantity = orderdetail.getQuantity();
            if (quantity.getQuantity() < orderdetail.getQuantitydetail()) {
                String er = "S???n ph???m: " + quantity.getProduct().getName()
                        + " Size: " + quantity.getSize().getName() + "-" + quantity.getProperty().getName()
                        + " ???? h???t h??ng.";
                message.append(er).append("\n");
            }
            quantity.setQuantity(quantity.getQuantity() - orderdetail.getQuantitydetail());
            quantities.add(quantity);
        }
        if (message.toString().length() > 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, message.toString());
        }
        quantityDao.saveAll(quantities);

        bill.setUpdateAts(new Date());
        return billDao.save(bill);
    }

    @Override
    public Bill shipBillManager(String idbill) throws MessagingException, UnsupportedEncodingException {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });

        if (bill.getStatus() == EnumStatus.DA_XAC_NHAN_VA_DONG_GOI) {
            bill.setStatus(EnumStatus.DA_GIAO_BEN_VAN_CHUYEN);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "L???i chuy???n ????n");
        }
        //ho??n s??? l?????ng v??? kho
//        List<Quantity> quantities = new ArrayList<>();
//        StringBuilder message = new StringBuilder();
//        List<Orderdetail> orderdetails = bill.getOrderdetails();
//        for (Orderdetail orderdetail : orderdetails) {
//            Quantity quantity = orderdetail.getQuantity();
//            if (quantity.getQuantity() < orderdetail.getQuantitydetail()) {
//                String er = "S???n ph???m: " + quantity.getProduct().getName()
//                        + " Size: " + quantity.getSize().getName() + "-" + quantity.getProperty().getName()
//                        + " ???? h???t h??ng.";
//                message.append(er).append("\n");
//            }
//            quantity.setQuantity(quantity.getQuantity() - orderdetail.getQuantitydetail());
//            quantities.add(quantity);
//        }
//        if (message.toString().length() > 0) {
//            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, message.toString());
//        }
//        quantityDao.saveAll(quantities);
        if (bill.getCustomer().getAccount().getEmail() != null) {
            mailService.sendConfirmManagerBill(bill.getCustomer().getAccount(), bill);
        }
        bill.setUpdateAts(new Date());
        return billDao.save(bill);
    }

    @Override
    public Bill receivedBillManager(String idbill) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });

        if (bill.getStatus() == EnumStatus.DA_GIAO_BEN_VAN_CHUYEN) {
            bill.setStatus(EnumStatus.KHACH_DA_NHAN_HANG);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "L???i chuy???n ????n");
        }
        bill.setUpdateAts(new Date());
        return billDao.save(bill);
    }

    @Override
    @Transactional
    public Bill refundBillManager(String idbill, EnumRefund status, String note) {
        Bill bill = billDao.findById(idbill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });

        if (bill.getStatus() == EnumStatus.DA_GIAO_BEN_VAN_CHUYEN) {
            bill.setStatus(EnumStatus.HOAN_HANG);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "L???i chuy???n ????n");
        }

        if (status == null || status.toString().length() == 0) {
            bill.setRefund(EnumRefund.KHAC);
            bill.setNoterefund(Message.KHONG_RO);
        } else {
            bill.setRefund(status);
            switch (status) {
                case THAT_BAI:
                    bill.setNoterefund(Message.THAT_BAI);
                    break;
                case SAI_DIA_CHI:
                    bill.setNoterefund(Message.SAI_DIA_CHI);
                    break;
                case KHACH_HUY:
                    bill.setNoterefund(Message.KHACH_HUY);
                    break;
                case SAI_SAN_PHAM:
                    bill.setNoterefund(Message.SAI_SAN_PHAM);
                    break;
                case KHAC:
                    bill.setNoterefund(note);
                    break;
            }
        }
        //hoan sl ve kho
        List<Quantity> quantities = new ArrayList<>();
        List<Orderdetail> orderdetails = bill.getOrderdetails();
        for (Orderdetail orderdetail : orderdetails) {
            Quantity quantity = orderdetail.getQuantity();

            quantity.setQuantity(quantity.getQuantity() + orderdetail.getQuantitydetail());
            quantities.add(quantity);
        }
        quantityDao.saveAll(quantities);
        //ho??n ti???n v??? v?? n???u thanh to??n qua v??
        Customer customer = customerDao.findByIdaccount(bill.getIdCustomer());
        if (bill.getPayment()) {
            Mamipay mamipay = mamipayService.ByCustomer(bill.getIdCustomer());
            mamipay.setSurplus(mamipay.getSurplus() + bill.getTotal());
            mamiPayDao.save(mamipay);
            refundPayBill(mamipay, bill);
        }

        bill.setUpdateAts(new Date());
        return billDao.save(bill);
    }

    @Override
    public List<Bill> findAllCustomer() {
        return billDao.findAllByIdCustomerOrderByCreateAtDesc(getAuthUID());
    }

    @Override
    public Bill shipingBill(ShipingRequest shipingRequest) {
        Bill bill = billDao.findById(shipingRequest.getIdBill()).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });
        bill.setStatusshipping(shipingRequest.getIdShiping());
        return billDao.save(bill);
    }

    @Override
    public List<BillShiping> getShipingBill(String idBill) throws IOException {
        Bill bill = billDao.findById(idBill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });
        return GetBillShiping.getStatusShip(bill.getStatusshipping());
    }

    @Override
    public List<BillShiping> getShipingBillCustomer(String idBill) throws IOException {
        Bill bill = billDao.findById(idBill).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y ????n h??ng");
        });

        //tim kiem nguoi dung
        Customer customer = customerService.findByAccount(getAuthUID());
        if (!Objects.equals(customer.getId(), bill.getIdCustomer())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng c?? quy???n s???a ????n n??y");
        }
        return GetBillShiping.getStatusShip(bill.getStatusshipping());
    }

    @Override
    public List<String> getAddress() {
        Customer customer = customerService.findByAccount(getAuthUID());

        return billDao.getAddress(customer.getId()).stream().map(bill -> {
            String add = bill.getAddress();
            return add;
        }).collect(Collectors.toList());

    }


}

package com.mamilove.service.service;

import com.mamilove.entity.Bill;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.ShipingRequest;
import com.mamilove.request.dto.UpdateBillCutomer;
import com.mamilove.shiping.BillShiping;

import javax.mail.MessagingException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

public interface BillService {
    List<Bill> BillByCustomer(Long id);

    List<Bill> FindAll();

    boolean existsById(String id);

    Bill create(BillDto billDto) throws MessagingException, UnsupportedEncodingException;

    Bill updateBillCustomer(UpdateBillCutomer updateBillCutomer, String idbill);

    Bill cancelBill(String idbill) throws MessagingException, UnsupportedEncodingException;

    Bill cancelBillManager(String idbill) throws MessagingException, UnsupportedEncodingException;

    Bill confirmBillManager(String idbill) throws MessagingException, UnsupportedEncodingException;

    Bill shipBillManager(String idbill) throws MessagingException, UnsupportedEncodingException;

    Bill receivedBillManager(String idbill);

    Bill refundBillManager(String idbill);

    List<Bill> findAllCustomer();

    Bill shipingBill(ShipingRequest shipingRequest);

    List<BillShiping> getShipingBill(String idBill) throws IOException;

    List<BillShiping> getShipingBillCustomer(String idBill) throws IOException;
}

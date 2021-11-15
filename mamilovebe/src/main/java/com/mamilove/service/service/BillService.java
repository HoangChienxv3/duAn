package com.mamilove.service.service;

import com.mamilove.entity.Bill;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.ShipingRequest;
import com.mamilove.request.dto.UpdateBillCutomer;
import com.mamilove.shiping.BillShiping;

import java.io.IOException;
import java.util.List;

public interface BillService {
    List<Bill> BillByCustomer(Long id);
    List<Bill> FindAll();
    boolean existsById(String id);
    Bill create(BillDto billDto);

    Bill updateBillCustomer(UpdateBillCutomer updateBillCutomer, String idbill);

    Bill cancelBill(String idbill);

    Bill cancelBillManager(String idbill);

    Bill confirmBillManager(String idbill);

    Bill shipBillManager(String idbill);

    Bill receivedBillManager(String idbill);

    Bill refundBillManager(String idbill);

    List<Bill> findAllCustomer();

    Bill shipingBill(ShipingRequest shipingRequest);

    List<BillShiping> getShipingBill(String idBill) throws IOException;
}

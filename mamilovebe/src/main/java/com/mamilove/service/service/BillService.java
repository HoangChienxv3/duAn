package com.mamilove.service.service;

import com.mamilove.entity.Bill;
import com.mamilove.request.dto.BillDto;
import com.mamilove.request.dto.UpdateBillCutomer;

import java.util.List;

public interface BillService {
    List<Bill> BillByCustomer(Long id);
    List<Bill> FindAll();
    boolean existsById(String id);
    Object create(BillDto billDto);

    Bill updateBillCustomer(UpdateBillCutomer updateBillCutomer, String idbill);

    Bill cancelBill(String idbill);
}

package com.mamilove.service.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.mamilove.entity.Bill;
import com.mamilove.request.dto.BillDto;

import java.util.List;

public interface BillService {
    List<Bill> BillByCustomer(Long id);
    List<Bill> FinAll();
     boolean existsById(Long id);
    Bill save(BillDto bill);
}

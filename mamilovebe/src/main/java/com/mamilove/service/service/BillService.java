package com.mamilove.service.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.mamilove.entity.Bill;

import java.util.List;

public interface BillService {
    List<Bill> BillByCustomer(Long id);
    List<Bill> FinAll();
     boolean existsById(Long id);
    Bill save(JsonNode bill);
}

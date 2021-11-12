package com.mamilove.service.service;

import com.mamilove.entity.Account;
import com.mamilove.entity.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findByAccount(String username);
    List<Customer> findAllFalse();
    Customer findById(Long id);
    Customer update(Customer ct);
}

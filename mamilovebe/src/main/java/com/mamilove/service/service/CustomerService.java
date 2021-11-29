package com.mamilove.service.service;

import com.mamilove.entity.Customer;

import java.util.List;

public interface CustomerService {
    Customer findByAccount(Long idAccount);

    Customer findById(Long id);

    List<Customer> findAllFalse();

    Customer update(Customer ct);

}

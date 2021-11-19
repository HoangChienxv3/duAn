package com.mamilove.service.service;


import com.mamilove.entity.Customer;

import java.util.List;

public interface CustomerService {
    Customer findByAccount(Long idAccout);
    Customer findById(Long id);
    List<Customer> findAllFalse();
    Customer update(Customer ct);

}

package com.mamilove.service.service;

import com.mamilove.entity.Account;
import com.mamilove.entity.Customer;

import java.util.List;

public interface CustomerService {
    Customer findByAccount(Long idAccout);
}

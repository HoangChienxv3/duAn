package com.mamilove.service.service;

import com.mamilove.entity.Orderdetail;

import java.util.List;

public interface OrderDetailService {
    List<Orderdetail> AllByCustomer(Long id);

    List<Orderdetail> saveAll(List<Orderdetail> orderdetail);

    List<Orderdetail> FinAll();
}

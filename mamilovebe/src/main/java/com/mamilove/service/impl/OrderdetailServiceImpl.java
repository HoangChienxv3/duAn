package com.mamilove.service.impl;

import com.mamilove.entity.Orderdetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.OrderDetailDao;
import com.mamilove.service.service.OrderDetailService;

import java.util.List;

@Service
public class OrderdetailServiceImpl implements OrderDetailService {

    @Autowired
    OrderDetailDao orderDetailDao;

    @Override
    public List<Orderdetail> AllByCustomer(Long id) {
        return orderDetailDao.AllByCustomer(id);
    }

    @Override
    public List<Orderdetail> saveAll(List<Orderdetail> orderdetail) {
        return orderDetailDao.saveAll(orderdetail);
    }

    @Override
    public List<Orderdetail> FinAll() {
        return orderDetailDao.findAll();
    }
}

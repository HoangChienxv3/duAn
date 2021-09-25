package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.OrderDetailDao;
import com.mamilove.service.service.OrderDetailService;

@Service
public class OrderdetailServiceImpl implements OrderDetailService {

	@Autowired
	OrderDetailDao orderDetailDao;
	
}

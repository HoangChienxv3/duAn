package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.BillDao;
import com.mamilove.service.service.BillService;

@Service
public class BillServiceImpl implements BillService{

	@Autowired
	BillDao billDao;
	
}

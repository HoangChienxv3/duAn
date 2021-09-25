package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.VoucherDao;
import com.mamilove.service.service.VoucherService;

@Service
public class VoucherServiceImpl implements VoucherService{

	@Autowired
	VoucherDao voucherDao;
	
}

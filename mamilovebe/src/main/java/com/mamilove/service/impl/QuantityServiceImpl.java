package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.QuantityDao;
import com.mamilove.service.service.QuantityService;

@Service
public class QuantityServiceImpl implements QuantityService{

	@Autowired
	QuantityDao quantityDao;
	
}

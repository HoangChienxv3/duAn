package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.SizeDao;
import com.mamilove.service.service.SizeService;

@Service
public class SizeServiceImpl implements SizeService{

	@Autowired
	SizeDao sizeDao;
	
}

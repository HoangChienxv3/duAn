package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.CategoryDetailDao;
import com.mamilove.service.service.CategoryDetailService;

@Service
public class CategoryDetailServiceImpl implements CategoryDetailService{

	@Autowired
	CategoryDetailDao categoryDetailDao;
	
	
}

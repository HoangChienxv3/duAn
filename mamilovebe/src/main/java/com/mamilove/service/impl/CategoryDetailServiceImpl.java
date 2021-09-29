package com.mamilove.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.CategoryDetailDao;
import com.mamilove.entity.Categorydetail;
import com.mamilove.service.service.CategoryDetailService;

@Service
public class CategoryDetailServiceImpl implements CategoryDetailService{

	@Autowired
	CategoryDetailDao categoryDetailDao;

	@Override
	public List<Categorydetail> findAll() {
		return categoryDetailDao.findAll();
	}
	
	
}

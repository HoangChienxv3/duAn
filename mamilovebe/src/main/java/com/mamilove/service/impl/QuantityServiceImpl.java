package com.mamilove.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.QuantityDao;
import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.service.service.QuantityService;

@Service
public class QuantityServiceImpl implements QuantityService{

	@Autowired
	QuantityDao quantityDao;

	@Override
	public List<Quantity> findAll() {
		// TODO Auto-generated method stub
		return quantityDao.findAll();
	}

	@Override
	public List<Quantity> findByProduct(Product product) {
		// TODO Auto-generated method stub
		return quantityDao.findByProduct(product);
	}
	
	
}

package com.mamilove.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.ProductDao;
import com.mamilove.entity.Product;
import com.mamilove.service.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return productDao.findAll();
	}

	@Override
	public List<Product> findProductNew() {
		// TODO Auto-generated method stub
		return productDao.findProductNew();
	}

	@Override
	public Optional<Product> findByCategorydetail(Integer categorydetail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Product> findById(Long id) {
		// TODO Auto-generated method stub
		return productDao.findById(id);
	}
	
}

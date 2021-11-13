package com.mamilove.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.ProductDao;
import com.mamilove.entity.Categorydetail;
import com.mamilove.entity.Product;
import com.mamilove.service.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return productDao.findAllByIsDeleteFalse();
	}

	@Override
	public List<Product> findProductNew() {
		// TODO Auto-generated method stub
		return productDao.findProductNew();
	}

	@Override
	public Product findById(Long id) {
		// TODO Auto-generated method stub
		return productDao.findById(id).get();
	}

	@Override
	public List<Product> findByCategoryDetail(Categorydetail categoryDetail) {
		// TODO Auto-generated method stub
		return productDao.findByCategorydetail(categoryDetail);
	}

	@Override
	@Transactional
	public <S extends Product> List<S> saveAll(Iterable<S> entities) {
		// TODO Auto-generated method stub
		return productDao.saveAll(entities);
	}
	
	@Override
	@Transactional
	public Product saveAndFlush(Product product) {
		// TODO Auto-generated method stub
		return productDao.saveAndFlush(product);
	}
	
	@Override
	@Transactional
	public void delete(Product product) {
		// TODO Auto-generated method stub
		productDao.delete(product);;
	}

	@Override
	public Product create(Product product) {
		return productDao.save(product);
	}

	@Override
	public List<Product> findAllFalse() {
		return productDao.findAllFalse();
	}


}

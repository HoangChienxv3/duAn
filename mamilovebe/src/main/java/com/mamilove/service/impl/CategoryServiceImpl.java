package com.mamilove.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.CategoryDao;
import com.mamilove.entity.Category;
import com.mamilove.service.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDao categoryDao;

	@Override
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	@Override
	@Transactional
	public Category saveAndFlush(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.saveAndFlush(category);
	}

	@Override
	@Transactional
	public List<Category> saveAll(List<Category> category) {
		// TODO Auto-generated method stub
		List<Category> response = (List<Category>) categoryDao.saveAll(category);
		return response;
	}

	
	@Override
	@Transactional
	public void delete(Category category) {
		// TODO Auto-generated method stub
		categoryDao.delete(category);
	}

	@Override
	@Transactional
	public void deleteInBatch(List<Category> category) {
		// TODO Auto-generated method stub
		categoryDao.deleteInBatch(category);
	}

	
}

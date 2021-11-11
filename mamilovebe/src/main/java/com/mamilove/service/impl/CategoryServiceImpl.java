package com.mamilove.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import com.mamilove.entity.Account;
import com.mamilove.entity.Categorydetail;
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
	public List<Category> saveAll(List<Category> category) {
		// TODO Auto-generated method stub
		List<Category> response = (List<Category>) categoryDao.saveAll(category);
		return response;
	}

	@Override
	@Transactional
	public <S extends Category> S save(S entity) {
		return categoryDao.save(entity);
	}

	@Override
	@Transactional
	public void delete(Category category) {
		// TODO Auto-generated method stub
		categoryDao.delete(category);
	}


	@Override
	@Transactional
	public List<Category> getAllListCategory(){
	    return categoryDao.listCategoriesIsDeleteTrue();
	}

	@Override
	@Transactional
	public  List<Category> listCategoryById(Long id){
		return  categoryDao.listCategoryById(id);
	}

	@Override
	@Transactional
	public Optional<Category> findById(Long id) {
		// TODO Auto-generated method stub
		return categoryDao.findById(id);
	}




}

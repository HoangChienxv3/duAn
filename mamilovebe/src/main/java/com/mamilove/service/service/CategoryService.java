package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Category;
import com.mamilove.entity.Categorydetail;

public interface CategoryService {
	List<Category> findAll();
	Category saveAndFlush(Category category);
	List<Category> saveAll(List<Category> category);
	void delete(Category category);
	void deleteInBatch(List<Category> category);

}

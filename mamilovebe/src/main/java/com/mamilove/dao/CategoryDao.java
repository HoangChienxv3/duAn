package com.mamilove.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Category;
import com.mamilove.entity.Categorydetail;

public interface CategoryDao extends JpaRepository<Category, Long>{
	List<Category> findAll();
	Category saveAndFlush(Category category);
	void delete(Category category);
}

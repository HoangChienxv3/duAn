package com.mamilove.dao;

import java.util.List;

import com.mamilove.entity.Bill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Category;
import com.mamilove.entity.Categorydetail;

public interface CategoryDao extends JpaRepository<Category, Long>{
	@Query("SELECT b FROM Category b WHERE b.isDelete = false ")
	List<Category> listCategoriesIsDeleteTrue();

	@Query("SELECT b FROM Category b WHERE b.id = ?1  AND b.isDelete = false ")
	List<Category> listCategoryById(Long id);

	List<Category> findAll();
	Category saveAndFlush(Category category);
	void delete(Category category);



}

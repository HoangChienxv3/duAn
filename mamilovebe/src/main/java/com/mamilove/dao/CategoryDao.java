package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Category;

public interface CategoryDao extends JpaRepository<Category, Long>{

}

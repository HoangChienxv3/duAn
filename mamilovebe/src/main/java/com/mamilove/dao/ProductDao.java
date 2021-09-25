package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Product;

public interface ProductDao extends JpaRepository<Product, Long>{

}

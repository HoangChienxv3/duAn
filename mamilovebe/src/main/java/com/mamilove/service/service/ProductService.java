package com.mamilove.service.service;

import java.util.List;
import java.util.Optional;

import com.mamilove.entity.Product;

public interface ProductService {
	List<Product> findAll();
	Optional<Product> findById(Long id);
	Optional<Product> findByCategorydetail(Integer categorydetail);
	List<Product> findProductNew();
}

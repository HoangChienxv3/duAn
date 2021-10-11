package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;

public interface QuantityService {
	List<Quantity> findAll();
	List<Quantity> findByProduct(Product product);
	
}

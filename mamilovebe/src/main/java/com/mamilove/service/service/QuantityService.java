package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.request.dto.CreateQuantityDto;

public interface QuantityService {
	List<Quantity> findAll();
	List<Quantity> findByProduct(Product product);

	List<Quantity> createQty(Long idpoduct, Long idsize, CreateQuantityDto createQuantity);
}

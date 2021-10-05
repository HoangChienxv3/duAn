package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Image;
import com.mamilove.entity.Product;

public interface ImageService {
	List<Image> findAll();
	List<Image> findByProduct(Product product);
}

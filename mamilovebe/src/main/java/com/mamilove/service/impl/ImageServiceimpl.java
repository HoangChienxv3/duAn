package com.mamilove.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.ImageDao;
import com.mamilove.entity.Image;
import com.mamilove.entity.Product;
import com.mamilove.service.service.ImageService;

@Service
public class ImageServiceimpl implements ImageService {

	@Autowired
	ImageDao imageDao;

	@Override
	public List<Image> findAll() {
		// TODO Auto-generated method stub
		return imageDao.findAll();
	}

	@Override
	public List<Image> findByProduct(Product product) {
		// TODO Auto-generated method stub
		return imageDao.findByProduct(product);
	}
	
}

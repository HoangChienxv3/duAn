package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.ImageDao;
import com.mamilove.service.service.ImageService;

@Service
public class ImageServiceimpl implements ImageService {

	@Autowired
	ImageDao imageDao;
	
}

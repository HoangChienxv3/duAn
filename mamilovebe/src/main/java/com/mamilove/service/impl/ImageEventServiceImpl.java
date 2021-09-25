package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.ImageEventDao;
import com.mamilove.service.service.ImageEventService;

@Service
public class ImageEventServiceImpl implements ImageEventService{

	@Autowired
	ImageEventDao imageEventDao;
	
}

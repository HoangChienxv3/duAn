package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.MamiPayDao;
import com.mamilove.service.service.MamiPayService;

@Service
public class MamipayService implements MamiPayService{

	@Autowired
	MamiPayDao mamiPayDao;
	
}

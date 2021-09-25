package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.TyperSizeDao;
import com.mamilove.service.service.TypeSizeService;

@Service
public class TypeSizeServiceImpl implements TypeSizeService{

	@Autowired
	TyperSizeDao typerSizeDao;
	
	
}

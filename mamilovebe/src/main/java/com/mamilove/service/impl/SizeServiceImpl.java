package com.mamilove.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.SizeDao;
import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;
import com.mamilove.service.service.SizeService;

@Service
public class SizeServiceImpl implements SizeService{

	@Autowired
	SizeDao sizeDao;
	
	@Override
	public List<Size> findAll() {
		// TODO Auto-generated method stub
		return sizeDao.findAll();
	}
	
	@Override
	public List<Size> findByTypeSize(Typesize typeSize) {
		// TODO Auto-generated method stub
		return sizeDao.findByTypesize(typeSize);
	}
}

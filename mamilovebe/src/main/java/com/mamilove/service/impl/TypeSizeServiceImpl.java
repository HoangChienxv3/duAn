package com.mamilove.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.TyperSizeDao;
import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;
import com.mamilove.service.service.TypeSizeService;

@Service
public class TypeSizeServiceImpl implements TypeSizeService{

	@Autowired
	TyperSizeDao typeSizeDao;

	@Override
	public List<Typesize> findAll() {
		// TODO Auto-generated method stub
		return typeSizeDao.findAll();
	}

	@Override
	public Optional<Typesize> findById(Long id) {
		// TODO Auto-generated method stub
		return typeSizeDao.findById(id);
	}

	@Override
	public List<Typesize> saveAll(List<Typesize> typeSize) {
		// TODO Auto-generated method stub
		return typeSizeDao.saveAll(typeSize);
	}

	@Override
	public void deleteInBatch(List<Typesize> typeSize) {
		// TODO Auto-generated method stub
		typeSizeDao.deleteInBatch(typeSize);
	}
	
	
}

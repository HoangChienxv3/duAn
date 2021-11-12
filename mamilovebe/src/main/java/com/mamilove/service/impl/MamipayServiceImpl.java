package com.mamilove.service.impl;

import com.mamilove.entity.Mamipay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.MamiPayDao;
import com.mamilove.service.service.MamiPayService;

import java.util.List;

@Service
public class MamipayServiceImpl implements MamiPayService{

	@Autowired
	MamiPayDao mamiPayDao;

	@Override
	public List<Mamipay> fill() {
		return mamiPayDao.findAll();
	}

	@Override
	public List<Mamipay> findAll() {
		return mamiPayDao.findAll();
	}

	@Override
	public Mamipay ByCustomer(Long id) {
		return mamiPayDao.BillByCustomer(id);
	}

	@Override
	public Mamipay create(Mamipay mamipay) {
		return mamiPayDao.save(mamipay);
	}
}

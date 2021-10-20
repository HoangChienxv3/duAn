package com.mamilove.service.impl;

import com.mamilove.entity.Voucher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.VoucherDao;
import com.mamilove.service.service.VoucherService;

import java.util.List;
import java.util.Optional;

@Service
public class VoucherServiceImpl implements VoucherService{

	@Autowired
	VoucherDao voucherDao;

	public Optional<Voucher> findById(Long id){
		return voucherDao.findById(id);
	}
	public boolean existsById(Long id){
		return voucherDao.existsById(id);
	}
	
}

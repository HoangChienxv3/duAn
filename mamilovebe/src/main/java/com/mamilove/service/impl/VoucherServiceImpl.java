package com.mamilove.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.VoucherDao;
import com.mamilove.entity.Voucher;
import com.mamilove.service.service.VoucherService;

@Service
public class VoucherServiceImpl implements VoucherService{

	@Autowired
	VoucherDao voucherDao;

	@Override
	public List<Voucher> findAll() {
		// TODO Auto-generated method stub
		return voucherDao.findAll();
	}
	
	@Override
	public List<Voucher> findVoucherByAmount() {
		// TODO Auto-generated method stub
		return voucherDao.findVoucherByAmout();
	}

	@Override
	@Transactional
	public List<Voucher> saveAll(List<Voucher> voucher) {
		// TODO Auto-generated method stub
		return voucherDao.saveAll(voucher);
	}

	@Override
	@Transactional
	public void deleteInBatch(List<Voucher> voucher) {
		// TODO Auto-generated method stub
		voucherDao.deleteInBatch(voucher);
	}
	
}

package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Voucher;

public interface VoucherService {
	List<Voucher> findAll();
	List<Voucher> findVoucherByAmount();
	List<Voucher> saveAll(List<Voucher> voucher);
	void deleteInBatch(List<Voucher> voucher);
}

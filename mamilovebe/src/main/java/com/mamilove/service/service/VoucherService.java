package com.mamilove.service.service;

import java.text.ParseException;
import java.util.List;

import com.mamilove.entity.Voucher;
import com.mamilove.request.dto.VoucherRequest;

public interface VoucherService {
	List<Voucher> findAll();
	List<Voucher> findVoucherByAmount();
	List<Voucher> saveAll(List<Voucher> voucher);
	void deleteInBatch(List<Voucher> voucher);

	Voucher create(VoucherRequest voucherRequest) throws ParseException;

	Voucher update(Long id, VoucherRequest voucherRequest) throws ParseException;

	Voucher detele(Long id);

	List<Voucher> findAllVoucher();

	List<Voucher> findAllVoucherByIdEvent(Long idEvent);

	Voucher findById(Long id);
}

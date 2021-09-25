package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Voucher;

public interface VoucherDao extends JpaRepository<Voucher, Long>{

}

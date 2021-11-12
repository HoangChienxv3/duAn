package com.mamilove.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Voucher;

public interface VoucherDao extends JpaRepository<Voucher, Long> {
    List<Voucher> findAll();

    @Query("SELECT v FROM Voucher v WHERE v.amount > 0")
    List<Voucher> findVoucherByAmout();

    @Query("SELECT vc FROM Voucher vc WHERE vc.isDelete=false and vc.event.isDelete=false ")
    List<Voucher> findAllFalse();
}

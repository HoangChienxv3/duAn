package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Voucher;

public interface VoucherDao extends JpaRepository<Voucher, Long> {
	@Query("SELECT v FROM Voucher v WHERE v.amount > 0")
    List<Voucher> findVoucherByAmout();
	
    List<Voucher> findAll();

    Optional<Voucher> findByIdIsAndIsDeleteFalse(Long id);

    List<Voucher> findAllByIsDeleteFalse();

    List<Voucher> findAllByIdeventAndIsDeleteFalse(Long idEvent);
}

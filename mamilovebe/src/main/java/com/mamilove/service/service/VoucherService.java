package com.mamilove.service.service;

import com.mamilove.entity.Voucher;

import java.util.Optional;

public interface VoucherService {

    boolean existsById(Long id);

    Optional<Voucher> findById(Long id);
}

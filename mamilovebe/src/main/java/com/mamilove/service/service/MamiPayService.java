package com.mamilove.service.service;

import com.mamilove.entity.Mamipay;

import java.util.List;

public interface MamiPayService {
   List<Mamipay> fill();
   List<Mamipay> findAll();
   Mamipay ByCustomer(Long id);
   Mamipay create(Mamipay mamipay);
}

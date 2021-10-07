package com.mamilove.service.service;

import com.mamilove.entity.Mamipay;

import java.util.List;

public interface MamiPayService {
   List<Mamipay> fill();

   Mamipay ByCustomer(Long id);
}

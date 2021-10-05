package com.mamilove.dao;

import com.mamilove.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Mamipay;
import org.springframework.data.jpa.repository.Query;

public interface MamiPayDao extends JpaRepository<Mamipay, Long>{
    @Query("SELECT m FROM Mamipay m WHERE m.customer.id =?1")
    Mamipay BillByCustomer(Long id);
}

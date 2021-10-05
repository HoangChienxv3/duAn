package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Orderdetail;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDetailDao extends JpaRepository<Orderdetail, Long>{
    @Query("SELECT o FROM Orderdetail o WHERE o.bill.customer.id =?1")
    List<Orderdetail> AllByCustomer(Long id);
}

package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Bill;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BillDao extends JpaRepository<Bill, Long> {
    @Query("SELECT b FROM Bill b WHERE b.customer.id =?1")
    List<Bill> BillByCustomer(Long id);
}

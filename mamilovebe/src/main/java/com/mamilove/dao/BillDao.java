package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Bill;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BillDao extends JpaRepository<Bill, String> {
    @Query("SELECT b FROM Bill b WHERE b.idCustomer =?1")
    List<Bill> BillByCustomer(Long id);

    List<Bill> findAllByIdCustomerOrderByCreateAtDesc(Long id);
}

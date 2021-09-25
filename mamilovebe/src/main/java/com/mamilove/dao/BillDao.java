package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Bill;

public interface BillDao extends JpaRepository<Bill, Long>{

}

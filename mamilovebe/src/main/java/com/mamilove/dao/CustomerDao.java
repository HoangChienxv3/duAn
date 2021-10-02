package com.mamilove.dao;

import com.mamilove.entity.Bill;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Customer;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CustomerDao extends JpaRepository<Customer, Long>{
}

package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Customer;

public interface CustomerDao extends JpaRepository<Customer, Long>{

}
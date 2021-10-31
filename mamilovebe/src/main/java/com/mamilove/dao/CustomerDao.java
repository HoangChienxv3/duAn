package com.mamilove.dao;

import com.mamilove.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Customer;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CustomerDao extends JpaRepository<Customer, Long>{

    @Query("select c from Customer c " +
            "where c.account.username = ?1 ")
    List<Customer> findByAccount(String username);

}

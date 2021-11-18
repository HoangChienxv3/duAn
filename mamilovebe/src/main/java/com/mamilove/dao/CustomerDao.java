package com.mamilove.dao;

import com.mamilove.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Customer;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface CustomerDao extends JpaRepository<Customer, Long>{

    @Query("select c from Customer c " +
            "where c.account.id = ?1 ")
    Customer findByAccount(Long idAccout);

    Customer findByIdaccount(Long id);

    @Query("select c from Customer c where c.isDelete = false and c.account.isDelete=false ")
    List<Customer> findAllFalse();

}

package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Orderdetail;

public interface OrderDetailDao extends JpaRepository<Orderdetail, Long>{

}

package com.mamilove.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;

public interface QuantityDao extends JpaRepository<Quantity, Long>{
	List<Quantity> findAll();
	List<Quantity> findByProduct(Product product);
}

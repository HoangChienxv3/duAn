package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Image;
import com.mamilove.entity.Product;

public interface ImageDao extends JpaRepository<Image, Long>{
	List<Image> findAll();
	List<Image> findByProduct(Product product);
}

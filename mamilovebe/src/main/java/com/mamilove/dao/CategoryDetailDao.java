package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Categorydetail;

public interface CategoryDetailDao extends JpaRepository<Categorydetail, Long>{
	List<Categorydetail> findAll();
	Optional<Categorydetail> findById(Long id);
	Categorydetail saveAndFlush(Categorydetail categoryDetail);
	void delete(Categorydetail categoryDetail);
}

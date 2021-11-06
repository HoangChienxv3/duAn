package com.mamilove.service.service;

import java.util.List;
import java.util.Optional;

import com.mamilove.entity.Categorydetail;

public interface CategoryDetailService {
	List<Categorydetail> findAll();
	Optional<Categorydetail> findById(Long id);
	Categorydetail saveAndFlush(Categorydetail categoryDetail);
	List<Categorydetail> saveAll(List<Categorydetail> categoryDetail);
	void delete(Categorydetail categoryDeatail);
	void deleteInBatch(List<Categorydetail> categoryDetail);
}

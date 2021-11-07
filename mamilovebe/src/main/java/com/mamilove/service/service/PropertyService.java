package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Property;

public interface PropertyService {
	List<Property> findAll();
	List<Property> saveAll(List<Property> property);
	void deleteInBatch(List<Property> property);
}

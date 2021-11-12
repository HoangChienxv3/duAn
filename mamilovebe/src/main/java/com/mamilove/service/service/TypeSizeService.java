package com.mamilove.service.service;

import java.util.List;
import java.util.Optional;

import com.mamilove.entity.Typesize;
import com.mamilove.request.dto.TypeSizeRequest;

public interface TypeSizeService {
	List<Typesize> findAll();
	Optional<Typesize> findById(Long id);
	List<Typesize> saveAll(List<Typesize> typeSize);
	void deleteInBatch(List<Typesize> typeSize);

	Typesize create(TypeSizeRequest typeSizeRequest);

	Typesize update(Long id, TypeSizeRequest typeSizeRequest);

	Typesize delete(Long id);
}

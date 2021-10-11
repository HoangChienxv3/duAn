package com.mamilove.service.service;

import java.util.List;
import java.util.Optional;

import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;

public interface TypeSizeService {
	List<Typesize> findAll();
	Optional<Typesize> findById(Long id);
}

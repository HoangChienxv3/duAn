package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;

public interface SizeService {
	List<Size> findAll();
	List<Size> findByTypeSize(Typesize typeSize);
}

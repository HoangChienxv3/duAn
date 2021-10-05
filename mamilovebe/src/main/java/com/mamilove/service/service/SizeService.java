package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Size;

public interface SizeService {
	List<Size> findByName(String name);
}

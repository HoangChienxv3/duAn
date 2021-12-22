package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Authority;

public interface AuthorityService {
	List<Authority> findAllByIsDeleteFalse();

	List<Authority> saveAll(List<Authority> authority);
}

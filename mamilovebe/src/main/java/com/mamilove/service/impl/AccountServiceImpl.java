package com.mamilove.service.impl;

import java.util.List;
import java.util.Optional;

import com.mamilove.dao.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.mamilove.entity.Account;
import com.mamilove.service.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	AccountDao accountDao;

	@Override
	public <S extends Account> S save(S entity) {
		return accountDao.save(entity);
	}

	@Override
	public List<Account> findAll() {
		return accountDao.findAll();
	}
	@Override
	public Optional<Account> findById(Long id) {
		return accountDao.findById(id);
	}
	@Override
	public boolean existsById(Long id) {
		return accountDao.existsById(id);
	}

}

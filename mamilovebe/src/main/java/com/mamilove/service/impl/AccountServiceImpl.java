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
	//
	@Override
	public Optional<Account> findByUsername(String username) {
		return accountDao.findByUsername(username);
	}

	@Override
	public Optional<Account> findByEmail(String email) {
		return accountDao.findByEmail(email);
	}
//
	@Override
	public <S extends Account> S save(S entity) {
		return accountDao.save(entity);
	}
	@Override
	public <S extends Account> Optional<S> findOne(Example<S> example) {
		return accountDao.findOne(example);
	}

	@Override
	public Page<Account> findAll(Pageable pageable) {
		return accountDao.findAll(pageable);
	}

	@Override
	public List<Account> findAll() {
		return accountDao.findAll();
	}

	@Override
	public List<Account> findAll(Sort sort) {
		return accountDao.findAll(sort);
	}

	@Override
	public List<Account> findAllById(Iterable<Long> ids) {
		return accountDao.findAllById(ids);
	}

	@Override
	public Optional<Account> findById(Long id) {
		return accountDao.findById(id);
	}

	@Override
	public <S extends Account> List<S> saveAll(Iterable<S> entities) {
		return accountDao.saveAll(entities);
	}

	@Override
	public void flush() {
		accountDao.flush();
	}

	@Override
	public <S extends Account> S saveAndFlush(S entity) {
		return accountDao.saveAndFlush(entity);
	}

	@Override
	public boolean existsById(Long id) {
		return accountDao.existsById(id);
	}

	@Override
	public <S extends Account> List<S> saveAllAndFlush(Iterable<S> entities) {
		return accountDao.saveAllAndFlush(entities);
	}

	@Override
	public <S extends Account> Page<S> findAll(Example<S> example, Pageable pageable) {
		return accountDao.findAll(example, pageable);
	}

	@Override
	public void deleteInBatch(Iterable<Account> entities) {
		accountDao.deleteInBatch(entities);
	}

	@Override
	public <S extends Account> long count(Example<S> example) {
		return accountDao.count(example);
	}

	@Override
	public <S extends Account> boolean exists(Example<S> example) {
		return accountDao.exists(example);
	}

	@Override
	public void deleteAllInBatch(Iterable<Account> entities) {
		accountDao.deleteAllInBatch(entities);
	}

	@Override
	public long count() {
		return accountDao.count();
	}

	@Override
	public void deleteById(Long id) {
		accountDao.deleteById(id);
	}

	@Override
	public void deleteAllByIdInBatch(Iterable<Long> ids) {
		accountDao.deleteAllByIdInBatch(ids);
	}

	@Override
	public void delete(Account entity) {
		accountDao.delete(entity);
	}

	@Override
	public void deleteAllById(Iterable<? extends Long> ids) {
		accountDao.deleteAllById(ids);
	}

	@Override
	public void deleteAllInBatch() {
		accountDao.deleteAllInBatch();
	}

	@Override
	public Account getOne(Long id) {
		return accountDao.getOne(id);
	}

	@Override
	public void deleteAll(Iterable<? extends Account> entities) {
		accountDao.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		accountDao.deleteAll();
	}

	@Override
	public Account getById(Long id) {
		return accountDao.getById(id);
	}

	@Override
	public <S extends Account> List<S> findAll(Example<S> example) {
		return accountDao.findAll(example);
	}

	@Override
	public <S extends Account> List<S> findAll(Example<S> example, Sort sort) {
		return accountDao.findAll(example, sort);
	}


	
}

package com.mamilove.service.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.mamilove.dao.AccountDao;
import com.mamilove.entity.Account;

public interface AccountService {

	<S extends Account> List<S> findAll(Example<S> example, Sort sort);

	<S extends Account> List<S> findAll(Example<S> example);

	Account getById(Long id);

	void deleteAll();

	void deleteAll(Iterable<? extends Account> entities);

	Account getOne(Long id);

	void deleteAllInBatch();

	void deleteAllById(Iterable<? extends Long> ids);

	void delete(Account entity);

	void deleteAllByIdInBatch(Iterable<Long> ids);

	void deleteById(Long id);

	long count();

	void deleteAllInBatch(Iterable<Account> entities);

	<S extends Account> boolean exists(Example<S> example);

	<S extends Account> long count(Example<S> example);

	void deleteInBatch(Iterable<Account> entities);

	<S extends Account> Page<S> findAll(Example<S> example, Pageable pageable);

	<S extends Account> List<S> saveAllAndFlush(Iterable<S> entities);

	boolean existsById(Long id);

	<S extends Account> S saveAndFlush(S entity);

	void flush();

	<S extends Account> List<S> saveAll(Iterable<S> entities);

	Optional<Account> findById(Long id);

	List<Account> findAllById(Iterable<Long> ids);

	List<Account> findAll(Sort sort);

	List<Account> findAll();

	Page<Account> findAll(Pageable pageable);

	<S extends Account> Optional<S> findOne(Example<S> example);

	<S extends Account> S save(S entity);

	//

	Optional<Account> findByUsername(String username);

	Optional<Account> findByEmail(String email);
	//
	Boolean existsByUsername(String username);

	Boolean existsByEmail(String email);

}

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
	boolean existsById(Long id);
	List<Account> findAll();
	<S extends Account> S save(S entity);


	Optional<Account> findById(Long id);


}

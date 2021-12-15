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
public class AccountServiceImpl implements AccountService {

    @Autowired
    AccountDao accountDao;

    @Override
    public <S extends Account> S save(S entity) {
        return accountDao.save(entity);
    }

    @Override
    public Boolean existsByEmail(String email) {
        return accountDao.existsByEmail(email);
    }

    @Override
    public Boolean existsByUsername(String username) {
        return accountDao.existsByUsername(username);
    }

    @Override
    public List<Account> findAll() {
        return accountDao.findAll();
    }

    @Override
    public Account findById(Long id) {
        return accountDao.findById(id).get();
    }

    @Override
    public List<Account> findAllByIsDeleteFalse() {
        return accountDao.findAllByIsDeleteFalse();
    }

    @Override
    public boolean existsById(Long id) {
        return accountDao.existsById(id);
    }

}

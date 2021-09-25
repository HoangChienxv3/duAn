package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.AccountDao;
import com.mamilove.service.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	AccountDao accountDao;

	
}

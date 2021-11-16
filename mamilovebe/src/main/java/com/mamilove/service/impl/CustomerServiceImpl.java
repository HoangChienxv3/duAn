package com.mamilove.service.impl;

import com.mamilove.entity.Account;
import com.mamilove.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.CustomerDao;
import com.mamilove.service.service.CustomerService;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao customerDao;


	@Override
	public Customer findByAccount(Long idAccout) {
		return customerDao.findByAccount(idAccout);
	}

	@Override
	public List<Customer> findAllFalse() {
		return customerDao.findAllFalse();
	}

	@Override
	public Customer findById(Long id) {
		return customerDao.findById(id).get();
	}

	@Override
	public Customer update(Customer ct) {
		return customerDao.save(ct);
	}
}

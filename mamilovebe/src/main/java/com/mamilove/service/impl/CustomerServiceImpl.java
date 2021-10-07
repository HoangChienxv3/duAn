package com.mamilove.service.impl;

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
}

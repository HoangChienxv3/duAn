package com.mamilove.vnpay;

import com.mamilove.dao.CustomerDao;
import com.mamilove.entity.Account;
import com.mamilove.entity.Customer;
import com.mamilove.entity.Mamipay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.MamiPayDao;

import java.util.List;

@Service
public class MamipayServiceImpl implements MamiPayService{

	@Autowired
	MamiPayDao mamiPayDao;

	@Autowired
	CustomerDao customerDao;

	@Override
	public List<Mamipay> fill() {
		return mamiPayDao.findAll();
	}

	@Override
	public List<Mamipay> findAll() {
		return mamiPayDao.findAll();
	}

	@Override
	public Mamipay ByCustomer(Long id) {
		return mamiPayDao.BillByCustomer(id);
	}

	@Override
	public Mamipay create(Mamipay mamipay) {
		return mamiPayDao.save(mamipay);
	}

	@Override
	public Mamipay getMamiPayCustomer(Long authUID) {
		Customer customer =  customerDao.findByIdaccount(authUID);

		return mamiPayDao.BillByCustomer(customer.getId());
	}

	@Override
	public Mamipay creteMamiPay(Long authUID) {
		Customer customer =  customerDao.findByIdaccount(authUID);

		Mamipay mamipay = new Mamipay();
		mamipay.setSurplus(0d);
		mamipay.setIdcustomer(customer.getId());

		return mamiPayDao.save(mamipay);
	}
}

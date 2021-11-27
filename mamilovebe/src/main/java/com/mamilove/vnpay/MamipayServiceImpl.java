package com.mamilove.vnpay;

import com.mamilove.dao.CustomerDao;
import com.mamilove.entity.Account;
import com.mamilove.entity.Customer;
import com.mamilove.entity.Mamipay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.mamilove.dao.MamiPayDao;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@Service
public class MamipayServiceImpl implements MamiPayService{

	@Autowired
	MamiPayDao mamiPayDao;


	@Autowired
	CustomerDao customerDao;

//	@Override
//	public List<Mamipay> fill() {
//		return mamiPayDao.findAll();
//	}

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
	public Mamipay createMamiPay(Long authUID) {
		Customer customer =  customerDao.findByIdaccount(authUID);

		Optional<Mamipay> mamipayOptional = mamiPayDao.findByIdcustomer(customer.getId());
		if (mamipayOptional.isPresent()){
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Đã có ví");
		}

		Mamipay mamipay = new Mamipay();
		mamipay.setSurplus(0d);
		mamipay.setIdcustomer(customer.getId());

		return mamiPayDao.save(mamipay);
	}

	@Override
	public Mamipay MamipayIdCt(Long id) {
		return mamiPayDao.MamipayIdCt(id);
	}

	@Override
	public Mamipay finById(Long id) {
		return mamiPayDao.findById(id).get();
	}
}

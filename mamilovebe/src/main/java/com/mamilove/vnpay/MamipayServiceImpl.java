package com.mamilove.vnpay;

import com.mamilove.entity.Mamipay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.MamiPayDao;

import java.util.List;

@Service
public class MamipayServiceImpl implements MamiPayService{

	@Autowired
	MamiPayDao mamiPayDao;



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
	public Mamipay MamipayIdCt(Long id) {
		return mamiPayDao.MamipayIdCt(id);
	}

	@Override
	public Mamipay finById(Long id) {
		return mamiPayDao.findById(id).get();
	}
}

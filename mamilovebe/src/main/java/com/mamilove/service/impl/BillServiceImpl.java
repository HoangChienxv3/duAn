package com.mamilove.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.dao.OrderDetailDao;
import com.mamilove.entity.Bill;
import com.mamilove.entity.Orderdetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.BillDao;
import com.mamilove.service.service.BillService;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BillServiceImpl implements BillService{

	@Autowired
	BillDao billDao;
	@Autowired
	OrderDetailDao orderDetailDao;
	@Override
	public List<Bill> BillByCustomer(Long id) {
		return billDao.BillByCustomer(id);
	}

	@Override
	public List<Bill> FinAll() {
		return billDao.findAll();
	}

	@Override
	public boolean existsById(Long id) {
		return billDao.existsById(id);
	}

	@Override
	public Bill save(JsonNode entity) {
		ObjectMapper mapper = new ObjectMapper();
		Bill bill = mapper.convertValue(entity, Bill.class);
		billDao.save(bill);
		TypeReference<List<Orderdetail>> type = new  TypeReference<List<Orderdetail>>() {};
		List<Orderdetail> detail = mapper.convertValue(entity.get("orderdetails"),type)
				.stream().peek(d -> d.setBill(bill)).collect(Collectors.toList());
		orderDetailDao.saveAll(detail);
		return bill;
	}
}

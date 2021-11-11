package com.mamilove.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.mamilove.request.dto.CreateQuantityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.QuantityDao;
import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.service.service.QuantityService;

@Service
public class QuantityServiceImpl implements QuantityService{

	@Autowired
	QuantityDao quantityDao;

	@Override
	public List<Quantity> findAll() {
		// TODO Auto-generated method stub
		return quantityDao.findAll();
	}

	@Override
	public List<Quantity> findByProduct(Product product) {
		// TODO Auto-generated method stub
		return quantityDao.findByProduct(product);
	}

	@Override
	public List<Quantity> createQty(Long idpoduct, Long idsize, CreateQuantityDto createQuantity) {
		List<Quantity> quantities = new ArrayList<>();
		createQuantity.getPropertyrequests().forEach(property -> {
			Quantity quantity = new Quantity();
			Optional<Quantity> qty = quantityDao.checkQty(idsize,property.getIdproperty(),idpoduct);
			if(qty.isPresent()){
				quantity = qty.get();
			} else {
				quantity.setIdProduct(idpoduct);
				quantity.setIdsize(idsize);
				quantity.setIdproperty(property.getIdproperty());
			}
			quantity.setQuantity(property.getQuantity());

			quantities.add(quantity);

		});
		return quantityDao.saveAll(quantities);
	}


}

package com.mamilove.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.mamilove.request.dto.CreateQuantityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.mamilove.dao.QuantityDao;
import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.service.service.QuantityService;
import org.springframework.web.server.ResponseStatusException;

@Service
public class QuantityServiceImpl implements QuantityService {

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
        return quantityDao.findByProductAndIsDeleteFalse(product);
    }

    @Override
	public List<Quantity> findAllByIsDeleteFalse() {
		// TODO Auto-generated method stub
		return quantityDao.findAllByIsDeleteFalse();
	}
    
    @Override
    public List<Quantity> createQty(CreateQuantityDto createQuantity) {
        List<Quantity> quantities = new ArrayList<>();
        createQuantity.getPropertyrequests().forEach(property -> {
            Quantity quantity = new Quantity();
            Optional<Quantity> qty = quantityDao.checkQty(createQuantity.getIdsize(), property.getIdproperty(), createQuantity.getIdpoduct());
            if (qty.isPresent()) {
                quantity = qty.get();
            } else {
                quantity.setIdProduct(createQuantity.getIdpoduct());
                quantity.setIdsize(createQuantity.getIdsize());
                quantity.setIdproperty(property.getIdproperty());
            }
            quantity.setIsDelete(false);
            quantity.setQuantity(property.getQuantity());

            quantities.add(quantity);

        });
        return quantityDao.saveAll(quantities);
    }

    @Override
    public Quantity deleteQty(Long idqty) {
        Quantity quantity = quantityDao.findById(idqty).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Kh??ng t??m th???y quantity");
        });
        quantity.setIsDelete(true);

        return quantityDao.save(quantity);
    }

    @Override
    public Quantity quantityReady(Long idproduct, Long idsize, Long idproperty) {
        Optional<Quantity> quantity = quantityDao.checkQty(idsize, idproperty, idproduct);
        return quantity.orElse(null);
    }

}

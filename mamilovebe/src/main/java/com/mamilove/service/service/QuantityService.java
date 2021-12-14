package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import com.mamilove.request.dto.CreateQuantityDto;

public interface QuantityService {
    List<Quantity> findAll();
    
    List<Quantity> findAllByIsDeleteFalse();

    List<Quantity> findByProduct(Product product);

    List<Quantity> createQty(CreateQuantityDto createQuantity);

    Quantity quantityReady(Long idproduct, Long idsize, Long idproperty);

    Quantity deleteQty(Long idqty);
}

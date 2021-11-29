package com.mamilove.service.service;

import java.util.List;

import com.mamilove.entity.Categorydetail;
import com.mamilove.entity.Product;

public interface ProductService {
    List<Product> findAll();

    Product findById(Long id);

    List<Product> findProductNew();

    List<Product> findByCategoryDetail(Categorydetail categoryDetail);

    Product saveAndFlush(Product product);

    <S extends Product> List<S> saveAll(Iterable<S> entities);

    void delete(Product product);

    Product create(Product product);

    List<Product> findAllFalse();
}

package com.mamilove.service.service;

import java.util.List;
import java.util.Optional;

import com.mamilove.entity.Categorydetail;

public interface CategoryDetailService {
    List<Categorydetail> findAll();
    
    List<Categorydetail> findAllByIsDeleteFalse();

    Optional<Categorydetail> findById(Long id);

    List<Categorydetail> getAllListDetailCategory();

    List<Categorydetail> listCategoryDetailById(Long id);

    Categorydetail saveAndFlush(Categorydetail categoryDetail);

    List<Categorydetail> saveAll(List<Categorydetail> categoryDetail);

    void delete(Categorydetail categoryDetail);

    void deleteInBatch(List<Categorydetail> categoryDetail);

    Categorydetail findByIds(Long id);
}

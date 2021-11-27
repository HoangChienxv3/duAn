package com.mamilove.service.service;

import java.util.List;
import java.util.Optional;

import com.mamilove.entity.Category;

public interface CategoryService {
    List<Category> findAll();

    List<Category> getAllListCategory();

    Optional<Category> findById(Long id);

    List<Category> listCategoryById(Long id);

    List<Category> saveAll(List<Category> category);

    <S extends Category> S save(S entity);

    void delete(Category category);

    void deleteInBatch(List<Category> category);
}

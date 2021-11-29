package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Categorydetail;

public interface CategoryDetailDao extends JpaRepository<Categorydetail, Long> {
    @Query("SELECT b FROM Categorydetail b WHERE b.isDelete = false ")
    List<Categorydetail> listCategoryDetailIsDeleteFalse();

    @Query("SELECT b FROM Categorydetail b WHERE b.id = ?1  AND b.isDelete = false ")
    List<Categorydetail> listCategoryDetailById(Long id);

    List<Categorydetail> findAll();

    Optional<Categorydetail> findById(Long id);

    Categorydetail saveAndFlush(Categorydetail categoryDetail);

    void delete(Categorydetail categoryDetail);
}

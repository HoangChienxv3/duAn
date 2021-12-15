package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Typesize;

public interface TyperSizeDao extends JpaRepository<Typesize, Long> {
    List<Typesize> findAll();
    
    List<Typesize> findAllByIsDeleteFalse();

    Optional<Typesize> findById(Long id);

    Optional<Typesize> findByName(String name);

}

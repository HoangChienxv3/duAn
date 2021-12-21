package com.mamilove.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Authority;
import com.mamilove.entity.Category;

public interface AuthorityDao extends JpaRepository<Authority, Long> {
    List<Authority> findAllByIsDeleteFalse();
}

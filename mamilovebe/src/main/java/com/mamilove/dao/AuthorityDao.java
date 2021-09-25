package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Authority;

public interface AuthorityDao extends JpaRepository<Authority, Long> {

}

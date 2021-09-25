package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Property;

public interface PropertyDao extends JpaRepository<Property, Long>{

}

package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Role;

public interface RoleDao extends JpaRepository<Role, Long>{
	
}

package com.mamilove.dao;

import com.mamilove.common.ERole;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleDao extends JpaRepository<Role, String>{
    Optional<Role> findByName(String name);
}

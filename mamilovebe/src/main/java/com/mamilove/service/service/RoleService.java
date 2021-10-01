package com.mamilove.service.service;

import com.mamilove.common.ERole;
import com.mamilove.entity.Role;

import java.util.Optional;

public interface RoleService {
    Optional<Role> findByName(String name);
}

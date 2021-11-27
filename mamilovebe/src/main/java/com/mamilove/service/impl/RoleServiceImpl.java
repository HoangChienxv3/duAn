package com.mamilove.service.impl;

import com.mamilove.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.RoleDao;
import com.mamilove.service.service.RoleService;

import java.util.Optional;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao roleDao;

    @Override
    public Optional<Role> findByName(String name) {
        return roleDao.findByName(name);
    }
}

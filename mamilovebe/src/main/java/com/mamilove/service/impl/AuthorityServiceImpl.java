package com.mamilove.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.AuthorityDao;
import com.mamilove.entity.Authority;
import com.mamilove.entity.Category;
import com.mamilove.service.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    AuthorityDao authorityDao;

	@Override
	public List<Authority> findAllByIsDeleteFalse() {
		// TODO Auto-generated method stub
		return authorityDao.findAllByIsDeleteFalse();
	}
	
	@Override
    @Transactional
    public List<Authority> saveAll(List<Authority> authority) {
        // TODO Auto-generated method stub
        return authorityDao.saveAll(authority);
    }

}

package com.mamilove.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.PropertyDao;
import com.mamilove.entity.Property;
import com.mamilove.service.service.PropertyService;

@Service
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    PropertyDao propertyDao;

    @Override
    public List<Property> findAll() {
        // TODO Auto-generated method stub
        return propertyDao.findAll();
    }

    @Override
    @Transactional
    public List<Property> saveAll(List<Property> property) {
        // TODO Auto-generated method stub
        return propertyDao.saveAll(property);
    }

    @Override
    @Transactional
    public void deleteInBatch(List<Property> property) {
        // TODO Auto-generated method stub
        propertyDao.deleteAllInBatch(property);
    }

}

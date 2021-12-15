package com.mamilove.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.CategoryDetailDao;
import com.mamilove.entity.Categorydetail;
import com.mamilove.service.service.CategoryDetailService;

@Service
public class CategoryDetailServiceImpl implements CategoryDetailService {

    @Autowired
    CategoryDetailDao categoryDetailDao;

    @Override
    public List<Categorydetail> findAll() {
        return categoryDetailDao.findAll();
    }

    @Override
	public List<Categorydetail> findAllByIsDeleteFalse() {
		// TODO Auto-generated method stub
		return categoryDetailDao.findAllByIsDeleteFalse();
	}

    
    @Override
    public Optional<Categorydetail> findById(Long id) {
        // TODO Auto-generated method stub
        return categoryDetailDao.findById(id);
    }

    @Override
    @Transactional
    public Categorydetail saveAndFlush(Categorydetail categoryDetail) {
        // TODO Auto-generated method stub
        return categoryDetailDao.saveAndFlush(categoryDetail);
    }

    @Override
    @Transactional
    public List<Categorydetail> saveAll(List<Categorydetail> categoryDetail) {
        // TODO Auto-generated method stub
        return categoryDetailDao.saveAll(categoryDetail);
    }

    @Override
    @Transactional
    public void delete(Categorydetail categoryDetail) {
        // TODO Auto-generated method stub
        categoryDetailDao.delete(categoryDetail);
    }

    @Override
    @Transactional
    public void deleteInBatch(List<Categorydetail> categoryDetail) {
        // TODO Auto-generated method stub
        categoryDetailDao.deleteInBatch(categoryDetail);
    }

    @Override
    public Categorydetail findByIds(Long id) {
        return null;
    }

    public List<Categorydetail> getAllListDetailCategory() {
        return categoryDetailDao.listCategoryDetailIsDeleteFalse();
    }

    @Override
    @Transactional
    public List<Categorydetail> listCategoryDetailById(Long id) {
        return categoryDetailDao.listCategoryDetailById(id);
    }

}

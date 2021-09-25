package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Image;

public interface ImageDao extends JpaRepository<Image, Long>{

}

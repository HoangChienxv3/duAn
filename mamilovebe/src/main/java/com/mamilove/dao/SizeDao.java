package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Size;

public interface SizeDao extends JpaRepository<Size, Long>{
	List<Size> findByName(String name);
}

package com.mamilove.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mamilove.entity.Category;
import com.mamilove.entity.Categorydetail;

public interface CategoryDao extends JpaRepository<Category, Long>{
	List<Category> findAll();
//	@Query("SELECT * \r\n"
//			+ "FROM\r\n"
//			+ "    Category \r\n"
//			+ "    INNER JOIN Categorydetail ON Category.id = Categorydetail.idcategory")
//	List<Categorydetail> listMenu();
}

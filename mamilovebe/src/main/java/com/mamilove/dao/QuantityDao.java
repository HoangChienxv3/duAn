package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Product;
import com.mamilove.entity.Quantity;
import org.springframework.data.jpa.repository.Query;

public interface QuantityDao extends JpaRepository<Quantity, Long>{
	List<Quantity> findAll();
	List<Quantity> findByProductAndIsDeleteFalse(Product product);

	List<Quantity> findAllByIsDeleteFalse();

	@Query("select q from Quantity q " +
			" where q.idsize = ?1 AND q.idproperty = ?2 and q.idProduct = ?3")
	Optional<Quantity> checkQty(Long idsize, Long idproperty, Long idProduct);


}

package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mamilove.entity.Categorydetail;
import com.mamilove.entity.Product;

public interface ProductDao extends JpaRepository<Product, Long>{
	List<Product> findAll();
	Optional<Product> findById(Long id);
	@Query("SELECT p FROM Product p ORDER BY day_update DESC")
	List<Product> findProductNew();
	List<Product> findByCategorydetail(Categorydetail categorydetail);
	Product saveAndFlush(Product product);
	<S extends Product> List<S> saveAll(Iterable<S> entities);
	void delete(Product product);
	void deleteInBatch(Iterable<Product> product);

	List<Product> findAllByIsDeleteFalse();
public interface ProductDao extends JpaRepository<Product, Long> {
    List<Product> findAll();

    Optional<Product> findById(Long id);

    @Query("SELECT p FROM Product p WHERE p.isDelete=false")
    List<Product> findProductNew();

    List<Product> findByCategorydetail(Categorydetail categorydetail);

    Product saveAndFlush(Product product);

    <S extends Product> List<S> saveAll(Iterable<S> entities);

    void delete(Product product);

    void deleteInBatch(Iterable<Product> product);

    @Query("SELECT p FROM Product p where p.isDelete=false and p.categorydetail.isDelete=false ")
    List<Product> findAllFalse();

}

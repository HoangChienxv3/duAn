package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import com.mamilove.entity.Bill;
import org.hibernate.sql.Select;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Image;
import com.mamilove.entity.Product;
import org.springframework.data.jpa.repository.Query;

public interface ImageDao extends JpaRepository<Image, Long> {
    List<Image> findAll();
    List<Image> findByProduct(Product product);

    @Query("Select b FROM Image b WHERE b.product.id = ?1 AND b.isDelete = False")
    List<Image> ListImagesByProduct(Long idProduct);


}

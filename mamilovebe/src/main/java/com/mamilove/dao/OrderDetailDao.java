package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Orderdetail;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailDao extends JpaRepository<Orderdetail, Long>{
    @Query("SELECT o FROM Orderdetail o WHERE o.bill.customer.id =?1")
    List<Orderdetail> AllByCustomer(Long id);

    @Query("select o from Orderdetail o where " +
            " o.bill.isDelete = false and o.idbill = ?1")
    List<Orderdetail> getListOrderDetail(String id);
}

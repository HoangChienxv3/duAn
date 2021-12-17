package com.mamilove.dao;

import com.mamilove.common.EnumStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Orderdetail;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.TemporalType;
import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

@Repository
public interface OrderDetailDao extends JpaRepository<Orderdetail, Long> {
    @Query("SELECT o FROM Orderdetail o WHERE o.bill.customer.id =?1")
    List<Orderdetail> AllByCustomer(Long id);

    @Query("select o from Orderdetail o where " +
            " o.bill.isDelete = false and o.idbill = ?1")
    List<Orderdetail> getListOrderDetail(String id);

    @Query("select o.quantity.product.name as name, sum(o.quantitydetail) as qty,sum(o.intomoney) as intomoney " +
            " from Orderdetail o " +
            " where o.createAt >= ?1 and o.createAt <= ?2 " +
            " group by name " +
            " order by qty desc ")
    List<Object[]> getSumQtyProduct(Date start, Date end);

    @Query("select o.quantity.product.name as name, sum(o.quantitydetail) as qty,sum(o.intomoney) as intomoney " +
            " from Orderdetail o " +
            " where o.createAt >= ?1 and o.createAt <= ?2 " +
            " and o.bill.status = ?3" +
            " group by name " +
            " order by qty desc ")
    List<Object[]> getSumQtyProduct(Date start, Date end, EnumStatus status);
}

package com.mamilove.dao;

import com.mamilove.common.EnumRefund;
import com.mamilove.common.EnumStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Bill;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface BillDao extends JpaRepository<Bill, String> {

    List<Bill> findAllByIdCustomer(Long id);

    List<Bill> findAllByIdCustomerOrderByCreateAtDesc(Long id);

    @Query("select b from Bill b where " +
            " b.createAt >= ?1 and b.createAt < ?2 order by b.createAt desc ")
    List<Bill> findAllByStarAndEnd(Date star, Date end);

    @Query("select b from Bill b where " +
            " b.createAt >= ?1 and b.createAt < ?2  and b.status = ?3 order by b.createAt desc ")
    List<Bill> findAllByStarAndEnd(Date star, Date end, EnumStatus status);

    @Query("select sum (b.total) from Bill b where " +
            " b.createAt >= ?1 and b.createAt < ?2 order by b.createAt desc ")
    Double sumTotalMonthOfYear(Date star, Date end);

    @Query("select sum (b.total) from Bill b where " +
            " b.createAt >= ?1 and b.createAt < ?2 and b.status = ?3 order by b.createAt desc ")
    Double sumTotalMonthOfYear(Date star, Date end, EnumStatus status);

    @Query("select b from Bill b " +
            " where b.idCustomer = ?1 " +
            " group by b.address " +
            " order by b.id desc ")
    List<Bill> getAddress(Long idCustomer);

    @Query("select count (b.id) from Bill b " +
            " where b.updateAts >= ?1 and b.updateAts < ?2 and b.status = ?3")
    Long countBill(Date start, Date end, EnumStatus status);

    @Query("select count (b.id) from Bill b " +
            " where b.createAt >= ?1 and b.createAt < ?2")
    Long countBillNew(Date start, Date end);

    @Query("select count (b.id) from Bill b " +
            " where b.updateAts >= ?1 and b.updateAts < ?2 " +
            " and b.status = ?3 and b.refund = ?4")
    Long countBillRefund(Date start, Date end, EnumStatus status, EnumRefund refund);
}

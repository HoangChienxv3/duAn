package com.mamilove.dao;

import com.mamilove.common.EnumStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Bill;
import org.springframework.data.jpa.repository.Query;

import javax.xml.crypto.Data;
import java.time.LocalDate;
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

}

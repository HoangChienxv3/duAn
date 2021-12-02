package com.mamilove.dao;

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
            " b.createAt >= ?1 and b.createAt <= ?2 order by b.createAt desc ")
    List<Bill> findAllByStarAndEnd(Date star, Date end);

//    List<Bill> findAllByYear(String year);
}

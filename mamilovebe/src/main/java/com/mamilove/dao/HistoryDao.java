package com.mamilove.dao;

import com.mamilove.entity.History;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface HistoryDao extends JpaRepository<History, Long> {
    @Query("SELECT h FROM History h WHERE h.trading_code=?1 ")
   History FinbyTrading_code(Long trading_code);

    @Query("SELECT h FROM History h WHERE h.mamipay.idcustomer=?1 ")
    List<History> findAllByCustomerId(Long id);

}

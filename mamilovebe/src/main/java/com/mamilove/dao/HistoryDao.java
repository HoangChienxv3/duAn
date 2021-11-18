package com.mamilove.dao;

import com.mamilove.entity.History;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HistoryDao extends JpaRepository<History, Long> {
}

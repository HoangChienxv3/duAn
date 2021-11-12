package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mamilove.entity.Event;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EventDao extends JpaRepository<Event, Long> {
    @Query("SELECT ev FROM Event ev WHERE ev.isDelete=false")
    List<Event> findAllFalse();
}

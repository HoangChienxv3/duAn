package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Event;

public interface EventDao extends JpaRepository<Event, Long>{

}

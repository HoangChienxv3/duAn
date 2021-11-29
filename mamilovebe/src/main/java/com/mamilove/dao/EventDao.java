package com.mamilove.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mamilove.entity.Event;

import java.util.List;
import java.util.Optional;

public interface EventDao extends JpaRepository<Event, Long> {
    List<Event> findAllByIsDeleteFalse();

    Optional<Event> findByIdAndIsDeleteFalse(Long id);
}

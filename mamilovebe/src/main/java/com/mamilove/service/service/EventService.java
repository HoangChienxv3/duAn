package com.mamilove.service.service;

import com.mamilove.entity.Event;

import java.util.List;

public interface EventService {
    List<Event> findAllFalse();

    Event create(Event event);

    Event findById(Long id);
}

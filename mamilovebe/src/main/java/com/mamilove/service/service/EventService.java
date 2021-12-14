package com.mamilove.service.service;

import com.mamilove.entity.Category;
import com.mamilove.entity.Event;
import com.mamilove.request.dto.EventRequest;

import java.text.ParseException;
import java.util.List;

public interface EventService {

    Event create(EventRequest eventRequest) throws ParseException;

    Event update(Long id, EventRequest eventRequest) throws ParseException;

    Event detele(Long id);

    List<Event> findAll();
    
    List<Event> findAllByIsDeleteFalse();

    Event findById(Long id);
}

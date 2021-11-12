package com.mamilove.service.impl;

import com.mamilove.entity.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.EventDao;
import com.mamilove.service.service.EventService;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    EventDao eventDao;

    @Override
    public List<Event> findAllFalse() {
        return eventDao.findAllFalse();
    }

    @Override
    public Event create(Event event) {
        return eventDao.save(event);
    }

    @Override
    public Event findById(Long id) {
        return eventDao.findById(id).get();
    }
}

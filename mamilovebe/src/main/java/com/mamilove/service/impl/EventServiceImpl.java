package com.mamilove.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mamilove.entity.Event;
import com.mamilove.request.dto.EventRequest;
import com.mamilove.utils.CompareDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.mamilove.dao.EventDao;
import com.mamilove.service.service.EventService;
import org.springframework.web.server.ResponseStatusException;

import java.text.ParseException;
import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    EventDao eventDao;

    @Autowired
    ObjectMapper objectMapper;

    @Override
    public Event create(EventRequest eventRequest) throws ParseException {
        Event event = objectMapper.convertValue(eventRequest, Event.class);
        if (eventRequest.getName() == null || eventRequest.getName().length() == 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Bạn chưa nhập tên sự kiện");
        }
        if (eventRequest.getEndday() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Bạn chưa nhập ngày kết thúc");
        }
        if (CompareDate.compareDate(event.getStartday(), event.getEndday()) > 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Ngày kết thúc phải lớn hơn hiện tại");
        }
        return eventDao.save(event);
    }

    @Override
    public Event update(Long id, EventRequest eventRequest) throws ParseException {
        Event event = eventDao.findById(id).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy sự kiện");
        });
        event.setName(eventRequest.getName());

        if (eventRequest.getEndday() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Bạn chưa nhập ngày kết thúc");
        }
        if (CompareDate.compareDate(event.getStartday(), event.getEndday()) > 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Ngày kết thúc phải lớn hơn ngày bắt đầu tại");
        }
        event.setEndday(eventRequest.getEndday());

        return eventDao.save(event);
    }

    @Override
    public Event detele(Long id) {
        Event event = eventDao.findById(id).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy sự kiện");
        });
        event.setIsDelete(true);
        return eventDao.save(event);
    }

    @Override
    public List<Event> findAll() {
        return eventDao.findAll();
    }

    @Override
	public List<Event> findAllByIsDeleteFalse() {
		// TODO Auto-generated method stub
		return eventDao.findAllByIsDeleteFalse();
	}
    
    @Override
    public Event findById(Long id) {
        return eventDao.findByIdAndIsDeleteFalse(id).orElseThrow(() -> {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không tìm thấy sự kiện");
        });

    }
}

package com.mamilove.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mamilove.dao.EventDao;
import com.mamilove.service.service.EventService;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao eventDao;
	
}

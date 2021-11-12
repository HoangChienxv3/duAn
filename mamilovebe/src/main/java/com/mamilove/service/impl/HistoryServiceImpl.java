package com.mamilove.service.impl;

import com.mamilove.dao.HistoryDao;
import com.mamilove.entity.History;
import com.mamilove.service.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HistoryServiceImpl implements HistoryService {
    @Autowired
    HistoryDao historyDao;

    @Override
    public History creat(History history) {
        return historyDao.save(history);
    }
}

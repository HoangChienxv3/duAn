package com.mamilove.vnpay;

import com.mamilove.entity.History;

import java.util.List;

public interface HistoryService {
    History creat(History history);

    History FinbyTrading_code(Long trading_code);

    List<History> findAll();
}

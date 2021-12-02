package com.mamilove.service.service;

import com.mamilove.response.dto.EveryDayResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StatisService {
    List<EveryDayResponse> revenueEveryDayOfTheMonth(Integer year, Integer mount);
//    List<EveryDayResponse> revenueEveryMonthOfTheYear(Integer year);
}

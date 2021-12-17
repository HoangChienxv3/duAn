package com.mamilove.service.service;

import com.mamilove.common.EnumStatus;
import com.mamilove.request.dto.QtyByDayRequest;
import com.mamilove.response.dto.EveryDayResponse;
import com.mamilove.response.dto.EveryMonthResponse;
import com.mamilove.response.dto.SumQtyProductResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface StatisService {
    List<EveryDayResponse> revenueEveryDayOfTheMonth(Integer year, Integer mount, EnumStatus status);

    List<EveryMonthResponse> getEveryMonthOfTheYear(Integer year, EnumStatus status);

    List<SumQtyProductResponse> quantityByDay(QtyByDayRequest qtyByDayRequest);

    List<SumQtyProductResponse> quantityByMonth(EnumStatus status);
}

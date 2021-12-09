package com.mamilove.service.impl;

import com.mamilove.common.EnumStatus;
import com.mamilove.dao.BillDao;
import com.mamilove.dao.OrderDetailDao;
import com.mamilove.entity.Bill;
import com.mamilove.response.dto.EveryDayResponse;
import com.mamilove.response.dto.EveryMonthResponse;
import com.mamilove.service.service.StatisService;
import com.mamilove.utils.LocalDateUtils;
import net.time4j.PlainDate;
import net.time4j.range.CalendarMonth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class StatisServiceImpl implements StatisService {

    @Autowired
    BillDao billDao;

    @Autowired
    OrderDetailDao orderDetailDao;

    public List<Bill> getListBill(Date star, Date end, EnumStatus status) {
        return status == null ? billDao.findAllByStarAndEnd(star, end) : billDao.findAllByStarAndEnd(star, end, status);
    }

    public List<EveryDayResponse> getRevenueEveryDay(List<LocalDate> localDates) {
        return localDates.stream().map(localDate -> {
            EveryDayResponse revenueEveryDayOfTheMonthResponse = new EveryDayResponse();
            revenueEveryDayOfTheMonthResponse.setDay(localDate);
            return revenueEveryDayOfTheMonthResponse;
        }).collect(Collectors.toList());

    }

    public List<LocalDate> getDayOfMonth(Integer year, Integer month) {
        Stream<PlainDate> februaryDates = CalendarMonth.of(year, month).streamDaily();
        return februaryDates.map(PlainDate::toTemporalAccessor).collect(Collectors.toList());
    }

    @Override
    public List<EveryDayResponse> revenueEveryDayOfTheMonth(Integer year, Integer month, EnumStatus status) {
        if (year == null || year <= 0) {
            LocalDate date = LocalDate.now();
            year = date.getYear();
        }
        if (month == null || month <= 0) {
            LocalDate date = LocalDate.now();
            month = date.getMonthValue();
        }
        List<LocalDate> dateList = getDayOfMonth(year, month);

        List<EveryDayResponse> everyDayResponses = getRevenueEveryDay(dateList);

        List<Bill> billList = getListBill(LocalDateUtils.formatLocalDate(dateList.get(0)),
                LocalDateUtils.formatLocalDate(dateList.get(dateList.size() - 1).plusDays(1)), status);


        billList.forEach(bill -> {
            LocalDate date = bill.getCreateAt().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            int day = date.getDayOfMonth();

            EveryDayResponse everyDay = everyDayResponses.get(day - 1);
            everyDay.setTotal(everyDay.getTotal() + bill.getTotal());
            everyDayResponses.set(day - 1, everyDay);
        });


        return everyDayResponses;
    }

    @Override
    public List<EveryMonthResponse> getEveryMonthOfTheYear(Integer year, EnumStatus status) {
        List<Integer> months = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            months.add(i);
        }
        if (year == null || year <= 0) {
            LocalDate date = LocalDate.now();
            year = date.getYear();
        }

        List<EveryMonthResponse> everyMonthResponses = new ArrayList<>();

        for (Integer month : months) {
            List<LocalDate> dateList = getDayOfMonth(year, month);
            Double total = getTotalMonth(dateList, status);
            everyMonthResponses.add(new EveryMonthResponse(month, total != null ? total : 0d));
        }

        return everyMonthResponses;
    }

    public Double getTotalMonth(List<LocalDate> dateList, EnumStatus status) {
        return status == null ? billDao.sumTotalMonthOfYear(LocalDateUtils.formatLocalDate(dateList.get(0)),
                LocalDateUtils.formatLocalDate(dateList.get(dateList.size() - 1).plusDays(1)))
                : billDao.sumTotalMonthOfYear(LocalDateUtils.formatLocalDate(dateList.get(0)),
                LocalDateUtils.formatLocalDate(dateList.get(dateList.size() - 1).plusDays(1)), status);

    }
}

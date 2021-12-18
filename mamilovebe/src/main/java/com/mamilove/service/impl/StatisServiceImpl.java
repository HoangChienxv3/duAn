package com.mamilove.service.impl;

import com.mamilove.common.EnumStatus;
import com.mamilove.dao.BillDao;
import com.mamilove.dao.OrderDetailDao;
import com.mamilove.entity.Bill;
import com.mamilove.request.dto.QtyByDayRequest;
import com.mamilove.response.dto.*;
import com.mamilove.service.service.StatisService;
import com.mamilove.utils.DateUtils;
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

        List<Bill> billList = getListBill(DateUtils.localDateToDate(dateList.get(0)),
                DateUtils.localDateToDate(dateList.get(dateList.size() - 1).plusDays(1)), status);


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
        return status == null ? billDao.sumTotalMonthOfYear(DateUtils.localDateToDate(dateList.get(0)),
                DateUtils.localDateToDate(dateList.get(dateList.size() - 1).plusDays(1)))
                : billDao.sumTotalMonthOfYear(DateUtils.localDateToDate(dateList.get(0)),
                DateUtils.localDateToDate(dateList.get(dateList.size() - 1).plusDays(1)), status);

    }

    public List<EveryYearResponse> getEveryYear(EnumStatus status) {

        LocalDate date = LocalDate.now();
        int year = date.getYear();

        List<Integer> years = new ArrayList<>();
        List<EveryYearResponse> everyYearResponses = new ArrayList<>();

        for (int i = 0; i < 5; i++) {
            years.add(year - i);
        }

        for (Integer y : years) {
            String star = y + "-01-01";
            String end = y + "-12-31";

            LocalDate starDate = DateUtils.stringToLocalDate(star);
            LocalDate endDate = DateUtils.stringToLocalDate(end);

            Double total = getTotalStartToEnd(starDate, endDate, status);

            everyYearResponses.add(new EveryYearResponse(y, total != null ? total : 0d));

        }

        return everyYearResponses;
    }

    public Double getTotalStartToEnd(LocalDate start, LocalDate end, EnumStatus status) {
        return status == null ? billDao.sumTotalMonthOfYear(DateUtils.localDateToDate(start),
                DateUtils.localDateToDate(end.plusDays(1)))
                : billDao.sumTotalMonthOfYear(DateUtils.localDateToDate(start),
                DateUtils.localDateToDate(end.plusDays(1)), status);
    }

    @Override
    public List<SumQtyProductResponse> quantityByDay(QtyByDayRequest qtyByDayRequest) {
        String str = DateUtils.toString(qtyByDayRequest.getDay());
        LocalDate start = DateUtils.stringToLocalDate(str);
        LocalDate end = start.plusDays(1);

        List<Object[]> objects = getSumQty(DateUtils.localDateToDate(start), DateUtils.localDateToDate(end), qtyByDayRequest.getEnumStatus());

        return objects.stream().map(o -> {
            SumQtyProductResponse sumQtyProductResponse = new SumQtyProductResponse();
            sumQtyProductResponse.setName((String) o[0]);
            sumQtyProductResponse.setQty((Long) o[1]);
            sumQtyProductResponse.setIntomoney((Double) o[2]);
            return sumQtyProductResponse;
        }).collect(Collectors.toList());
    }

    @Override
    public List<SumQtyProductResponse> quantityByMonth(EnumStatus status) {
        LocalDate date = LocalDate.now();
        List<LocalDate> dateList = getDayOfMonth(date.getYear(), date.getMonthValue());

        List<Object[]> objects = getSumQty(DateUtils.localDateToDate(dateList.get(0)),
                DateUtils.localDateToDate(dateList.get(dateList.size() - 1)), status);
        return objects.stream().map(o -> {
            SumQtyProductResponse sumQtyProductResponse = new SumQtyProductResponse();
            sumQtyProductResponse.setName((String) o[0]);
            sumQtyProductResponse.setQty((Long) o[1]);
            sumQtyProductResponse.setIntomoney((Double) o[2]);
            return sumQtyProductResponse;
        }).collect(Collectors.toList());
    }

    @Override
    public List<BillDashboardResponse> getBillDashBoard(Date day) {
        String str = DateUtils.toString(day != null ? day : new Date());
        LocalDate start = DateUtils.stringToLocalDate(str);
        LocalDate end = start.plusDays(1);
        return null;
//        return billDao.countBill(DateUtils.localDateToDate(start), DateUtils.localDateToDate(end))
//                .stream()
//                .map(objects -> {
//                    BillDashboardResponse billDashboardResponse = new BillDashboardResponse();
//
//                    billDashboardResponse.setName(String.valueOf(objects[0]));
//                    billDashboardResponse.setTotal((Double) objects[1]);
//
//                    return billDashboardResponse;
//                }).collect(Collectors.toList());
    }

    public List<Object[]> getSumQty(Date star, Date end, EnumStatus status) {
        return status == null ? orderDetailDao.getSumQtyProduct(star, end) :
                orderDetailDao.getSumQtyProduct(star, end, status);
    }
}

package com.mamilove.utils;

import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

@NoArgsConstructor
public class DateUtils {

    private static final String CORRECT_DATE_FORMAT = "yyyy-MM-dd";

    private static final DateFormat simpleDateFormat;

    static {
        simpleDateFormat = new SimpleDateFormat(CORRECT_DATE_FORMAT);
    }

    public static void checkDateFormat(String dateStr) {
        simpleDateFormat.setLenient(false);
        try {
            simpleDateFormat.parse(dateStr);
        } catch (Exception e) {
            throw new IllegalArgumentException("");
        }
        simpleDateFormat.setLenient(true);
    }

    public static Date stringToDate(String dateStr) {
        try {
            return simpleDateFormat.parse(dateStr);
        } catch (ParseException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Ngày giờ không đúng định dạng");
        }
    }

    public static String toString(Date date) {
        return simpleDateFormat.format(date);
    }

    public static String toStringNewForMat(Date date) {
        SimpleDateFormat simple = new SimpleDateFormat("dd-MM-yyyy");
        return simple.format(date);
    }

    //    locaDate
    public static Date formatLocalDate(LocalDate localDate) {
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public static LocalDate dateToLocalDate(Date date) {
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    public static LocalDate stringToLocalDate(String dateStr){
        Date date = stringToDate(dateStr);
        return dateToLocalDate(date);
    }
}

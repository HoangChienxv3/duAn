package com.mamilove.utils;

import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CompareDate {

    private  static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public static int compareDate(Date start, Date end) throws ParseException {
        Date dateStart = sdf.parse(DateUtils.toString(start));
        Date dateEnd = sdf.parse(DateUtils.toString(end));

        return dateStart.compareTo(dateEnd);
    }

}

package com.mamilove.utils;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

public class LocalDateUtils {

    public static Date formatLocalDate(LocalDate localDate) {
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

}

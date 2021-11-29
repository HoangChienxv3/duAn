package com.mamilove.utils;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatMoney {

    public static String currencyVN(Double money){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String str1 = currencyVN.format(money);
        return str1;
    }

}

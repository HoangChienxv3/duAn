package com.mamilove.shiping;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class GetBillShiping {
    public static List<BillShiping> getStatusShip(String id) throws IOException {//811031148979
        Document doc = Jsoup.connect("https://jtexpress.vn/track?billcodes=" + id).get();
        Elements elmsListInfo = doc.select("div[id='collapse-" + id + "']");
        if (elmsListInfo.size() != 1) {
            System.out.println("Đơn hàng có vấn đề.");
            return null;
        }
        Elements elmsListDateBill = elmsListInfo.select("p[class='date-billcode']");
        Elements elmsListTimeBill = elmsListInfo.select("h5[class='time-billcode pt-md-1 pt-4']");
        Elements elmsListInfoBill = elmsListInfo.select("div[class='card-body']");
        if (elmsListDateBill.size() == 0) {
            System.out.println("Đơn hàng chưa được giao cho J&T hoặc mã đơn hàng sai.");
            return null;
        }
        if (!((elmsListDateBill.size() == elmsListTimeBill.size()) && elmsListDateBill.size() == elmsListInfoBill.size())) {
            System.out.println("Dữ liệu không hợp lệ.");
        }
        List<BillShiping> billDtoList = new ArrayList<>();
        for (int i = 0; i < elmsListDateBill.size(); i++) {
            Element elmDateBill = elmsListDateBill.get(i);
            Element elmTimeBill = elmsListTimeBill.get(i);
            Element elmInfoBill = elmsListInfoBill.get(i);

            BillShiping billDto = new BillShiping();
            billDto.setDate(toDate(elmDateBill.text(), elmTimeBill.text()));
            billDto.setContent(elmInfoBill.text());
            billDtoList.add(billDto);
        }
        Collections.sort(billDtoList);
//        billDtoList.forEach(System.out::println);
        return billDtoList;
    }

    private static Date toDate(String date, String time) {
        final String PATTERN = "dd-MM-yyyy hh:mm:ss";
        final String TIME = date + " " + time;
        try {
            return new SimpleDateFormat(PATTERN).parse(TIME);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}

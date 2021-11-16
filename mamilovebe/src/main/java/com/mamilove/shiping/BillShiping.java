package com.mamilove.shiping;

import java.util.Date;

public class BillShiping implements Comparable<BillShiping> {
    Date date;
    String content;

    public BillShiping() {
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "BillDto{" +
                "date=" + date +
                ", content='" + content + '\'' +
                '}';
    }

    @Override
    public int compareTo(BillShiping o) {
        return (int) (this.date.getTime() - o.date.getTime());
    }
}

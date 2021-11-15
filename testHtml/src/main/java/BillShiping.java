import java.util.Date;

public class BillDto implements Comparable<BillDto> {
    Date date;
    String content;

    public BillDto() {
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
    public int compareTo(BillDto o) {
        return (int) (this.date.getTime() - o.date.getTime());
    }
}

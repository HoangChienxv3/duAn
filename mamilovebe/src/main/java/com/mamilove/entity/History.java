package com.mamilove.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;


@Data
@Entity
@Table(name = "history")
public class History implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idhistory;

    private Long trading_code; //mã giao dịch

    private Double surplus;//số dư ví

    private String description;//nội dung giao dịch

    private Date time;

    private Boolean status;

    private String Content;//nạp tiền vào ví

    private Double amounts;//số tiền giao dịch

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "idmamipay", updatable = false, insertable = false)
    private Mamipay mamipay;

    @JoinColumn(name = "idmamipay")
    private Long idmamipay;
}

package com.mamilove.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "voucherbill")
public class VoucherBill implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "idbill", updatable = false, insertable = false)
    private Bill bill;

    @Column(name = "idbill")
    private String idbill;

    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "idvoucher", updatable = false, insertable = false)
    private Voucher voucher;

    @Column(name = "idvoucher")
    private Long idvoucher;


}

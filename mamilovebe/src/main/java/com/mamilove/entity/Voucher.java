package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "voucher")
public class Voucher implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long amount;

    private Double discount;

    private String descriptionvoucher;

    @Column(name = "isDelete")
    private Boolean isDelete = false;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idevent")
    private Event event;

//	@JsonIgnore
//	@OneToMany(mappedBy = "voucher")
//	private List<Bill> bills;


}

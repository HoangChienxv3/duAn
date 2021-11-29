package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "quantity")
public class Quantity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private long quantity;

    @ManyToOne
    @JoinColumn(name = "idproduct", updatable = false, insertable = false)
    private Product product;

    @Column(name = "idproduct")
    private Long idProduct;

    @ManyToOne
    @JoinColumn(name = "idsize", updatable = false, insertable = false)
    private Size size;

    @Column(name = "idsize")
    private Long idsize;

    @ManyToOne
    @JoinColumn(name = "idproperty", updatable = false, insertable = false)
    private Property property;

    @Column(name = "idproperty")
    private Long idproperty;

    @Column(name = "isDelete")
    private Boolean isDelete = false;

    @JsonIgnore
    @OneToMany(mappedBy = "quantity")
    private List<Orderdetail> orderdetails;

}

package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "customer")
public class Customer implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullname;

    private String statuscustomer;

    @Column(name = "isDelete")
    private Boolean isDelete = false;

    @Column(name = "address")
    private String address;

    @OneToOne
    @JoinColumn(name = "idaccount", updatable = false, insertable = false)
    private Account account;

    @Column(name = "idaccount")
    private Long idaccount;

    @OneToMany(mappedBy = "customer")
    @JsonIgnore
    private List<Bill> bills;

}

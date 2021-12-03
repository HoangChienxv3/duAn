package com.mamilove.entity;

import java.io.Serializable;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "image")
public class Image implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String url;
    @Column(name = "isDelete")
    private Boolean isDelete = false;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "idproduct")
    private Product product;



}

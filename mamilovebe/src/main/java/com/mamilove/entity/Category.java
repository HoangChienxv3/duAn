package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "category")
public class Category implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(name = "isDelete")
    private Boolean isDelete = false;
    @JsonIgnore
    @OneToMany(mappedBy = "category")
    List<Categorydetail> categorydetails;
}

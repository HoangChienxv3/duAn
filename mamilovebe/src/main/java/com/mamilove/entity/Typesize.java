package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "typesize")
public class Typesize implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(name = "isDelete")
    private Boolean isDelete = false;

    @JsonIgnore
    @OneToMany(mappedBy = "typesize")
    private List<Size> sizes;


}

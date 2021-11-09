package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "categorydetail")
public class Categorydetail implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name;

	@Column(name = "isDelete")
	private Boolean isDelete = false;
	@ManyToOne @JoinColumn(name = "idcategory")
	private Category category;

	@JsonIgnore
	@OneToMany(mappedBy = "categorydetail")
	private List<Product> products;
	
	
}

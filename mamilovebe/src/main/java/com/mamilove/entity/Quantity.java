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
public class Quantity implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Long quantity;

	@JsonIgnore
	@ManyToOne @JoinColumn(name = "idproduct", updatable = false, insertable = false)
	private Product product;

	@Column(name = "idproduct")
	private Long idProduct;
	
	@ManyToOne @JoinColumn(name = "idsize")
	private Size size;
	
	@ManyToOne @JoinColumn(name = "idproperty")
	private Property property;
	
	@JsonIgnore
	@OneToMany(mappedBy = "quantity")
	private List<Orderdetail> orderdetails;
	
}

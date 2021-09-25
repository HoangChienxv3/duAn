package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

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
	
	@ManyToOne @JoinColumn(name = "idproduct")
	private Product product;
	
	@ManyToOne @JoinColumn(name = "idsize")
	private Size size;
	
	@ManyToOne @JoinColumn(name = "idproperty")
	private Property property;
	
	@JsonIgnore
	@OneToMany(mappedBy = "quantity")
	private List<Orderdetail> orderdetails;
	
}

package com.mamilove.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "orderdetail")
public class Orderdetail implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Double price;
	
	private Double downprice;
	
	private Long quantitydetail;
	
	private Double intomoney;
	
	@ManyToOne @JoinColumn(name = "idquantity")
	private Quantity quantity;
	
	@ManyToOne @JoinColumn(name = "idbill")
	private Bill bill;
	
}

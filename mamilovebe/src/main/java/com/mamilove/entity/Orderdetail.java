package com.mamilove.entity;

import java.io.Serializable;

import javax.persistence.*;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "orderdetail")
public class Orderdetail implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Double price;//giá gốc
	
	private Double downprice;//giá giảm
	
	private Long quantitydetail;//số lượng mua
	
	private Double intomoney;//thành tiền

	@Column(name = "isDelete")
	private Boolean isDelete = false;


	@ManyToOne @JoinColumn(name = "idquantity", updatable = false, insertable = false)
	private Quantity quantity;

	@Column(name = "idquantity")
	private Long idquantity;
	
	@ManyToOne @JoinColumn(name = "idbill", updatable = false, insertable = false)
	private Bill bill;

	@Column(name = "idbill")
	private String idbill;
	
}

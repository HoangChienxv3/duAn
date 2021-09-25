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

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "bill")
public class Bill implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String statusshipping;
	
	private Double total;
	
	private Double discount;
	
	private Double downtotal;
	
	private Boolean payment;
	
	@Length(max = 1000)
	private String address;
	
	@Length(max = 1000)
	private String note;
	
	private Boolean refund;
	
	@ManyToOne @JoinColumn(name = "idcustomer")
	private Customer customer;
	
	@ManyToOne @JoinColumn(name = "idvoucher")
	private Voucher voucher;
	
	@JsonIgnore 
	@OneToMany(mappedBy = "bill")
	private List<Orderdetail> orderdetails;
}

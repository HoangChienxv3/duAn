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
@Table(name = "voucher")
public class Voucher implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private Long amount;
	
	private Double discount;

	private String descriptionvoucher;
	
	@ManyToOne @JoinColumn(name = "idevent")
	private Event event;
	
//	@JsonIgnore
//	@OneToMany(mappedBy = "voucher")
//	private List<Bill> bills;
	
	
}

package com.mamilove.entity;

import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "event")
public class Event implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name;
	
	private Date startday;
	
	private Date endday;

	private Boolean status;
	
	@JsonIgnore
	@OneToMany(mappedBy = "event")
	private List<ImageEvent> imageevents;
	
	@JsonIgnore
	@OneToMany(mappedBy = "event")
	private List<Voucher> vouchers;
	
	
	
}

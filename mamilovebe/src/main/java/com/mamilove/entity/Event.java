package com.mamilove.entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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

	@Column(name = "isDelete")
	private Boolean isDelete = false;
	@JsonIgnore
	@OneToMany(mappedBy = "event")
	private List<ImageEvent> imageevents;
	
	@JsonIgnore
	@OneToMany(mappedBy = "event")
	private List<Voucher> vouchers;
	
	
	
}

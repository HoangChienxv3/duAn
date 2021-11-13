package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "customer")
public class Customer implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String fullname;

	private String statuscustomer;

	@Column(name = "isDelete")
	private Boolean isDelete = false;

	@OneToOne
	@JoinColumn(name = "idaccount")
	private  Account account;

	@OneToMany(mappedBy = "customer")
	@JsonIgnore
	private List<Bill> bills;

}

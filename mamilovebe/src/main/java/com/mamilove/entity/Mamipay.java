package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "mamipay")
public class Mamipay implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idmamipay;
	
	private Double surplus;

	@Column(name = "isDelete")
	private Boolean isDelete = false;

	@OneToOne
	@JoinColumn(name = "idcustomer")
	private Customer customer;

	
}

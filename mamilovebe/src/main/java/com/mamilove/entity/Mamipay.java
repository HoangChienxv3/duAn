package com.mamilove.entity;

import java.io.Serializable;

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

	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "idcustomer", updatable = false, insertable = false)
	private Customer customer;

	@Column(name = "idcustomer")
	private Long idcustomer;
	
}

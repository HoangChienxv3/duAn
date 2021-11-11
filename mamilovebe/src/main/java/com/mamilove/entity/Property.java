package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "property")
public class Property implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idproperty;
	
	private String name;

	@Column(name = "id_product")
	private String id_product;

	@Column(name = "isDelete")
	private Boolean isDelete = false;

	@JsonIgnore
	@OneToMany(mappedBy = "property")
	private List<Quantity> quantities;
	
}

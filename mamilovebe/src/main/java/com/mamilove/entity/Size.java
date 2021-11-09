package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "size")
public class Size implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name;
	
	@ManyToOne @JoinColumn(name = "idtypesize", updatable = false, insertable = false)
	private Typesize typesize;

	@Column(name = "isDelete")
	private Boolean isDelete = false;

	@JsonIgnore
	@OneToMany(mappedBy = "size")
	private List<Quantity> quantities;
}

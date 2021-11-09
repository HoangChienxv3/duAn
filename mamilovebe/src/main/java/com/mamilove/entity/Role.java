package com.mamilove.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "role")
public class Role implements Serializable{

	@Id
	String id;
	String name;

	@Column(name = "isDelete")
	private Boolean isDelete = false;

	@JsonIgnore
	@OneToMany(mappedBy = "role")
	List<Authority> authorities;
	 
	
}

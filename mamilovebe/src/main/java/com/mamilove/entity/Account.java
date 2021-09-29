package com.mamilove.entity;

import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
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
@Table(name = "account")
public class Account implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String username;
	
	private String password;
	
	private String phone;
	
	private String email;

	private String capcha;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Authority> authorities;
	
	
}

package com.mamilove.entity;

import java.io.Serializable;

import javax.persistence.*;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "imageevent")
public class ImageEvent implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String file;

	@Column(name = "isDelete")
	private Boolean isDelete = false;

	@ManyToOne @JoinColumn(name = "idevent")
	private Event event;
}

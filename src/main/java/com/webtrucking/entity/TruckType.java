package com.webtrucking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "truck_type")
public class TruckType {
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	private int id;

	@Column(name = "name", length = 45)
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public TruckType() {
		super();
	}

	public TruckType(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	
	
}

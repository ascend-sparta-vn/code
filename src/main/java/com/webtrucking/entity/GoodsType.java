package com.webtrucking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "goods_type")
public class GoodsType {
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


	public GoodsType() {
		super();
	}

	
	
}

package com.webtrucking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "province")
public class Province {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="type")
	private String type;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
//	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "province")
//	private List<District> listDistrict = new ArrayList<District>();

	public Province(String id, String name, String type) {
		super();
		this.name = name;
		this.type = type;
	}

	public Province() {
		super();
	}

	
	
}

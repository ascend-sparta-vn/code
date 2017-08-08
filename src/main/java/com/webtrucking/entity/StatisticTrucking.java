package com.webtrucking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "statistic_trucking")
public class StatisticTrucking {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "object_type")
	private int objectType;
	
	@Column(name = "object_name")
	private String objectName;
	
	@Column(name = "object_id")
	private int objectId;
	
	@Column(name = "object_quantity")
	private int objectQuantity;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public int getObjectType() {
		return objectType;
	}

	public void setObjectType(int objectType) {
		this.objectType = objectType;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public int getObjectId() {
		return objectId;
	}

	public void setObjectId(int objectId) {
		this.objectId = objectId;
	}

	public int getObjectQuantity() {
		return objectQuantity;
	}

	public void setObjectQuantity(int objectQuantity) {
		this.objectQuantity = objectQuantity;
	}

	public StatisticTrucking(int id, int objectType, String objectName, int objectId, int objectQuantity) {
		super();
		this.id = id;
		this.objectType = objectType;
		this.objectName = objectName;
		this.objectId = objectId;
		this.objectQuantity = objectQuantity;
	}

	public StatisticTrucking() {
		super();
	}
	
	
	
}

package com.webtrucking.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "truck")
public class Truck {
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "truck_code", length = 45)
	private String truckCode;
	
//	@Column(name = "truck_type_id")
//	private int truck_type_id;
	
	@Column(name = "owner_truck_id", length = 45)
	private Integer ownerTruckId;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name = "owner_truck_id", nullable = true, insertable=false, updatable=false)
	private Account account;
	
	@Column(name = "status", length = 45)
	private Integer status;
	
	@Column(name = "created_date", length = 45)
	private Date createdDate;
	
	@Column(name="truck_type_id")
	private Integer truckTypeId;
	
	@ManyToOne
	@JoinColumn(name = "truck_type_id", nullable = false, insertable=false, updatable=false)
	private TruckType truckType;
	
	@Column(name="plate_number")
	private String plateNumber;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTruckCode() {
		return truckCode;
	}

	public void setTruckCode(String truckCode) {
		this.truckCode = truckCode;
	}

//	public int getTruck_type_id() {
//		return truck_type_id;
//	}
//
//	public void setTruck_type_id(int truck_type_id) {
//		this.truck_type_id = truck_type_id;
//	}

	public Integer getOwnerTruckId() {
		return ownerTruckId;
	}

	public void setOwnerTruckId(Integer ownerTruckId) {
		this.ownerTruckId = ownerTruckId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

//	public Truck(int id, String truckCode, int truck_type_id,
//			Integer ownerTruckId, Integer status, Date createdDate) {
//		super();
//		this.id = id;
//		this.truckCode = truckCode;
//		this.truck_type_id = truck_type_id;
//		this.ownerTruckId = ownerTruckId;
//		this.status = status;
//		this.createdDate = createdDate;
//	}

	public Truck() {
		super();
	}

public Truck(int id, String truckCode, Integer ownerTruckId, Integer status,
		Date createdDate, TruckType truckType) {
	super();
	this.id = id;
	this.truckCode = truckCode;
	this.ownerTruckId = ownerTruckId;
	this.status = status;
	this.createdDate = createdDate;
	this.truckType = truckType;
}

public TruckType getTruckType() {
	return truckType;
}

public void setTruckType(TruckType truckType) {
	this.truckType = truckType;
}

public Integer getTruckTypeId() {
	return truckTypeId;
}

public void setTruckTypeId(Integer truckTypeId) {
	this.truckTypeId = truckTypeId;
}

public String getPlateNumber() {
	return plateNumber;
}

public void setPlateNumber(String plateNumber) {
	this.plateNumber = plateNumber;
}

public Account getAccount() {
	return account;
}

public void setAccount(Account account) {
	this.account = account;
}
	
	
	

}

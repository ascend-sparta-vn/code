package com.webtrucking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "owner_truck")
public class OwnerTruck {
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "owner_name", length = 45)
	private String ownerName;
	
	@Column(name = "owner_address", length = 45)
	private String ownerAddress;
	
	@Column(name = "owner_status", length = 45)
	private String ownerStatus;
	
	@Column(name = "owner_phone_number", length = 45)
	private String ownerPhoneNumber;
	
	@Column(name = "owner_type", length = 45)
	private String ownerType;
	
	@Column(name = "owner_account_id")
	private Integer ownerAccountId;
	
	public OwnerTruck(int id, String ownerName, String ownerAddress,
			String ownerStatus, String ownerPhoneNumber, String ownerType,
			Integer ownerAccountId) {
		super();
		this.id = id;
		this.ownerName = ownerName;
		this.ownerAddress = ownerAddress;
		this.ownerStatus = ownerStatus;
		this.ownerPhoneNumber = ownerPhoneNumber;
		this.ownerType = ownerType;
		this.ownerAccountId = ownerAccountId;
	}

	public OwnerTruck() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getOwnerAddress() {
		return ownerAddress;
	}

	public void setOwnerAddress(String ownerAddress) {
		this.ownerAddress = ownerAddress;
	}

	public String getOwnerStatus() {
		return ownerStatus;
	}

	public void setOwnerStatus(String ownerStatus) {
		this.ownerStatus = ownerStatus;
	}

	public String getOwnerPhoneNumber() {
		return ownerPhoneNumber;
	}

	public void setOwnerPhoneNumber(String ownerPhoneNumber) {
		this.ownerPhoneNumber = ownerPhoneNumber;
	}

	public String getOwnerType() {
		return ownerType;
	}

	public void setOwnerType(String ownerType) {
		this.ownerType = ownerType;
	}

	public Integer getOwnerAccountId() {
		return ownerAccountId;
	}

	public void setOwnerAccountId(Integer ownerAccountId) {
		this.ownerAccountId = ownerAccountId;
	}

	
	
}

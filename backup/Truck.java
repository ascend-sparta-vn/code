package com.webtrucking.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
	
	@ManyToOne
	@JoinColumn(name = "truck_type_id", nullable = false)
	private TruckType truckType;
	
	@OneToOne 
	@JoinColumn(name = "owner_truck_id")
	private OwnerTruck ownerTruck;
	
	@Column(name = "status", length = 45)
	private Integer status;
	
	@Column(name = "created_date", length = 45)
	private Date createdDate;
	
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "truck")
	@JsonIgnore
	private List<TruckInfoDetail> listTruckInfoDetails  = new ArrayList<TruckInfoDetail>();
	

	public Truck(int id, String truckCode, TruckType truckType,
			OwnerTruck ownerTruck, Integer status, Date createdDate,
			List<TruckInfoDetail> listTruckInfoDetails) {
		super();
		this.id = id;
		this.truckCode = truckCode;
		this.truckType = truckType;
		this.ownerTruck = ownerTruck;
		this.status = status;
		this.createdDate = createdDate;
		this.listTruckInfoDetails = listTruckInfoDetails;
	}

	

	@Override
	public String toString() {
		return "Truck [id=" + id + ", truckCode=" + truckCode + ", truckType="
				+ truckType + ", ownerTruck=" + ownerTruck + ", status="
				+ status + ", createdDate=" + createdDate
				+ ", listTruckInfoDetails=" + listTruckInfoDetails + "]";
	}



	public Truck() {
		super();
	}
	
	

}

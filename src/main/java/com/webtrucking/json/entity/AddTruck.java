package com.webtrucking.json.entity;

public class AddTruck {

	private Integer truckTypeId;
	private Integer status;
	private String plateNumber;
	public Integer getTruckTypeId() {
		return truckTypeId;
	}
	public void setTruckTypeId(Integer truckTypeId) {
		this.truckTypeId = truckTypeId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getPlateNumber() {
		return plateNumber;
	}
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}
}

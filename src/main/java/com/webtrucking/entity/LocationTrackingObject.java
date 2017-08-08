package com.webtrucking.entity;

import java.util.Date;

public class LocationTrackingObject {
	private String plateNumber;
	private int gpsfix;
	private Double lat;
	private Double lng;
	private Date updatedTime;
	public String getPlateNumber() {
		return plateNumber;
	}
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}
	public int getGpsfix() {
		return gpsfix;
	}
	public void setGpsfix(int gpsfix) {
		this.gpsfix = gpsfix;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Date getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	public LocationTrackingObject(String plateNumber, int gpsfix, Double lat,
			Double lng, Date updatedTime) {
		super();
		this.plateNumber = plateNumber;
		this.gpsfix = gpsfix;
		this.lat = lat;
		this.lng = lng;
		this.updatedTime = updatedTime;
	}
	public LocationTrackingObject() {
		super();
	}
	
	
	
}

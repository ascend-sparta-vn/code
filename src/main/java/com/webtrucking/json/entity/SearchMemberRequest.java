package com.webtrucking.json.entity;

public class SearchMemberRequest {
	
	private String ownerName;
	private String ownerPhoneNumber;
	private String ownerStatus;
	
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getOwnerPhoneNumber() {
		return ownerPhoneNumber;
	}
	public void setOwnerPhoneNumber(String ownerPhoneNumber) {
		this.ownerPhoneNumber = ownerPhoneNumber;
	}
	public String getOwnerStatus() {
		return ownerStatus;
	}
	public void setOwnerStatus(String ownerStatus) {
		this.ownerStatus = ownerStatus;
	}

}

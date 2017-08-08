package com.webtrucking.json.entity;


public class OrderRequest {

	private Integer ownerId;
	private Integer eventId;
	private Integer partnerId;
	private Integer orderType;
	private Integer quantity;
	private Integer unit;
	private Double expectedPrice;
	private Integer vatFee;
	private Integer porterFee;
	private String description;
//	private Integer transactionType;
	private Double shiftFee;

	public Integer getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public Integer getOrderType() {
		return orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getUnit() {
		return unit;
	}

	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	public Double getExpectedPrice() {
		return expectedPrice;
	}

	public void setExpectedPrice(Double expectedPrice) {
		this.expectedPrice = expectedPrice;
	}

	public Integer getVatFee() {
		return vatFee;
	}

	public void setVatFee(Integer vatFee) {
		this.vatFee = vatFee;
	}

	public Integer getPorterFee() {
		return porterFee;
	}

	public void setPorterFee(Integer porterFee) {
		this.porterFee = porterFee;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getShiftFee() {
		return shiftFee;
	}

	public void setShiftFee(Double shiftFee) {
		this.shiftFee = shiftFee;
	}

	public Integer getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}

}

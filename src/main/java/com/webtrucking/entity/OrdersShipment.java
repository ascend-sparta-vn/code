package com.webtrucking.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name="orders_shipment")
public class OrdersShipment {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(name="owner_id")
	private Integer ownerId;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn(name="owner_id", nullable=true, updatable=false, insertable=false)
	private User account;
	
	@Column(name="partner_id")
	private Integer partnerId;
	
	@Column(name="event_id")
	private Integer eventId;
	
	@Column(name="order_type")
	private Integer orderType;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="unit")
	private Integer unit;
	
	@Column(name="expected_price")
	private Double expectedPrice;
	
	@Column(name="shift_fee")
	private Double shiftFee;
	
	@Column(name="vat_fee")
	private Integer vatFee;
	
	@Column(name="porter_fee")
	private Integer porterFee;

	@Column(name="description")
	private String description;
	
	@Column(name="transaction_type")
	private Integer transactionType;
	
	@Column(name="created_date")
	private Date createdDate;
	
	@ManyToOne
	@JoinColumn(name="event_id", nullable=true, updatable=false, insertable=false)
	private Shipment shipment;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	public Integer getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(Integer transactionType) {
		this.transactionType = transactionType;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Shipment getShipment() {
		return shipment;
	}

	public void setShipment(Shipment shipment) {
		this.shipment = shipment;
	}

	public Integer getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}

	public Double getShiftFee() {
		return shiftFee;
	}

	public void setShiftFee(Double shiftFee) {
		this.shiftFee = shiftFee;
	}

	
	
	
	
	
}

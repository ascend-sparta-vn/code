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

@Entity
@Table(name = "truck_info_detail")
public class TruckInfoDetail {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="truck_id")
	private Integer truckId;
	
	@ManyToOne
	@JoinColumn(name = "truck_id", nullable = false, insertable=false, updatable=false)
	private Truck truck;
	
	@Column(name="from_district")
	private Integer fromDistrict;
	
	@ManyToOne
	@JoinColumn(name="from_district", nullable = false, insertable=false, updatable=false)
	private District fromDisTrictObj;
	
	@Column(name="to_district")
	private Integer toDistrict;
	
	@ManyToOne
	@JoinColumn(name="to_district", nullable = false, insertable=false, updatable=false)
	private District toDisTrictObj;
	
	@Column(name="goods_type_id")
	private Integer goodsTypeId;
	
	@ManyToOne
	@JoinColumn(name = "goods_type_id", nullable = false, insertable=false, updatable=false)
	private GoodsType goodsType;
	
	@Column(name="price")
	private Double price;
	
	@Column(name="description")
	private String description;
	
	@Column(name="weight_string")
	private String weightString;

	@Column(name="start_date")
	private Date startDate;
	
	@Column(name="post_date")
	private Date postDate;
	
	@Column(name="approve_date")
	private Date approveDate;
	
	@Column(name="expired_date")
	private Date expiredDate;
	
	@Column(name="created_date")
	private Date createdDate;
	
	@Column(name="agency")
	private String agency;
	
	@Column(name="tracking_trip")
	private String trackingTrip;
	
	@Column(name="weight")
	private Double weight;
	
	@Column(name="from_detail_address")
	private String fromDetailAddress;
	
	@Column(name="to_detail_address")
	private String toDetailAddress;
	
	@Column(name="distance")
	private Double distance;
	
	@Column(name="weight_unit")
	private Integer weightUnit;
	
	@Column(name="price_unit")
	private Integer priceUnit;
	
	@Column(name="status")
	private Integer status;
	
	@Column(name="title")
	private String title;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public TruckInfoDetail() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Truck getTruck() {
		return truck;
	}

	public void setTruck(Truck truck) {
		this.truck = truck;
	}

	public GoodsType getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}

	public Date getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public String getTrackingTrip() {
		return trackingTrip;
	}

	public void setTrackingTrip(String trackingTrip) {
		this.trackingTrip = trackingTrip;
	}

	public String getWeightString() {
		return weightString;
	}

	public void setWeightString(String weightString) {
		this.weightString = weightString;
	}

	public TruckInfoDetail(int id, Truck truck, String fromAddress,
			String toAddress, GoodsType goodsType, int price,
			String description, String weightString, Date startDate,
			Date postDate, Date approveDate, Date expiredDate, String agency,
			String trackingTrip, Double weight) {
		super();
		this.id = id;
		this.truck = truck;
		this.goodsType = goodsType;
		this.description = description;
		this.weightString = weightString;
		this.startDate = startDate;
		this.postDate = postDate;
		this.approveDate = approveDate;
		this.expiredDate = expiredDate;
		this.agency = agency;
		this.trackingTrip = trackingTrip;
		this.weight = weight;
	}

	public String getFromDetailAddress() {
		return fromDetailAddress;
	}

	public void setFromDetailAddress(String fromDetailAddress) {
		this.fromDetailAddress = fromDetailAddress;
	}

	public String getToDetailAddress() {
		return toDetailAddress;
	}

	public void setToDetailAddress(String toDetailAddress) {
		this.toDetailAddress = toDetailAddress;
	}

	public Integer getWeightUnit() {
		return weightUnit;
	}

	public void setWeightUnit(Integer weightUnit) {
		this.weightUnit = weightUnit;
	}

	public Integer getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(Integer priceUnit) {
		this.priceUnit = priceUnit;
	}

	public Integer getTruckId() {
		return truckId;
	}

	public void setTruckId(Integer truckId) {
		this.truckId = truckId;
	}

	public Integer getGoodsTypeId() {
		return goodsTypeId;
	}

	public void setGoodsTypeId(Integer goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getFromDistrict() {
		return fromDistrict;
	}

	public void setFromDistrict(Integer fromDistrict) {
		this.fromDistrict = fromDistrict;
	}

	public Integer getToDistrict() {
		return toDistrict;
	}

	public void setToDistrict(Integer toDistrict) {
		this.toDistrict = toDistrict;
	}

	public District getFromDisTrictObj() {
		return fromDisTrictObj;
	}

	public void setFromDisTrictObj(District fromDisTrictObj) {
		this.fromDisTrictObj = fromDisTrictObj;
	}

	public District getToDisTrictObj() {
		return toDisTrictObj;
	}

	public void setToDisTrictObj(District toDisTrictObj) {
		this.toDisTrictObj = toDisTrictObj;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

		
	
}

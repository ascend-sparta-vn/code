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
@Table(name = "shipment")
public class Shipment {

	@Id
	@Column(name = "id", unique = true, nullable = false, length = 11)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(name="owner_id")
	private Integer ownerId;
	
	@ManyToOne
	@JoinColumn(name = "owner_id", nullable = true, insertable=false, updatable=false)
	@JsonIgnore
	private Account owner;
	
	@Column(name="deal_type_id")
	private Integer dealTypeId;
	
	@ManyToOne
	@JoinColumn(name = "deal_type_id", nullable = true, insertable=false, updatable=false)
	private DealType dealType;
	
	@Column(name = "name", nullable = false, length = 255)
	private String name;
	
	@Column(name = "code", nullable = true, length = 100)
	private String code;
	
	@Column(name="goods_type_id")
	private Integer goodsTypeId;
	
	@ManyToOne
	@JoinColumn(name = "goods_type_id", nullable = true, insertable=false, updatable=false)
	private GoodsType goodsType;
	
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
	
	@Column(name = "start_date")
	private Date startDate;
	
	@Column(name = "finish_date")
	private Date finishDate;
	
	@Column(name = "distance")
	private Double distance;
	
	@Column(name = "description", length = 1000)
	private String description;
	
	@Column(name = "weight")
	private Double weight;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "agency")
	private String agency;
	
	@Column(name = "post_date")
	private Date postDate;
	
	@Column(name = "approve_date")
	private Date approveDate;
	
	@Column(name = "expired_date")
	private Date expiredDate;
	
	@Column(name="weight_unit")
	private Integer weightUnit;
	
	@Column(name="price_unit")
	private Integer priceUnit;
	
	@Column(name="from_detail_address")
	private String fromDetailAddress;
	
	@Column(name="to_detail_address")
	private String toDetailAddress;
	
	@Column(name="created_date")
	private Date createdDate;
	
	@Column(name="status")
	private Integer status;
	
	public Shipment(Integer id, Account owner, DealType dealType, String name, GoodsType goodsType, String fromAddress,
			String toAddress, Date startDate, Date finishDate, Double distance, String description, Double weight,
			Integer price, String agency, Date postDate, Date approveDate, Date expiredDate) {
		super();
		this.id = id;
		this.owner = owner;
		this.dealType = dealType;
		this.name = name;
		this.goodsType = goodsType;
		this.startDate = startDate;
		this.finishDate = finishDate;
		this.distance = distance;
		this.description = description;
		this.weight = weight;
		this.agency = agency;
		this.postDate = postDate;
		this.approveDate = approveDate;
		this.expiredDate = expiredDate;
	}

	public Shipment() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Account getOwner() {
		return owner;
	}

	public void setOwner(Account owner) {
		this.owner = owner;
	}

	public DealType getDealType() {
		return dealType;
	}

	public void setDealType(DealType dealType) {
		this.dealType = dealType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public GoodsType getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
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

	public Integer getFromDistrict() {
		return fromDistrict;
	}

	public void setFromDistrict(Integer fromDistrict) {
		this.fromDistrict = fromDistrict;
	}

	public District getFromDisTrictObj() {
		return fromDisTrictObj;
	}

	public void setFromDisTrictObj(District fromDisTrictObj) {
		this.fromDisTrictObj = fromDisTrictObj;
	}

	public Integer getToDistrict() {
		return toDistrict;
	}

	public void setToDistrict(Integer toDistrict) {
		this.toDistrict = toDistrict;
	}

	public District getToDisTrictObj() {
		return toDisTrictObj;
	}

	public void setToDisTrictObj(District toDisTrictObj) {
		this.toDisTrictObj = toDisTrictObj;
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

	public Integer getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}

	public Integer getDealTypeId() {
		return dealTypeId;
	}

	public void setDealTypeId(Integer dealTypeId) {
		this.dealTypeId = dealTypeId;
	}

	public Integer getGoodsTypeId() {
		return goodsTypeId;
	}

	public void setGoodsTypeId(Integer goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
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

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}

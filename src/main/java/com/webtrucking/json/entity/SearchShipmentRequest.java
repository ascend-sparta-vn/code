package com.webtrucking.json.entity;

public class SearchShipmentRequest {
	
	private Integer id;
	private Integer fromProvince;
	private Integer toProvince;
	private Integer fromDistrict;
	private Integer toDistrict;
	private Integer  goodsTypeId;
	private Double price;
	private String description;
	private String weightString;
	private String startDate;
	private String postDate;
	private String approveDate;
	private String expiredDate;
	private String agency;
	private String trackingTrip;
	private Double weight;
	private String fromDetailAddress;
	private String toDetailAddress;
	private Double distance;	
	private String name;
	private String code;
	private Integer weightUnit;
	private Integer priceUnit;
	private Integer dealType;
	private Integer pageSize;
	private Integer currentPage;
	
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getFromProvince() {
		return fromProvince;
	}
	public void setFromProvince(Integer fromProvince) {
		this.fromProvince = fromProvince;
	}
	public Integer getToProvince() {
		return toProvince;
	}
	public void setToProvince(Integer toProvince) {
		this.toProvince = toProvince;
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
	public Integer getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(Integer goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
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
	public String getWeightString() {
		return weightString;
	}
	public void setWeightString(String weightString) {
		this.weightString = weightString;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}
	public String getExpiredDate() {
		return expiredDate;
	}
	public void setExpiredDate(String expiredDate) {
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
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
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
	public void setPriceUnit(Integer pricetUnit) {
		this.priceUnit = pricetUnit;
	}
	public Double getDistance() {
		return distance;
	}
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getDealType() {
		return dealType;
	}
	public void setDealType(Integer dealType) {
		this.dealType = dealType;
	}
}

package com.webtrucking.json.entity;



public class SearchOrderingRequest {

	private Integer fromProvince;
	private Integer toProvince;
	private Integer  goodsTypeId;
	private String startDate;
	private String postDate;
	private String approveDate;
	private String expiredDate;
	private Integer truckType;
	private Integer orderType;
	
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
	public Integer getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(Integer goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
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
	public Integer getTruckType() {
		return truckType;
	}
	public void setTruckType(Integer truckType) {
		this.truckType = truckType;
	}
	public Integer getOrderType() {
		return orderType;
	}
	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}
	
	
	
}

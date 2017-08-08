<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CSS Page Style -->
<link rel="stylesheet" href="/resources/css/pages/profile.css">
<div class="breadcrumbs">
		<div class="container">
				<h1 class="pull-left">
				<spring:message code="shipment.management" />
			</h1>
			<ul class="pull-right breadcrumb">
				<li><a href="/"><spring:message code="homepage" /></a></li>
				<li><a href="/account/account-profile"><spring:message
							code="account.management" /></a></li>
				<li class="active"><spring:message code="shipment.management" /></li>
			</ul>
			</div>
</div>
<input type="hidden" id="trucking-id" value="${trucking.id}" />
<input type="hidden" id="your-trucking-id" value="${trucking.truckId}" />
<input type="hidden" id="trucking-from-province" value="${trucking.fromDisTrictObj.provinceId}" />
<input type="hidden" id="trucking-from-district" value="${trucking.fromDisTrictObj.id}" />
<input type="hidden" id="trucking-to-province" value="${trucking.toDisTrictObj.provinceId}" />
<input type="hidden" id="trucking-to-district" value="${trucking.toDisTrictObj.id}" />
<input type="hidden" id="trucking-goodstype" value="${trucking.goodsTypeId}" />
<input type="hidden" id="trucking-weightunit" value="${trucking.weightUnit}" />
<input type="hidden" id="trucking-pricetunit" value="${trucking.priceUnit}" />
<input type="hidden" id="trucking-agency" value="${trucking.agency}" />
<input type="hidden" id="trucking-status" value="${trucking.status}" />
<input type="hidden" id="trucking-approve-mode" value="${approve}" />
<input type="hidden" id="trucking-edit-mode" value="${edit}" />
<input type="hidden" id="trucking-from-address" value="${trucking.fromDetailAddress}" />
<input type="hidden" id="trucking-to-address" value="${trucking.toDetailAddress}" />
<input type="hidden" id="trucking-to-description" value="${trucking.description}" />

<div class="container content profile">
	<div class="row">
		<%@include file="/WEB-INF/jsp/account/left-profile.jsp"%>
		<div class="col-md-9">
			<div class="tag-box tag-box-v3 form-page">
				<div class="headline">
					<div class="row">
						<div class="col-sm-6">
							<h2 class="label-headline"><spring:message code="truck.info" /> <span style="color:red">${trucking.truck.truckCode}</span></h2>
						</div>
						<div class="col-sm-6 text-right" id = "status">
						</div>
					</div>
					
				</div>
				<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="truck.your"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-truck"></i></span>
								  <select id="truckId" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="truck.choose"/></option>
								  		<c:forEach items="${trucks}" var="truck">
								  			<option value="${truck.id}">${truck.plateNumber}</option>
								  		</c:forEach>
								  </select>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="trucking.goods.type"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
								  <select id="goodsType" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="trucking.goods.type.choose"/></option>
								  </select>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="trucking.weight"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
								  <input value="${trucking.weightString}" type="text" class="form-control" id="weight">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="weight.unit"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
								  <select id="weightUnit" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="weight.unit"/></option>
								  		<option value="1" ><spring:message code="weight.unit.ton"/></option>
										<option value="2" ><spring:message code="weight.unit.m3"/></option>
										<option value="3" ><spring:message code="weight.unit.kg"/></option>
								  </select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="province.from"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
								  <select id="fromProvince" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="province.from.choose"/></option>
								  </select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="province.to"/></label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
									  <select id="toProvince" class="form-control">
									  		<option value="-1" selected="selected"><spring:message code="province.to.choose"/></option>
									  </select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="district.from"/></label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
									  <select id="fromDistrict" class="form-control">
									  		<option value="-1" selected="selected"><spring:message code="district.from.choose"/></option>
									  </select>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="district.to"/></label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
									  <select id="toDistrict" class="form-control">
									  		<option value="-1" selected="selected"><spring:message code="district.to.choose"/></option>
									  </select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class="textarea"><spring:message code="address.from"/></label>
								<div class="input-group ">
									<textarea id="fromDetailAddress" style="width: 380px; resize: none" rows="2" name="comment" placeholder=""></textarea>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="textarea"><spring:message code="address.to"/></label>
								<div class="input-group ">
									<textarea id="toDetailAddress" style="width: 380px; resize: none" rows="2" name="comment" placeholder=""></textarea>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="date.from"/> (*)</label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>
									  <input value="<fmt:formatDate pattern="dd-MM-yyyy" value="${trucking.startDate}" />" type="text" class="datepicker form-control" id="startDate">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="date.expire"/> (*)</label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>
									  <input value="<fmt:formatDate pattern="dd-MM-yyyy" value="${trucking.expiredDate}" />" type="text" class="datepicker form-control" id="expiredDate">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="road.length"/> (km)</label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
								  <input value="${trucking.distance}" type="text" class="form-control" id="roadLength">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="agency"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
								  <select id="agency" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="agency.choose"/></option>
								  		<option value="1" ><spring:message code="agency.no1"/></option>
										<option value="2" ><spring:message code="agency.no2"/></option>
										<option value="3" ><spring:message code="agency.no3"/></option>
								  </select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="trucking.price"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-dollar"></i></span>
								  <input value="${trucking.price}" type="text" class="form-control" id="price">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class=""><spring:message code="trucking.unit"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-dollar"></i></span>
								  <select id="priceUnit" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="trucking.unit"/></option>
									  	<option value="1" ><spring:message code="price.unit.ton"/></option>
										<option value="2" ><spring:message code="price.unit.m3"/></option>
										<option value="3" ><spring:message code="price.unit.m3.km"/></option>
										<option value="3" ><spring:message code="price.unit.trip"/></option>
								  </select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-12">
							<div class="form-group">
								<label class="textarea"><spring:message code="description"/></label>
								<textarea id="description" style="resize:none; width: 100%" rows="5" name="comment" placeholder=""></textarea>
							</div>
						</div>
				</div>
				<div class="row text-center">
					<button id="btn-update-trucking" class="btn btn-primary" style="display:none">Cập nhật</button>&nbsp;
					<button id="btn-approve-trucking" class="btn btn-primary" style="display:none">Duyệt</button>&nbsp;
					<button id="btn-cancel-trucking" class="btn btn-danger" style="display:none">Hủy bỏ</button>&nbsp;
					<button id="btn-comeback" class="btn btn-default">Quay lại</button>&nbsp;
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/trucking/GoodsTruckingManager.js"></script>
<script>
	var goodsTruckingManager = new GoodsTruckingManager();
	$(function () {
		getResource(function(){
			goodsTruckingManager.init();
			goodsTruckingManager.initMode();
		});
	});
</script>


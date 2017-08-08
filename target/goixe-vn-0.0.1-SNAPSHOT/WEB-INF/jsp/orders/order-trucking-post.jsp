<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left"><spring:message code="trucking.order.post"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class=""><a href="/order/trucking"><spring:message code="trucking.order.management"/></a></li>
			<li class="active"><a href="#"><spring:message code="trucking.order.post"/></a></li>
		</ul>
	</div>
</div>
<br/>
<div class="container ">
	<!-- Begin Table -->
	<div class="col-6">
		<div class="table-search-v1">
			<div class="table-responsive panel panel-green margin-bottom-20">
				<div class="panel-heading" id="truckingHeader" style="cursor: pointer;">
					<h3 class="panel-title"><i class="fa fa-gear"></i><spring:message code="trucking.detail"/>
					<span id="truckCodeHeader" class="header-label"></span></h3>
				</div>
				<table class="table table-bordered table-striped" id="truckingDetailTable" style="display: none">
				<tbody>
					<tr>
						<td style="width: 20%;"><spring:message code="trucking.owner.code"/></td>
						<td id="ownerTruckId"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="trucking.code"/></td>
						<td id="truckCode"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="trucking.type"/></td>
						<td id="truckTypeName"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="trucking.goods.type"/></td>
						<td id="goodsTypeName"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="province.from"/></td>
						<td id="fromAddress"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="date.from"/></td>
						<td id="startDate"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="province.to"/></td>
						<td id="toAddress"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="trucking.weight"/></td>
						<td id="weightString"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="trucking.price"/></td>
						<td id="price"><span class="currency-vnd"></span></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="description"/></td>
						<td><div class="block-inline-toggle-more-detail">
								<p  id="description"></p>
							</div></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="agency"/></td>
						<td id="agency"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="date.post"/></td>
						<td id="postDate"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="date.approve"/></td>
						<td id="approveDate"></td>
					</tr>
					<tr>
						<td style="width: 20%;"><spring:message code="date.expire"/></td>
						<td id="expiredDate"></td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
	</div>
	<!-- Transaction info -->
	<div class="col-12">
		<div class="table-search-v1">
			<div class="table-responsive panel panel-green">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-gear"></i><spring:message code="price.offer" /></h3>
				</div>
			</div>
		</div>
		<div class="sky-form row">
			<div class="col-md-2"></div>
			<div class="col-md-4">
				<div class="form-group">
					<label class=""><spring:message code="trucking.weight"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
					  <input type="text" class="form-control" id="quantity">
					</div>
				</div>
			</div>
			<div class=" col-md-4">
				<div class="form-group">
					<label class=""><spring:message code="weight.unit"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-truck"></i></span>
					  <select id="weightUnit" class="form-control">
					  		<option value="-1" selected="selected"><spring:message code="weight.unit"/></option>
					  		<option value="1" ><spring:message code="weight.unit.ton"/></option>
							<option value="2" ><spring:message code="weight.unit.m3"/></option>
							<option value="3" ><spring:message code="weight.unit.kg"/></option>
					  </select>
					</div>
				</div>
			</div>
			<div class="col-sm-offset-2 col-md-4">
				<div class="form-group">
					<label class=""><spring:message code="price.offer.before" /></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-dollar"></i></span>
					  <input type="text" disabled="disabled" class="form-control" id="eventPrice">
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label class=""><spring:message code="price.offer.expect" /> (VNĐ)</label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-dollar"></i></span>
					  <input type="text" class="form-control" id="expectedPrice">
					</div>
				</div>
			</div>
			<div class="col-sm-offset-2 col-md-8">
				<div class="form-group">
					<label class=""><spring:message code="fee.shift" /> (VNĐ)</label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-dollar"></i></span>
					  <input type="text" class="form-control" id="shiftFee">
					</div>
				</div>
			</div>
			<div class="col-sm-offset-2 col-md-8">
				<div class="form-group">
					<label class=""><spring:message code="description" /></label>
					<div class="input-group ">
						<textarea id="descriptionOrder" style="resize:none; width: 47pc" rows="5" name="comment" placeholder=""></textarea>
					</div>
				</div>
			</div>
			<div class="col-sm-offset-2 col-md-8">
				<div class="form-group">
					<label class="checkbox-inline">
						<input type="checkbox" id="vatFee" name="vat_10" style="-webkit-appearance: checkbox; width: 15px; margin-top: 2px;"><spring:message code="vat.include" /></label> 
					<label class="checkbox-inline">
						<input type="checkbox" id="porterFee" name="fee_porter" style="-webkit-appearance: checkbox; width: 15px; margin-top: 2px;"><spring:message code="porter.include" /></label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-offset-4 col-lg-2" style="text-align: center">
				<label>&nbsp</label>
				<button id="addPostBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
					<i class="fa fa-check-square-o"></i>&nbsp<spring:message code="btn.post" /></button>
			</div>
			<div class="col-lg-2" style="text-align: center">
				<label>&nbsp</label>
				<button id="clearPostBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
					<i class="fa fa-refresh"></i>&nbsp<spring:message code="btn.reenter" /></button>
			</div>
		</div>
	</div>
	<!-- Map lộ trình dự kiến -->
	<div class="row" style="margin-left: 0px; margin-right: 0px;margin-top: 60px;">
		<div class="tab-v1">
				<ul class="nav nav-tabs">
					<li class="active"><a id="tab-1" href="#trackingPlan" data-toggle="tab" aria-expanded="true"><spring:message code="trip.tracking.plan"/></a></li>
					<li class="" ><a id="tab-2" href="#trackingCurrent" data-toggle="tab" aria-expanded="true"><spring:message code="trip.tracking.current"/></a></li>
				</ul>
				<div id="tab1-content" class="tab-content" >
					<div class="tab-pane fade active in" id="trackingPlan">
						<div id="map-trucking-plan" class="map google-maps"></div>
					</div>
				</div>
			</div>
		<div class="tab-v1">
				<div id="tab2-content" class="tab-content" style="display: none">
					<div class="tab-pane fade active in" id="trackingCurrent">
						<div id="map-tracking" class="map google-maps"></div>
					</div>
				</div>
			</div>
	</div>
	
<!-- 	<div class="row" style="margin-left: 0px; margin-right: 0px;margin-top: 60px;"> -->
<!-- 		<div class="tab-v1"> -->
<!-- 				<ul class="nav nav-tabs"> -->
<%-- 					<li class="active"><a href="#home" data-toggle="tab" aria-expanded="true"><spring:message code="trip.tracking"/></a></li> --%>
<!-- 				</ul> -->
<!-- 				<div class="tab-content"> -->
<!-- 					<div class="tab-pane fade active in" id="home"> -->
<!-- 						<div id="map" class="map google-maps"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 	</div> -->
</div>



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
<script src="/resources/js/orders/OrderTruckingPost.js"></script>
<script>
	var manager = new OrderTruckingPost();
	<c:forEach items="${listProvince}" var="province">
		manager.initProvince('${province.id}', '${province.name}');
	</c:forEach>
	$(document).ready(function(){
		getResource(function(){
			manager.init();
		});
		
	});	
	
</script>
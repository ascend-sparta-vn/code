<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- CSS Page Style -->
<link rel="stylesheet" href="/resources/css/pages/profile.css">
<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left"><spring:message code="order.trucking.manage"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li><a href="/order/trucking"><spring:message code="order.trucking.manage"/></a></li>
<!-- 			<li class="active"> -->
<%-- 				<spring:message code="order.trucking.detail"/> --%>
<%-- 						<a href="/shipment/post"><spring:message code="shipment.post"/></a> --%>
<!-- 			</li> -->
		</ul>
	</div>
</div>
		
<div class="container content profile">
	<div class="row">
		<!-- left menu account profile -->
		<%@include file="/WEB-INF/jsp/account/left-profile.jsp" %>
		<!-- add new post trucking -->
		<div class="col-md-9" id="">
			<div class="search-block">
				<div class="container">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="order.type" /></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
										  <select id="orderType" class="form-control">
										  		<option value="-1" selected="selected"><spring:message code="order.type.choose" /></option>
										  		<option value="1"><spring:message code="order.type.receive" /></option>
										  		<option value="2"><spring:message code="order.type.send" /></option>
										  </select>
										</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="trucking.type"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-truck"></i></span>
										  <select id="truckType" class="form-control">
										  		<option value="-1" selected="selected"><spring:message code="trucking.type.choose"/></option>
										  </select>
										</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="province.from"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
										  <select id="provinceFrom" class="form-control">
										  		<option value="-1" selected="selected"><spring:message code="province.from.choose"/></option>
										  </select>
										</div>
								</div>
							</div>
						</div>
						<!-- 				advanced search -->
						<div class="row" id="advanceSearchBox" style="display: none">
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="date.from"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>
										  <input type="text" class="datepicker form-control" id="fromDate">
										</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="date.to"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>
										  <input type="text" class="datepicker form-control" id="toDate">
										</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="province.to"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
										  <select id="provinceTo" class="form-control">
										  		<option value="-1" selected="selected"><spring:message code="province.to.choose"/></option>
										  </select>
										</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-2" style="text-align: center">
							</div>
							<div class="col-lg-3" style="text-align: center">
								<label>&nbsp</label>
								<button id="advancedTruckingBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
									<i class="fa fa-search-plus"></i>&nbsp<spring:message code="trucking.search.advance"/></button>
							</div>
							<div class="col-lg-3" style="text-align: center">
								<label>&nbsp</label>
								<button id="clearTruckingBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
									<i class="fa fa-refresh"></i>&nbsp<spring:message code="trucking.reenter"/></button>
							</div>
						</div>
				</div>
			</div>
			<div class="container content-sm col-lg-12">
				<!-- Begin Table Search v1 -->
				<div class="table-search-v1 margin-bottom-30">
					<div class="table-responsive">
						<table class="table table-bordered table-striped" id="orderTruckingTable">
							<thead>
								<tr>
									<th class="text-center"><spring:message code="trucking.no"/></th>
									<th class="text-center"><spring:message code="order.type"/></th>
									<th class="text-center"><spring:message code="trucking.type" /></th>
									<th class="text-center"><spring:message code="province.from"/></th>
									<th class="text-center"><spring:message code="manageUser.createdDateCol" /></th>
									<th class="nowrap"><spring:message code="view.detail" /></th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<!-- End Table Search v1 -->
			</div>
	</div>
		</div>
</div>

<script src="/resources/js/orders/OrderTruckingManager.js"></script>
<script>
var manager = new OrderTruckingManager();
<c:forEach items="${listProvince}" var="province">
	manager.initProvince('${province.id}', '${province.name}');
</c:forEach>


manager.currAccountId = <c:out value="${currAccountId}"/>;

$(document).ready(function(){
	$("#profile-menu-7").addClass("active");
	getResource(function(){
		manager.init();
		$('.datepicker').datepicker({format: 'dd/mm/yyyy', language: 'vi' });
	});
	
});	

function deleteOrderTrucking(id) {
	manager.deleteOrderTrucking(id);
}


</script>



<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left"><spring:message code="trucking.detail"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class="active"><a href="/order/trucking">Quản lý yêu cầu về xe</a></li>
			<li class="active"><a href="#">Chi tiết xe</a></li>
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
					<span id="truckingCodeHeader" class="header-label"></span></h3>
				</div>
				<table class="table table-bordered table-striped" id="truckingDetailTable" style="display: none">
					<tbody>
						<tr>
							<td style="width: 20%;">Mã xe</td>
							<td id="truckCode"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="trucking.type"/></td>
							<td id="truckType"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="trucking.goods.type"/></td>
							<td id="goodsTypeName"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="date.from"/></td>
							<td id="startDate"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="date.to"/></td>
							<td id="finishDate"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="province.from"/></td>
							<td id="fromAddress"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="province.to"/></td>
							<td id="toAddress"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="road.length"/> (km)</td>
							<td id="distance"></td>
						</tr>
						<tr>
							<td style="width: 20%;"><spring:message code="trucking.weight"/></td>
							<td id="weight"><span class=""></span></td>
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
	<div class="col-6">
		<div class="table-search-v1">
			<div class="table-responsive panel panel-green margin-bottom-20">
				<div class="panel-heading" id="orderHeader" style="cursor: pointer;">
					<h3 class="panel-title"><i class="fa fa-gear"></i>Thông tin giao dịch
					<span id="orderCodeHeader" class="header-label"></span></h3>
				</div>
				<table class="table table-bordered table-striped" id="orderDetailTable">
					<tbody>
						<tr>
							<td style="width: 20%;">Mã chủ hàng</td>
							<td id="ownerOrderId"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Mã đối tác</td>
							<td id="partnerId"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Mã hàng</td>
							<td id="eventId"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Số lượng hàng</td>
							<td id="quantity"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Giá đã chào</td>
							<td id="expectedPrice"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Phí VAT</td>
							<td id="vatFee"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Phí bốc vác</td>
							<td id="porterFee"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Chi phí lưu ca/xe</td>
							<td id="shiftFee"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Mô tả</td>
							<td id="descriptionOrder"></td>
						</tr>
						<tr>
							<td style="width: 20%;">Loại yêu cầu</td>
							<td id="orderType"></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td style="width: 20%;">Loại giao dịch</td> -->
<!-- 							<td id="transactionType"></td> -->
<!-- 						</tr> -->
						<tr>
							<td style="width: 20%;">Ngày tạo</td>
							<td id="createdDate"></td>
						</tr>
					</tbody>
				</table>
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
</div>



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
<script src="/resources/js/util/marker_lable.js"></script>
<script src="/resources/js/orders/OrderTruckingDetail.js"></script>
<script>
	var manager = new OrderTruckingDetail();
	<c:forEach items="${listProvince}" var="province">
		manager.initProvince('${province.id}', '${province.name}');
	</c:forEach>
	$(function () {
		manager.init();
	});

</script>
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
			<li><a href="/trucking/list-trucking"><spring:message code="trucking.trucking.list"/></a></li>
			<li class="active"><a href="#"><spring:message code="trucking.detail"/></a></li>
		</ul>
	</div>
</div>
<br/>
<div class="container ">
	<!-- Begin Table -->

	<div class="table-search-v1">
		<div class="table-responsive panel panel-green margin-bottom-20">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-gear"></i><spring:message code="trucking.detail"/><span id="truckCodeHeader" class="header-label"></span></h3>
				</h3>
			</div>
			<div id="orderCartDiv" style="position: absolute; right: 199px; display: none">
				<a id="orderCart" style="cursor: pointer;">
					<img alt="" src="/resources/img/cart.png" style="idth: 100px; height: 100px;">
				</a>
			</div>
			<table class="table table-bordered table-striped" id="truckingDetailTable">
				<tbody>
				<tr>
					<td style="width: 20%;"><spring:message code="trucking.title"/></td>
					<td id="title"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><spring:message code="trucking.owner.code"/></td>
					<td id="ownerTruckId"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><spring:message code="trucking.code"/></td>
					<td id="truckCode"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><spring:message code="trucking.plateNumber"/></td>
					<td id="plateNumber"></td>
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
					<td id="description">
						<!-- <div class="block-inline-toggle-more-detail">
								<p  id="description"></p>
							</div> -->
					</td>
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
		<div class="col-12">
			<div class="col-sm-6">
				<p style="display: none;" class="col-sm-offset-3 col-sm-3 pull-right text-center " id="btnPreviousDiv"><a id="btnPrevious" href="" class="btn btn-primary" style="" title="Xe trước"><spring:message code="trucking.previous"/></a>&nbsp;</p>
			</div>
			<div class="col-sm-6">
				<p style="display: none;" class="col-sm-3 pull-left text-center" id="btnNextDiv"><a id="btnNext" href="" class="btn btn-primary" style="" title="Xe sau"><spring:message code="trucking.next"/></a>&nbsp;</p>
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




<script src="https://maps.googleapis.com/maps/api/js?libraries=geometry,drawing,weather,visualization&sensor=false&v=3.exp&key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
<script src="/resources/js/util/marker_lable.js"></script>
<script src="/resources/js/trucking/TruckingDetail.js"></script>
<script>
    var manager = new TruckingDetail();
    <c:forEach items="${listProvince}" var="province">
    manager.initProvince('${province.id}', '${province.name}');
    </c:forEach>

    manager.currAccountId = <c:out value="${currAccountId}"/>;

    $(document).ready(function() {
        manager.init();
    });


</script>
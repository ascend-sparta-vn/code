<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left"><spring:message code="shipment.detail"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class="active"><a href="/shipment/list"><spring:message code="shipment.list"/></a></li>
			<li class="active"><a href="#"><spring:message code="shipment.detail"/></a></li>
		</ul>
	</div>
</div>
<br/>
<div class="container ">
	<!-- Begin Table -->

	<!-- 	<button id="searchTruckingBtn" class="btn rounded btn-success btn-u-sm form-control col-lg-2" type="button"><i class="fa fa-search"></i></button> -->
	<div class="table-search-v1">
		<div class="table-responsive panel panel-green margin-bottom-20">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-gear"></i><spring:message code="shipment.detail"/>
					<span id="shipmentCodeHeader" class="header-label"></span>
				</h3>
			</div>
			<div id="orderCartDiv" style="position: absolute; right: 199px; display: none">
				<a id="orderCart" style="cursor: pointer;">
					<img alt="" src="/resources/img/cart.png" style="idth: 100px; height: 100px;">
				</a>
			</div>
			<table class="table table-bordered table-striped" id="shipmentDetailTable">
				<tbody>
				<tr>
					<td style="width: 20%;"><spring:message code="owner.code"/></td>
					<td id="ownerId"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><spring:message code="shipment.code"/></td>
					<td id="code"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><spring:message code="shipment.dealType"/></td>
					<td id="dealType"></td>
				</tr>
				<tr>
					<td style="width: 20%;"><spring:message code="shipment.name"/></td>
					<td id="name"></td>
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
					<td style="width: 20%;"><spring:message code="description"/>
					</td>
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
				<p style="display: none;" class="col-sm-offset-3 col-sm-3 pull-right text-center " id="btnPreviousDiv"><a id="btnPrevious" href="" class="btn btn-primary" style="" title="Xe trước"><spring:message code="shipment.previous"/></a>&nbsp;</p>
			</div>
			<div class="col-sm-6">
				<p style="display: none;" class="col-sm-3 pull-left text-center" id="btnNextDiv"><a id="btnNext" href="" class="btn btn-primary" style="" title="Xe sau"><spring:message code="shipment.next"/></a>&nbsp;</p>
			</div>
		</div>
		<br>
	</div>

	<!-- Map lộ trình dự kiến -->
	<div class="row" style="margin-left: 0px; margin-right: 0px;margin-top: 60px;">
		<div class="tab-v1">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#trackingPlan" data-toggle="tab" aria-expanded="true"><spring:message code="trip.tracking.plan"/></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade active in" id="trackingPlan">
					<div id="map-trucking-plan" class="map google-maps"></div>
				</div>
			</div>
		</div>
	</div>
</div>



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
<script src="/resources/js/shipment/ShipmentDetail.js"></script>
<script>
    var manager = new ShipmentDetail();
    <c:forEach items="${listProvince}" var="province">
    manager.initProvince('${province.id}', '${province.name}');
    </c:forEach>

    manager.currAccountId = <c:out value="${currAccountId}"/>;
    $(document).ready(function(){
        getResource(function(){
            manager.init();
        });
    });

</script>
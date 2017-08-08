<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumbs">
			<div class="container">
				<h1 class="pull-left"><spring:message code="shipment.list"/></h1>
				<ul class="pull-right breadcrumb">
					<li><a href="/"><spring:message code="homepage"/></a></li>
					<li class="active"><spring:message code="shipment.list"/>
					</li>
				</ul>
			</div>
		</div>
		
	<div class="search-block">
			<div class="container">
				<div>
					<div class="row">
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
							<div class="col-sm-3">
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
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="date.from"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>
										  <input type="text" class="datepicker form-control" id="fromDate">
										</div>
								</div>
							</div>
						</div>
						<!-- 				advanced search -->
						<div class="row" id="advanceSearchBox" style="display: none">
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="district.from"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
										  <select id="districtFrom" class="form-control">
										  		<option value="-1" selected="selected"><spring:message code="district.from.choose"/></option>
										  </select>
										</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label class=""><spring:message code="district.to"/></label>
										<div class="input-group ">
										  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
										  <select id="districtTo" class="form-control">
										  		<option value="-1" selected="selected"><spring:message code="district.to.choose"/></option>
										  </select>
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
						</div>
						<div class="row">
							<div class="col-lg-offset-2 col-lg-2" style="text-align: center">
							</div>
							<div class="col-lg-2" style="text-align: center">
								<label>&nbsp</label>
								<button id="advancedTruckingBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
									<i class="fa fa-search-plus"></i>&nbsp<spring:message code="trucking.search.advance"/></button>
							</div>
							<div class="col-lg-2" style="text-align: center">
								<label>&nbsp</label>
								<button id="clearTruckingBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
									<i class="fa fa-refresh"></i>&nbsp<spring:message code="trucking.reenter"/></button>
							</div>
						</div>
				</div>
			</div>
		</div>
		
		<div class="container content-sm">
			<!-- Begin Table Search v1 -->
			<div class="table-search-v1 margin-bottom-30">
				<div class="table-responsive">
					<table class="table table-bordered table-striped" id="shipmentTable">
						<thead>
							<tr>
								<th class="text-center"><spring:message code="trucking.no"/></th>
								<th class="text-center"><spring:message code="shipment.code"/></th>
								<th class="text-center"><spring:message code="shipment.name"/></th>
								<th class="text-center"><spring:message code="province.from"/></th>
								<th class="text-center"><spring:message code="province.to"/></th>
								<th class="text-center"><spring:message code="trucking.goods.type"/></th>
								<th class="text-center"><spring:message code="trucking.weight"/></th>
								<th class="text-center"><spring:message code="trucking.price"/></th>
<%-- 								<th class="text-center"><spring:message code="date.from"/></th> --%>
								<th class="text-center"><spring:message code="date.expire"/></th>
								<th class="nowrap"></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<!-- End Table Search v1 -->
</div>
<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/resources/js/shipment/ShipmentManager.js"></script>
<script src="/resources/js/shipment/ShipmentDetail.js"></script>
<script type="text/javascript" src="/resources/js/locales/bootstrap-datepicker.vi.js"  charset="UTF-8"></script>
<script>
var shipmentManager = new ShipmentManager();

	<c:forEach items="${listProvince}" var="province">
		shipmentManager.initProvince('${province.id}', '${province.name}');
	</c:forEach>

	$(document).ready(function() {
		shipmentManager.init();
		$('.datepicker').datepicker({
			format : 'dd/mm/yyyy',
			language : 'vi'
		});
	});
// 	$(function() {
// 		shipmentManager.init();
// 		$('.datepicker').datepicker({
// 			format : 'dd/mm/yyyy',
// 			language : 'vi'
// 		});
// 	});

</script>

<style>
select:not([multiple]) {
    -webkit-appearance: none;
    -moz-appearance: none;
    background-position: right 50%;
    background-repeat: no-repeat;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAMCAYAAABSgIzaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDZFNDEwNjlGNzFEMTFFMkJEQ0VDRTM1N0RCMzMyMkIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDZFNDEwNkFGNzFEMTFFMkJEQ0VDRTM1N0RCMzMyMkIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0NkU0MTA2N0Y3MUQxMUUyQkRDRUNFMzU3REIzMzIyQiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0NkU0MTA2OEY3MUQxMUUyQkRDRUNFMzU3REIzMzIyQiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PuGsgwQAAAA5SURBVHjaYvz//z8DOYCJgUxAf42MQIzTk0D/M+KzkRGPoQSdykiKJrBGpOhgJFYTWNEIiEeAAAMAzNENEOH+do8AAAAASUVORK5CYII=);
    padding: .5em;
    padding-right: 1.5em
}
</style>
		
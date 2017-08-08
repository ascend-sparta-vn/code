<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- CSS Page Style -->
<link rel="stylesheet" href="/resources/css/pages/profile.css">
<div class="breadcrumbs">
			<div class="container">
				<h1 class="pull-left"><spring:message code="shipment.post"/></h1>
				<ul class="pull-right breadcrumb">
					<li><a href="/"><spring:message code="homepage"/></a></li>
					<li><a href="/shipment/list"><spring:message code="shipment.list"/></a></li>
					<li class="active">
						<spring:message code="shipment.post"/>
<%-- 						<a href="/shipment/post"><spring:message code="shipment.post"/></a> --%>
					</li>
				</ul>
			</div>
		</div>


		
<div class="container content profile">
	<div class="row">
		<!-- left menu account profile -->
		<%@include file="/WEB-INF/jsp/account/left-profile.jsp" %>
		<!-- add new post trucking -->
		<div class="col-md-9" id="post-trucking-new">
			<div class="sky-form">
				<header><spring:message code="shipment.post.info"/></header>
				<fieldset>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="shipment.name"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
								  <input type="text" class="form-control" id="name">
								</div>
							</div>
						</section>
					</div>
				</fieldset>
				<fieldset>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="trucking.goods.type"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
								  <select id="goodsType" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="trucking.goods.type.choose"/></option>
								  </select>
								</div>
							</div>
						</section>
<!-- 						<section class="col col-6"> -->
<!-- 							<div class="form-group"> -->
<%-- 								<label class=""><spring:message code="shipment.code"/></label> --%>
<!-- 								<div class="input-group "> -->
<!-- 								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span> -->
<!-- 								  <input type="text" class="form-control" id="code"> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</section> -->
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="shipment.dealType"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-exchange"></i></span>
								  <select id="dealType" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="shipment.dealType.choose"/></option>
								  </select>
								</div>
							</div>
						</section>
					</div>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="trucking.weight"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
								  <input type="text" class="form-control" id="weight">
								</div>
							</div>
						</section>
						<section class="col col-6">
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
						</section>
					</div>
				</fieldset>
		
				<fieldset>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="province.from"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
								  <select id="fromProvince" class="form-control">
								  		<option value="-1" selected="selected"><spring:message code="province.from.choose"/></option>
								  </select>
								</div>
							</div>
						</section>
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="province.to"/></label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
									  <select id="toProvince" class="form-control">
									  		<option value="-1" selected="selected"><spring:message code="province.to.choose"/></option>
									  </select>
								</div>
							</div>
						</section>
					</div>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="district.from"/></label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
									  <select id="fromDistrict" class="form-control">
									  		<option value="-1" selected="selected"><spring:message code="district.from.choose"/></option>
									  </select>
								</div>
							</div>
						</section>
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="district.to"/></label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
									  <select id="toDistrict" class="form-control">
									  		<option value="-1" selected="selected"><spring:message code="district.to.choose"/></option>
									  </select>
								</div>
							</div>
						</section>
					</div>
					<div class="row">
						<section class="col col-6">
							<label class="textarea"><spring:message code="address.from"/></label>
							<div class="input-group ">
								<textarea id="fromDetailAddress" style="width: 380px; resize: none" rows="2" name="comment" placeholder=""></textarea>
							</div>
						</section>
						<section class="col col-6">
							<section clas="col col-12">
								<label class="textarea"><spring:message code="address.to"/></label>
							<div class="input-group ">
								<textarea id="toDetailAddress" style="width: 380px; resize: none" rows="2" name="comment" placeholder=""></textarea>
							</div>
						</section>
					</div>
				</fieldset>
				<fieldset>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="date.from"/> (*)</label>
								<div class="input-group ">
									  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>
									  <input type="text" class="datepicker form-control" id="startDate">
								</div>
							</div>
						</section>
						<section class="col col-6">
							<label class=""><spring:message code="date.expire"/> (*)</label>
							<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>
								  <input type="text" class="datepicker form-control" id="expiredDate">
							</div>
						</section>
					</div>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="road.length"/> (km)</label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
								  <input type="text" class="form-control" id="roadLength">
								</div>
							</div>
						</section>
						<section class="col col-6">
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
						</section>
					</div>
					<div class="row">
						<section class="col col-6">
							<div class="form-group">
								<label class=""><spring:message code="trucking.price"/></label>
								<div class="input-group ">
								  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-dollar"></i></span>
								  <input type="text" class="form-control" id="price">
								</div>
							</div>
						</section>
						<section class="col col-6">
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
						</section>
					</div>
					<section clas="col col-12">
						<label class="textarea"><spring:message code="description"/></label>
						<div class="input-group ">
							<textarea id="description" style="resize:none; width: 49pc" rows="5" name="comment" placeholder=""></textarea>
						</div>
					</section>
				</fieldset>
				<fieldset style="padding-top: 0px; border-top-width: 0px; margin-top: -30px;">
					<div class="row">
						<div class="col-lg-offset-4 col-lg-2" style="text-align: center">
							<label>&nbsp</label>
							<button id="addPostBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
								<i class="fa fa-check-square-o"></i>&nbsp<spring:message code="btn.post"/></button>
						</div>
						<div class="col-lg-2" style="text-align: center">
							<label>&nbsp</label>
							<button id="clearPostBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">
								<i class="fa fa-refresh"></i>&nbsp<spring:message code="btn.reenter"/></button>
						</div>
					</div>
				</fieldset>
			</div>
		</div>

	</div>
</div>

<script src="/resources/js/shipment/ShipmentPost.js"></script>
<script>
var manager = new ShipmentPost();

$(document).ready(function(){
	getResource(function(){
		$("#profile-menu-4").addClass("active");
		manager.init();
		$('.datepicker').datepicker({format: 'dd/mm/yyyy', language: 'vi' });
	});
	
});	

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


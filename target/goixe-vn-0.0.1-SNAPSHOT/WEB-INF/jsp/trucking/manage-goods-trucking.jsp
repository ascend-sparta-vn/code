<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="/resources/css/pages/page_search_inner_tables.css"
	rel="stylesheet" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />

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



<div class="container content profile">
	<div class="row">
		<%@include file="/WEB-INF/jsp/account/left-profile.jsp"%>

		<!-- Profile Content -->
		<div class="col-md-9">
			<div class="tag-box tag-box-v3 form-page">
				<div class="headline">
					<h2 class="label-headline"><spring:message code="trucking.trucking.list" /></h2>
				</div>
				<div class="row">
					<table class="table table-bordered table-striped" id="truckingTable">
							<thead>
							<tr>
								<th class="text-center"><spring:message code="trucking.code"/></th>
								<th class="text-center"><spring:message code="province.from"/></th>
								<th class="text-center"><spring:message code="province.to"/></th>
								<th class="text-center"><spring:message code="status"/></th>
								<th class="text-center"><spring:message code="date.from"/></th>
								<th class="nowrap"></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- End Profile Content -->
	</div>
</div>

<!-- Modal -->
<div id="error-dialog" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <b id = "error-content">Some text in the modal.</b>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<script type="text/javascript" src="/resources/js/trucking/GoodsTruckingManager.js"></script>
<script>
	var goodsTruckingManager = new GoodsTruckingManager();
	<c:forEach items="${listProvince}" var="province">
	goodsTruckingManager.initProvince('${province.id}', '${province.name}');
	</c:forEach>
	
	$(function () {
		getResource(function(){
			goodsTruckingManager.init();
		});
	});
	
	function editGoodsTrucking(id) {
		window.location.href = '/trucking/edit-goods-trucking/' + id;
	}
	
	function deleteGoodsTrucking(id){
		goodsTruckingManager.deleteGoodsTrucking(id);
	}
</script>

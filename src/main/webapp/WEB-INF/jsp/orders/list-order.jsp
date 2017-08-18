<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<input type="hidden" id="currentPage" value="${currentPage}" />
<input type="hidden" id="size" value="${size}" />
<div class="breadcrumbs-v4">
	<div class="container">
		<span class="page-name">Searching</span>
		<h1>List of <span class="shop-blue">Order</span> </h1>
		<ul class="breadcrumb-v4-in">
			<li><a href="index.html">Homepage</a></li>
			<li class="active shop-blue">Order List</li>
		</ul>
	</div><!--/end container-->
</div>

<div class="search-block">
	<div class="container">
		<div>
			<%--<div class="row" id="advanceSearchBox" style="display: none">--%>
				<%--<div class="col-sm-3">--%>
					<%--<div class="form-group">--%>
						<%--<label class=""><spring:message code="district.from"/></label>--%>
						<%--<div class="input-group ">--%>
							<%--<span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>--%>
							<%--<select id="districtFrom" class="form-control">--%>
								<%--<option value="-1" selected="selected"><spring:message code="district.from.choose"/></option>--%>
							<%--</select>--%>

						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
				<%--<div class="col-sm-3">--%>
					<%--<div class="form-group">--%>
						<%--<label class=""><spring:message code="district.to"/></label>--%>
						<%--<div class="input-group ">--%>
							<%--<span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>--%>
							<%--<select id="districtTo" class="form-control">--%>
								<%--<option value="-1" selected="selected"><spring:message code="district.to.choose"/></option>--%>
							<%--</select>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
				<%--<div class="col-sm-3">--%>
					<%--<div class="form-group">--%>
						<%--<label class=""><spring:message code="date.to"/></label>--%>
						<%--<div class="input-group ">--%>
							<%--<span class="input-group-addon" id="sizing-addon1"><i class="fa fa-calendar"></i></span>--%>
							<%--<input type="text" class="datepicker form-control" id="toDate">--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
			<%--<div class="row">--%>
				<%--<div class="col-lg-offset-2 col-lg-2" style="text-align: center">--%>
				<%--</div>--%>
				<%--<div class="col-lg-2" style="text-align: center">--%>
					<%--<label>&nbsp</label>--%>
					<%--<button id="advancedTruckingBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">--%>
						<%--<i class="fa fa-search-plus"></i>&nbsp<spring:message code="trucking.search.advance"/></button>--%>
				<%--</div>--%>
				<%--<div class="col-lg-2" style="text-align: center">--%>
					<%--<label>&nbsp</label>--%>
					<%--<button id="clearTruckingBtn" class="btn rounded btn-primary btn-u-sm form-control" style="color: white;" type="button">--%>
						<%--<i class="fa fa-refresh"></i>&nbsp<spring:message code="trucking.reenter"/></button>--%>
				<%--</div>--%>
			<%--</div>--%>
		</div>
	</div>
</div>

<div class="container content-sm">
	<div class="row">
		<div class="col-md-3 filter-by-block md-margin-bottom-60">
			<h1>Categories</h1>
			<%--panel group    --%>
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
								Status
								<i class="fa fa-angle-down"></i>
							</a>
						</h2>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<ul class="list-unstyled checkbox-list">
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" checked />
										<i></i>
										Delivering
										<small><a href="#">(23)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" checked />
										<i></i>
										Complete
										<small><a href="#">(4)</a></small>
									</label>
								</li>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" />--%>
										<%--<i></i>--%>
										<%--Apple--%>
										<%--<small><a href="#">(11)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" checked/>--%>
										<%--<i></i>--%>
										<%--Water Melon--%>
										<%--<small><a href="#">(3)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" />--%>
										<%--<i></i>--%>
										<%--Strawberry--%>
										<%--<small><a href="#">(87)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--/end panel group-->
			<%--<div class="panel-group" id="accordion">--%>
				<%--<div class="panel panel-default">--%>
					<%--<div class="panel-heading">--%>
						<%--<h2 class="panel-title">--%>
							<%--<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">--%>
								<%--Providers--%>
								<%--<i class="fa fa-angle-down"></i>--%>
							<%--</a>--%>
						<%--</h2>--%>
					<%--</div>--%>
					<%--<div id="collapseOne" class="panel-collapse collapse in">--%>
						<%--<div class="panel-body">--%>
							<%--<ul class="list-unstyled checkbox-list">--%>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" checked />--%>
										<%--<i></i>--%>
										<%--Happy Farm--%>
										<%--<small><a href="#">(23)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" checked />--%>
										<%--<i></i>--%>
										<%--Monday Farm--%>
										<%--<small><a href="#">(4)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" />--%>
										<%--<i></i>--%>
										<%--Frenzy Farm--%>
										<%--<small><a href="#">(11)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" />--%>
										<%--<i></i>--%>
										<%--Green Farm--%>
										<%--<small><a href="#">(3)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
								<%--<li>--%>
									<%--<label class="checkbox">--%>
										<%--<input type="checkbox" name="checkbox" />--%>
										<%--<i></i>--%>
										<%--Organic Farm--%>
										<%--<small><a href="#">(87)</a></small>--%>
									<%--</label>--%>
								<%--</li>--%>
							<%--</ul>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
			<button id="resetButton" type="button" class="btn-u btn-brd btn-brd-hover btn-u-lg btn-u-sea-shop btn-block">Reset</button>
		</div>

		<div class="col-md-9">
			<div class="row margin-bottom-5">
				<div class="col-sm-6 result-category">
					<h2> List of Order </h2>
					<small class="shop-bg-red badge-results" id="totalResult">${listOrder.size()}</small>
				</div>
				<div class="col-sm-6">
					<ul class="list-inline clear-both">
						<li class="sort-list-btn">
							<h3> :</h3>
							<div class="btn-group">
								<!-- 										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> -->
								<!-- 											20 <span class="caret"></span> -->
								<!-- 										</button> -->
								<select id="pageSize">
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="50">50</option>
								</select>
							</div>
						</li>
					</ul>
				</div>
			</div><!--/end result category-->

			<div class="filter-results" id="contentData">

				<div class="panel panel-red margin-bottom-40">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-user"></i> LIST OF ORDERS </h3>
					</div>
					<div class="panel-body">
						<table class="table">
							<thead>
							<tr>
								<th>STT</th>
								<th>ORDER</th>
								<th class="hidden-sm">PRODUCTS</th>
								<th>DELIVER</th>
								<th>STATUS</th>
								<%--<th>TRACKING</th>--%>
								<th>VIEW </th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${listOrder}" var="item" varStatus="myIndex">
							<tr>
								<td>${myIndex.index + 1}</td>
								<td>
									<code>CODE_2017${item.id}</code> <br/>
									<fmt:formatDate value="${item.createdTimestamp}" pattern="MM/dd/yyyy"/><br/>
									Customer: <a href="shop-ui-inner.html">${item.user.username}</a><br/>
									Amount: <a href="shop-ui-inner.html">${item.totalAmount}</a><br/>
								</td>
								<td>
									<c:forEach items="${item.products}" var="product">
										<div >
											<di>
												- ${product.name}
											</di>
											<div style="margin-left: 10px;">${product.amount}</div>
											<div style="margin-left: 10px;">${product.description}</div>
										</div>
									</c:forEach>
								</td>
								<td>
									<c:if test="${userType == 1}">
										<select id="deliverId" onchange="assignToOrder(this, ${item.id}); ">
											<option value="-1"> --Select-- </option>
											<c:forEach items="${listDeliver}" var="deliver" varStatus="myIndex">
												<option value="${deliver.id}" <c:if test="${item.currentDeliverId == deliver.id}"> selected </c:if>  >
														${deliver.username}
												</option>
											</c:forEach>
										</select>
									</c:if>
									<c:if test="${userType == 2}">
										${item.currentDeliverName}
									</c:if>

								</td>
								<td <c:if test="${item.status == 3}"> style="color:greenyellow" </c:if>  id="td_${item.id}" >
									<c:if test="${item.status == 1}">
										Wait for delivering
									</c:if>
									<c:if test="${item.status == 2}">
										Delivering
									</c:if>
									<c:if test="${item.status == 3}">
										Complete
									</c:if>
								</td>
								<%--<td><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete</button></td>--%>
								<td>
									<button class="btn btn-info btn-xs" id="viewOrderDetail" type="button"
											onclick="location.href= '/order/detail/${item.id}'">
										Detail
									</button>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div><!--/end filter resilts-->

			<div class="text-center">
				<ul class="pagination pagination-v2" id="pagingContent">
				</ul>
			</div><!--/end pagination-->
		</div>
	</div>
	<!-- End Table Search v1 -->
</div>

<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<%--<script src="/resources/js/shipment/ShipmentManager12.js"></script>--%>
<%--<script src="/resources/js/shipment/ShipmentDetail.js"></script>--%>
<script type="text/javascript" src="/resources/js/locales/bootstrap-datepicker.vi.js"  charset="UTF-8"></script>
<script>

	function assignToOrder(obj, order_id) {

		var post = {};
		post.order_id = order_id;
		post.user_id = obj.value;

		var url = '/order/deliverorder?order_id=' + order_id + '&user_id=' + obj.value;
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : url,
			beforeSend: waitingProcess,
			complete: completeProcess,
			dataType : 'json',
			success : function(response) {
				$('#td_' + order_id).html('Delivering');
			},
			error : function(e) {
				showMessage('ERROR: /order/deliverorder', 'error');
				console.log("ERROR deliverorder: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});

	}

	function viewOrderDetail(orderId) {
		var url = '/order/detail/' + orderId;
		$.get(url, function (data, status) {
		});
	}

	var shipmentManager1 = new ShipmentManager1();

	<c:forEach items="${listOrder}" var="province">
	//shipmentManager1.initProvince('${province.id}', '${province.user.username}');
	</c:forEach>

	$(document).ready(function() {
		$('.datepicker').datepicker({
			format : 'dd/mm/yyyy',
			language : 'vi'
		});
		getResource(function(){
			shipmentManager1.init();
		});
	});
</script>

<style>

</style>
<script>

</script>

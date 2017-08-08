<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<div class="breadcrumbs-v4">
	<div class="container">
		<span class="page-name"><spring:message code="common.search"/></span>
		<h1> <spring:message code="common.list"/> <span class="shop-blue"><spring:message code="trucking.lable"/></span> </h1>
		<ul class="breadcrumb-v4-in">
			<li><a href="index.html"><spring:message code="homepage"/></a></li>
			<li class="active shop-blue"><spring:message code="trucking.lable"/></li>
		</ul>
	</div><!--/end container-->
</div>
<input type="hidden" id="currentPage" value="${currentPage}" />
<input type="hidden" id="size" value="${size}" />
<div class="search-block">
	<div class="container">
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
							<option value="-1" selected="selected"><spring:message code="district.to.choose"/></option>
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

<div class="content container">
	<div class="row">
		<div class="col-md-3 filter-by-block md-margin-bottom-60">
			<h1><spring:message code="trucking.filter-result"/></h1>
			<!-- <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                Nhà xe
                                <i class="fa fa-angle-down"></i>
                            </a>
                        </h2>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled checkbox-list">
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox" checked="">
                                        <i></i>
                                        Nhà xe Hải Âu
                                        <small><a href="#">(23)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox" checked="">
                                        <i></i>
                                        Nhà xe Hoàng Long
                                        <small><a href="#">(4)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox">
                                        <i></i>
                                        Nhà xe Anh Huy
                                        <small><a href="#">(11)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox">
                                        <i></i>
                                        Nhà Xe Trí Đức
                                        <small><a href="#">(3)</a></small>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox">
                                        <i></i>
                                        Nhà Xe Nam Anh
                                        <small><a href="#">(87)</a></small>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>/end panel group -->

			<div class="panel-group" id="accordion-v2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseTwo">
								<spring:message code="kind.of.goods.trading" />
								<i class="fa fa-angle-down"></i>
							</a>
						</h2>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse in">
						<div class="panel-body">
							<ul class="list-unstyled checkbox-list">
								<c:forEach var="item" items="${listGoods}">
									<li>
										<label class="checkbox">
											<input id="${item.id}" type="checkbox" name="checkbox" onclick="filterType(${item.id}, 'goodsType')">
											<i></i>
												${item.filter}
											<small><a href="#">(${item.quantity})</a></small>
										</label>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div><!--/end panel group-->

			<!-- 					<div class="panel-group" id="accordion-v3"> -->
			<!-- 						<div class="panel panel-default"> -->
			<!-- 							<div class="panel-heading"> -->
			<!-- 								<h2 class="panel-title"> -->
			<!-- 									<a data-toggle="collapse" data-parent="#accordion-v3" href="#collapseThree"> -->
			<!-- 										Khối lượng hàng -->
			<!-- 										<i class="fa fa-angle-down"></i> -->
			<!-- 									</a> -->
			<!-- 								</h2> -->
			<!-- 							</div> -->
			<!-- 							<div id="collapseThree" class="panel-collapse collapse in"> -->
			<!-- 								<div class="panel-body"> -->
			<!-- 									<ul class="list-unstyled checkbox-list"> -->
			<!-- 										<li> -->
			<!-- 											<label class="checkbox"> -->
			<!-- 												<input type="checkbox" name="checkbox"> -->
			<!-- 												<i></i> -->
			<!-- 												Nhỏ hơn 1 tấn -->
			<!-- 												<small><a href="#">(23)</a></small> -->
			<!-- 											</label> -->
			<!-- 										</li> -->
			<!-- 										<li> -->
			<!-- 											<label class="checkbox"> -->
			<!-- 												<input type="checkbox" name="checkbox" checked=""> -->
			<!-- 												<i></i> -->
			<!-- 												Từ 1-5 tấn -->
			<!-- 												<small><a href="#">(4)</a></small> -->
			<!-- 											</label> -->
			<!-- 										</li> -->
			<!-- 										<li> -->
			<!-- 											<label class="checkbox"> -->
			<!-- 												<input type="checkbox" name="checkbox"> -->
			<!-- 												<i></i> -->
			<!-- 												Từ 5-10 tấn -->
			<!-- 												<small><a href="#">(11)</a></small> -->
			<!-- 											</label> -->
			<!-- 										</li> -->
			<!-- 										<li> -->
			<!-- 											<label class="checkbox"> -->
			<!-- 												<input type="checkbox" name="checkbox"> -->
			<!-- 												<i></i> -->
			<!-- 												Trên 10 tấn -->
			<!-- 												<small><a href="#">(3)</a></small> -->
			<!-- 											</label> -->
			<!-- 										</li> -->
			<!-- 									</ul> -->
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div>/end panel group -->

			<div class="panel-group" id="accordion-v3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-v3" href="#collapseThree">
								<spring:message code="trucking.type"/>
								<i class="fa fa-angle-down"></i>
							</a>
						</h2>
					</div>
					<div id="collapseThree" class="panel-collapse collapse in">
						<div class="panel-body">
							<ul class="list-unstyled checkbox-list">

								<c:forEach var="item" items="${listTruckTypes}">
									<li>
										<label class="checkbox">
											<input type="checkbox" id="${item.id}" name="checkbox" onclick="filterType(${item.id}, 'truckType')">
											<i></i>
												${item.filter}
											<small><a href="#">(${item.quantity})</a></small>
										</label>
									</li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
			</div><!--/end panel group-->


			<button id="resetButton" type="button" class="btn-u btn-brd btn-brd-hover btn-u-lg btn-u-sea-shop btn-block"><spring:message code="trucking.btn-reset"/> </button>
		</div>

		<div class="col-md-9">
			<div class="row margin-bottom-5">
				<div class="col-sm-6 result-category">
					<h2><spring:message code="homepage.listTrucking"/> </h2>
					<small class="shop-bg-red badge-results" id="totalResult"></small>
				</div>
				<div class="col-sm-6">
					<ul class="list-inline clear-both">
						<li class="sort-list-btn">
							<h3><spring:message code="view.show.row"/> :</h3>
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
				<div class="list-product-description product-description-brd margin-bottom-30">
				</div>
				<div class="list-product-description product-description-brd margin-bottom-30">
					<div class="row">
					</div>
				</div>
			</div><!--/end filter resilts-->

			<div class="text-center">
				<ul class="pagination pagination-v2" id="pagingContent">
				</ul>
			</div><!--/end pagination-->
		</div>
	</div><!--/end row-->
</div>
<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/resources/js/shop.app.js"></script>
<script src="/resources/js/trucking/TruckingManager1.js"></script>
<script src="/resources/js/trucking/TruckingDetail.js"></script>
<script type="text/javascript" src="/resources/js/locales/bootstrap-datepicker.vi.js"  charset="UTF-8"></script>
<script>
    var truckingManager1 = new TruckingManager1();
    <c:forEach items="${listProvince}" var="province">
    truckingManager1.initProvince('${province.id}', '${province.name}');
    </c:forEach>

    $(function () {
        $('.datepicker').datepicker({
            format : 'dd/mm/yyyy',
            language : 'vi'
        });
        getResource(function(){
            truckingManager1.init();
        });
    });

    function filterType(goodsTypeId, type) {
        truckingManager1.filter(goodsTypeId, type);
        $("html, body").animate({ scrollTop: 200 }, "slow");
    }
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
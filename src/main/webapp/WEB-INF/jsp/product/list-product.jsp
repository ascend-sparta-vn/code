<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<input type="hidden" id="currentPage" value="${currentPage}" />
<input type="hidden" id="size" value="${size}" />
<div class="breadcrumbs-v4">
	<div class="container">
		<span class="page-name">Tìm kiếm</span>
		<h1>Danh sách <span class="shop-blue">Hàng vận chuyển</span> </h1>
		<ul class="breadcrumb-v4-in">
			<li><a href="index.html">Trang chủ</a></li>
			<li class="active shop-blue">Hàng vận chuyển</li>
		</ul>
	</div><!--/end container-->
</div>

<div class="container content-sm">
	<div class="row">
		<div class="col-md-3 filter-by-block md-margin-bottom-60">
			<h1>Lọc kết quả</h1>
			<%--panel group	--%>
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
								Brands
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
										Calvin Klein
										<small><a href="#">(23)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" checked />
										<i></i>
										Gucci
										<small><a href="#">(4)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" />
										<i></i>
										Adidas
										<small><a href="#">(11)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" />
										<i></i>
										Puma
										<small><a href="#">(3)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" />
										<i></i>
										Zara
										<small><a href="#">(87)</a></small>
									</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--/end panel group-->
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
								Brands
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
										Calvin Klein
										<small><a href="#">(23)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" checked />
										<i></i>
										Gucci
										<small><a href="#">(4)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" />
										<i></i>
										Adidas
										<small><a href="#">(11)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" />
										<i></i>
										Puma
										<small><a href="#">(3)</a></small>
									</label>
								</li>
								<li>
									<label class="checkbox">
										<input type="checkbox" name="checkbox" />
										<i></i>
										Zara
										<small><a href="#">(87)</a></small>
									</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<button id="resetButton" type="button" class="btn-u btn-brd btn-brd-hover btn-u-lg btn-u-sea-shop btn-block">Reset</button>
		</div>

		<%--grid filter product--%>

		<div class="col-md-9">
			<div class="row margin-bottom-5">
				<div class="col-sm-4 result-category">
					<h2>Men</h2>
					<small class="shop-bg-red badge-results">45 Results</small>
				</div>
				<div class="col-sm-8">
					<ul class="list-inline clear-both">
						<li class="grid-list-icons">
							<a href="shop-ui-filter-list.html"><i class="fa fa-th-list"></i></a>
							<a href="shop-ui-filter-grid.html"><i class="fa fa-th"></i></a>
						</li>
						<li class="sort-list-btn">
							<h3>Sort By :</h3>
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									Popularity <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">All</a></li>
									<li><a href="#">Best Sales</a></li>
									<li><a href="#">Top Last Week Sales</a></li>
									<li><a href="#">New Arrived</a></li>
								</ul>
							</div>
						</li>
						<li class="sort-list-btn">
							<h3>Show :</h3>
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									10 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">All</a></li>
									<li><a href="#">10</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">3</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div><!--/end result category-->

			<div class="filter-results">
				<div class="row illustration-v2 margin-bottom-30">
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
							<div class="shop-rgba-dark-green rgba-banner">New</div>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$60.00</span>
									<span class="title-price line-through">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$60.00</span>
									<span class="title-price line-through">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="row illustration-v2 margin-bottom-30">
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$60.00</span>
									<span class="title-price line-through">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
							<div class="shop-rgba-red rgba-banner">Out of stock</div>
						</div>
						<div class="product-description product-description-brd">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="row illustration-v2">
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
							<div class="shop-rgba-dark-green rgba-banner">New</div>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$60.00</span>
									<span class="title-price line-through">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$60.00</span>
									<span class="title-price line-through">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="product-img product-img-brd">
							<a href="#"><img class="full-width img-responsive" src="/resources/img/shop/05.jpg" alt=""></a>
							<a class="product-review" href="shop-ui-inner.html">Quick review</a>
							<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						</div>
						<div class="product-description product-description-brd margin-bottom-30">
							<div class="overflow-h margin-bottom-5">
								<div class="pull-left">
									<h4 class="title-price"><a href="shop-ui-inner.html">Double-breasted</a></h4>
									<span class="gender text-uppercase">Men</span>
									<span class="gender">Suits - Blazers</span>
								</div>
								<div class="product-price">
									<span class="title-price">$95.00</span>
								</div>
							</div>
							<ul class="list-inline product-ratings">
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating-selected fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li><i class="rating fa fa-star"></i></li>
								<li class="like-icon"><a data-original-title="Add to wishlist" data-toggle="tooltip" data-placement="left" class="tooltips" href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div><!--/end filter resilts-->

			<div class="text-center">
				<ul class="pagination pagination-v2">
					<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
					<li><a href="#">1</a></li>
					<li class="active"><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div><!--/end pagination-->
		</div>

		<%--grid filter product--%>

	</div>
	<!-- End Table Search v1 -->
</div>
<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/resources/js/product/ProductManager.js"></script>
<script src="/resources/js/product/ProductDetail.js"></script>
<script type="text/javascript" src="/resources/js/locales/bootstrap-datepicker.vi.js"  charset="UTF-8"></script>
<script>
    var shipmentManager = new ShipmentManager();

    <c:forEach items="${listProvince}" var="province">
    shipmentManager.initProvince('${province.id}', '${province.name}');
    </c:forEach>

    $(document).ready(function() {
        $('.datepicker').datepicker({
            format : 'dd/mm/yyyy',
            language : 'vi'
        });
        getResource(function(){
            shipmentManager.init();
        });
    });
    function filterType(goodsTypeId, type) {
        shipmentManager.filter(goodsTypeId, type);
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

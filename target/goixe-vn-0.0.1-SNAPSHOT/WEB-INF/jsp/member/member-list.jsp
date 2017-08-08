<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />


<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left">Danh sách thành viên chủ hàng</h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/">Trang chủ</a></li>
			<li class="active"><a href="/member/list-member">Danh sách thành viên chủ hàng</a></li>
		</ul>
	</div>
</div>
	

<!-- tìm kiếm xe tìm hàng -->
<div class="search-block">
	<div class="container">
		<div>
			<div class="row">
					<div class="col-md-4">
						<label>Tên lái xe</label>
						<i class="icon-append fa fa-user"></i><input type="text" class="form-control" id="ownerName">
					</div>
					
					<div class="col-md-4">
						<label>Số điện thoại</label>
						<i class="icon-append fa fa-calendar"></i><input type="text" class="form-control" id="ownerPhoneNumber">
					</div>
					
					<div class="col-md-4">
						<label>Trạng thái</label>
						<i class="icon-append fa fa-globe"></i>
						<select class="form-control" id="ownerStatus">>
							<option value="-1" selected="selected">Tất cả</option>
							<option value="1" >Hiệu lực</option>
							<option value="2">Không hiệu lực</option>
						</select>
					</div>
					
					
				</div>
				<div class="row">
					<div class="col-lg-offset-3 col-lg-2" style="text-align: center">
						<label>&nbsp</label>
						<button id="searchMemberBtn" class="btn rounded btn-primary btn-u-sm form-control" type="button"><i class="fa fa-search"></i>Tìm kiếm</button>
					</div>
					<div class="col-lg-2" style="text-align: center">
						<label>&nbsp</label>
						<button id="clearSearchMemberBtn" class="btn rounded btn-primary btn-u-sm form-control" type="button"><i class="fa fa-search"></i>Nhập lại</button>
					</div>
					<div class="col-lg-2" style="text-align: center">
						<label>&nbsp</label>
						<button id="backSearchMemberBtn" class="btn rounded btn-primary btn-u-sm form-control" type="button"><i class="fa fa-search"></i>Quay lại</button>
					</div>
				</div>
		</div>
	</div>
</div>
<div class="container ">	
	<!-- danh sách xe tìm hàng -->
	<div class="container content-sm">
		<!-- Begin Table Search v1 -->
		<div class="table-search-v1 margin-bottom-30">
			<div class="table-responsive">
				<table class="table table-bordered table-striped" id="memberTable">
					<thead>
						<tr>
							<th class="text-center">STT</th>
							<th class="text-center">Tên lái xe</th>
							<th class="text-center">Số điện thoại</th>
							<th class="text-center">Địa chỉ</th>
							<th class="text-center">Trạng thái</th>
							<th class="text-center">Tài khoản</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- button thành viên chủ hàng/chủ xe -->
	<div class="row">
		<div class="col-sm-6" >
			<a href="/member/list-commodity">
				<button class="btn-u btn-u-blue" style="width: 100%;" type="button">Thành viên chủ hàng</button>
			</a>
		</div>
		<div class="col-sm-6" >
			<a href="#">
				<button class="btn-u btn-u-blue " style="width: 100%;" type="button">Thành viên chủ xe</button>
			</a>
		</div>
	</div>
</div>

<script src="/resources/js/member/MemberManager.js"></script>

<script>
var manager = new MemberManager();
// var truckingDetail = new TruckingDetail();
$(function () {
	manager.init();
});

</script>
		
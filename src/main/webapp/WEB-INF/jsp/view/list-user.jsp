<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!-- Page Breadcrumb -->
<div class="page-breadcrumbs">
	<ul class="breadcrumb">
		<li><i class="fa fa-home"></i> <a href="/homepage">Trang chủ</a>
		</li>
		<li><a href="/list-device">Quản lý mẫu thiết bị</a></li>
		<li class="active">Danh sách</li>
	</ul>
</div>
<!-- /Page Breadcrumb -->
<!-- Page Header -->
<div class="page-header position-relative" style="display: none;">
	<div class="header-title">
		<h1>
			Danh sách <small> <i class="fa fa-angle-right"></i> Các mẫu
				thiết bị đã tạo trên hệ thống
			</small>
		</h1>
	</div>
	<!--Header Buttons-->
	<div class="header-buttons">
		<a class="sidebar-toggler" href="#"> <i class="fa fa-arrows-h"></i>
		</a> <a class="refresh" id="refresh-toggler" href=""> <i
			class="fa fa-refresh"></i>
		</a> <a class="fullscreen" id="fullscreen-toggler" href="#"> <i
			class="fa fa-expand"></i>
		</a>
	</div>
	<!--Header Buttons End-->
</div>
<!-- /Page Header -->
<!-- Page Body -->
<div class="page-body">
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<div class="well with-header with-footer">
				<div class="header bordered-pink">Danh sách người dùng</div>
				<div class="row">
					<a href="javascript:void(0);" id="addUserBtn"
						style="margin-bottom: 10px; margin-left: 15px;"
						class="btn btn-azure pull-left">Thêm mới</a>
				</div>

				<table class="table table-bordered table-striped" id="userTable">
					<thead>
						<tr>
							<th><i class="fa fa-user"></i> Tên đăng nhập</th>
							<th><i class="fa"></i> Quyền</th>
							<th><i class="fa"></i> Ngày tạo</th>
							<th><i class="fa"></i> Lần đăng nhập cuối</th>
							<th class="hidden-xs"><i class="fa fa-status"></i> Trạng
								thái</th>
							<th>#</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/modal/user-modal.jsp"%>

<script src="/resources/js/user/UserManager.js"></script>
<script>
var = new UserManager();
$(function () {
	userManager.init();
});

function editUser(username, role, enabled) {
	var user = userManager.getUserByUserName(username);
	userManager.editUser(user, role, enabled);
}

function deleteUser(username) {
	bootbox.confirm({
		message :"Bạn có chắc chắn muốn xóa?",
		size: "small",
		callback: function (result) {
	        if (result) {
	        	var user = userManager.getUserByUserName(username);
	        	userManager.deleteUser(user);
	        } else {
	        	return;
	        }
	    }
	});
}

</script>
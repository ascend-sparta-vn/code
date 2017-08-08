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
				<h1 class="pull-left">Thay mật khẩu</h1>
				<ul class="pull-right breadcrumb">
					<li><a href="/">Trang chủ</a></li>
					<li class="active">Thay mật khẩu</li>
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
		<h2 class="label-headline">Nhập mật khẩu</h2>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="">Nhập mật khẩu cũ</label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-lock"></i></span>
					  <input maxlength="50" id = "password" name = "password" type="password" class="form-control" placeholder="<spring:message code="password"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="">Nhập mật khẩu mới</label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-lock"></i></span>
					  <input maxlength="50" id = "newPassword" name = "newPassword" type="password" class="form-control" placeholder="<spring:message code="password"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="">Nhập lại mật khẩu mới</label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-lock"></i></span>
					  <input maxlength="50" id = "repassword" name = "repassword" type="password" class="form-control" placeholder="<spring:message code="re.password"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="row">
		<div class="col-sm-12 text-left">
			<div class="form-group"><button id="btn-update-pass" class="btn btn-primary"><spring:message code="accept"/></button></div>
		</div>
	</div>
			</div>
		</div>
		<!-- End Profile Content -->
	</div>
</div>


<script type="text/javascript" src="/resources/js/account/ChangePasswordManager.js"></script>
<script>
	var changePasswordManager = new ChangePasswordManager();
	$(function () {
		$("#profile-menu-2").addClass("active");
		changePasswordManager.init();
	});
</script>


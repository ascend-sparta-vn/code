<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="/resources/css/pages/page_search_inner_tables.css"
	rel="stylesheet" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left">Đăng ký tài khoản</h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/">Trang chủ</a></li>
			<li class="active"><a href="/trucking/list-trucking">Đăng ký
					tài khoản</a></li>
		</ul>
	</div>
</div>

<div class="container message-register">
	Quý khách đã kích hoạt thành công, vui lòng đăng nhập để sử dụng dịch vụ!
</div>
<script>
	
	setInterval(function() {
		window.location.href="/login";
	}, 3000);
</script>



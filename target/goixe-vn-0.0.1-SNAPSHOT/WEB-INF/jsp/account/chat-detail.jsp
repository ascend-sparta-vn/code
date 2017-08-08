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
        <h1 class="pull-left">Cập nhật tài khoản</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="/">Trang chủ</a></li>
            <li class="active">Cập nhật tài khoản</li>
        </ul>
    </div>
</div>


<div class="container content profile">
    <div class="row">
        <%@include file="/WEB-INF/jsp/account/left-profile.jsp"%>

        <!-- Profile Content -->
        <div class="col-md-9">
            Chat detail
        </div>
        <!-- End Profile Content -->
    </div>
</div>




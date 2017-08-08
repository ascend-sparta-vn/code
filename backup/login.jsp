<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8" />
    <title>Admin Site</title>

    <meta name="description" content="data tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="/resources/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/resources/css/weather-icons.min.css" rel="stylesheet" />
    <link href="/resources/js/toastr/toastr.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link id="beyond-link" href="/resources/css/beyond.min.css" rel="stylesheet" />
    <link href="/resources/css/demo.min.css" rel="stylesheet" />
    <link href="/resources/css/typicons.min.css" rel="stylesheet" />
    <link href="/resources/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Page Related styles-->
    <link href="/resources/css/dataTables.bootstrap.css" rel="stylesheet" />
	
	
	
	<link href="/resources/css/custom.css" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="/resources/js/skins.min.js"></script>
    <!--Basic Scripts-->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="/resources/js/beyond.js"></script>

    <!--Page Related Scripts-->
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/Constants.js"></script>
	<script src="/resources/js/toastr/toastr.js"></script>
	<script src="/resources/js/bootbox/bootbox.js"></script>
</head>
    
 <form method="POST" action="${pageContext.request.contextPath}/j_spring_security_check">
<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
<div class="login-container animated fadeInDown">
        <div class="loginbox bg-white">
            <div class="loginbox-title">ĐĂNG NHẬP</div>
            <div class="loginbox-social">
                <div class="social-title ">Hệ thống quản lý thiết bị</div>
            </div>
            <div class="loginbox-or">
                <div class="or-line"></div>
            </div>
            <div class="loginbox-textbox">
                <input type="text" name="userName" class="form-control" placeholder="username" required>
            </div>
            <div class="loginbox-textbox">
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="loginbox-textbox">
                <!-- <input type="checkbox" name="remember-me" /> -->
            </div>
            <div class="loginbox-submit">
                <input type="submit" class="btn btn-primary btn-block" value="Đăng nhập">
            </div>
        </div>
        <c:if test="${param.error == 'true'}">
		        <div class="loginbox-submit alert alert-warning fade in" style="margin-top:10px;">
		             <button class="close" data-dismiss="alert">
		                 ×
		             </button>
		             <i class="fa-fw fa fa-warning"></i>
		              Sai tên đăng nhập hoặc mật khẩu
		         </div>
	  	</c:if>
        
    </div>
</form>

<span class="error-message">${error }</span>
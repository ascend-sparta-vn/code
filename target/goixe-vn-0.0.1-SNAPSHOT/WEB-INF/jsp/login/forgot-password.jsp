<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="/resources/css/pages/page_search_inner_tables.css"
	rel="stylesheet" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left">Quên mật khẩu</h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class="active">Quên mật khẩu</li>
		</ul>
	</div>
</div>
<div class="container content-sm">
	<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
					
					<form action="forgotPass" method="post" id="forgotForm" class="reg-page">
						<div class="reg-header">
							<h2>Yêu cầu cấp lại mật khẩu</h2>
						</div>

						<div class="input-group margin-bottom-20">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input name='email' type='text' placeholder='<spring:message code="email"/>' class='form-control'>
						</div>
						
<!-- 						<div class="input-group margin-bottom-20"> -->
<!-- 							 reCAPTCHA -->
<!-- 						      <div class="g-recaptcha" -->
<!-- 						          data-sitekey="6Ldv6AsUAAAAAKjJ_3XCBSwJorDE8GMPM_FMDLsD"></div> -->
<!-- 						</div> -->
						
						<div class="row margin-bottom-20">
							<div class="col-sm-12">
								<label><spring:message code="capcha.label"/></label>
								<input type="text" id="defaultReal" name="defaultReal" class="form-control" placeholder="<spring:message code="capcha.placeholder"/>">
							</div>
						</div>

						<div class="row">
							<div class="col-md-8 text-left">
								<button class="btn-u btn-login" type="submit">Thực hiện</button>
							</div>
						</div>
						
						<c:if test="${not empty result}">
							<c:if test="${result == 'error'}">
								<div class="row text-center alert alert-warning fade in" style="margin-top:20px; margin-bottom:0px;">
									${resultMessage}
								</div>
							</c:if>
							
							<c:if test="${result == 'success'}">
								<div class="row text-center alert alert-info fade in" style="margin-top:20px; margin-bottom:0px;">
									${resultMessage}
								</div>
							</c:if>
						</c:if>
						
					</form>
				</div>
			</div>
</div>

<!-- <script type="text/javascript" src="/resources/js/account/ResetPasswordManager.js"></script> -->
<script>
	//var resetPassword = new ResetPasswordManager();
	$(function () {
		$('#defaultReal').realperson();
		//resetPassword.init();
	});
</script>

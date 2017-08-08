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
		<h1 class="pull-left"><spring:message code="sign.in"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class="active"><spring:message code="sign.in"/></li>
		</ul>
	</div>
</div>
<div class="container content-sm">
	<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
					<form class="reg-page" method="POST" action="${pageContext.request.contextPath}/j_spring_security_check" id = "login-form">
						<div class="reg-header">
							<h2><spring:message code="sign.in"/></h2>
						</div>

						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input name='userName' type='text' placeholder='<spring:message code="email"/>' class='form-control'>
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input name="password" type="password" placeholder='<spring:message code="password"/>' class="form-control">
						</div>

						<div class="row">
							<div class="col-md-12 text-center">
								<button class="btn-u btn-login" type="submit"><spring:message code="login"/></button>
							</div>
						</div>
						<c:if test="${param.error == 'true'}">
							<div class="row">
								<div class="col-sm-12 text-center alert alert-danger fade in" style="margin-top:20px; margin-bottom:0px;">
									<c:set var="salary" scope="session" value="${2000*2}"/>
									<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
										<spring:message code="username.invalid"/>
									</c:if>
								</div>
							</div>
						</c:if>
						
						<c:if test="${not empty msg}">
							<div class="row">
								<div class="col-sm-12 text-center alert alert-info fade in" style="margin-top:20px; margin-bottom:0px;">
									{msg}
								</div>
							</div>
						</c:if>
						<hr>

						<h4><b><spring:message code="forgot.password"/></b></h4>
						<p><spring:message code="no.worries"/>, <a class="color-green" href="/account/forgot-password"><spring:message code="click.here"/></a> <spring:message code="to.reset.pass"/>.</p>
					</form>
					
				</div>
			</div>
</div>

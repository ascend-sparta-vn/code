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
		<h1 class="pull-left"><spring:message code="reset.pass.header"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class="active"><spring:message code="reset.pass.header"/></li>
		</ul>
	</div>
</div>

<div class="container message-register" style="background-color: white;">
	<c:if test="${not empty result}">
							<c:if test="${result == 'error'}">
								<div class="row alert alert-warning fade in" style="margin-top:20px; margin-bottom:0px;">
									${resultMessage}
								</div>
							</c:if>
							
							<c:if test="${result == 'success'}">
								<div class="row alert alert-info fade in" style="margin-top:20px; margin-bottom:0px;">
									${resultMessage}
								</div>
							</c:if>
	</c:if>
</div>



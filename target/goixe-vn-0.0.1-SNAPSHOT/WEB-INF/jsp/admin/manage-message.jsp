<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!-- CSS Page Style -->
<link rel="stylesheet" href="/resources/css/pages/profile.css">
<div class="breadcrumbs">
			<div class="container">
				<h1 class="pull-left"><spring:message code="manageMessage.header"/></h1>
				<ul class="pull-right breadcrumb">
					<li><a href="/"><spring:message code="homepage"/></a></li>
					<li><a href="/account/account-profile"><spring:message code="homepage.account"/></a></li>
					<li class="active">
						<spring:message code="manageMessage.header"/>
					</li>
				</ul>
			</div>
		</div>
		
<div class="container content profile">
	<div class="row">
		<!-- left menu account profile -->
		<%@include file="/WEB-INF/jsp/account/left-profile.jsp" %>
		
		<!-- add new post trucking -->
		<div class="col-md-9" id="post-trucking-new">
			<div class="sky-form">
				<header><spring:message code="manageMessage.header"/>
				</header>
						
				<div class="container content-sm col-lg-12">
				<!-- Begin Table Search v1 -->
						<table style="width:100%;" class="table table-striped table-bordered dt-responsive" id="messageTable">
							<thead>
								<tr>
									<th class="text-center"><spring:message code="manageMessage.nameCol"/></th>
									<th class="text-center"><spring:message code="manageMessage.emailCol"/></th>
									<th class="text-center"><spring:message code="manageMessage.createdDateCol"/></th>
									<th class="text-center"><spring:message code="manageMessage.messageCol"/></th>
									<th class="nowrap">#</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
				<!-- End Table Search v1 -->
			</div>
				
		
			</div>
		</div>

	</div>
</div>

<script src="/resources/js/admin/MessageManager.js"></script>
<script>
var messageManager = new MessageManager();
$(function () {
	getResource(function(){
		$("#profile-menu-10").addClass("active");
		messageManager.init();
	});
});


function deleteMessage(messageId) {
	messageManager.deleteMessage(messageId);
}

</script>

<style>
span.label{
    display: initial !important;
    color: white !important;
    font-size:11px !important;
}
</style>

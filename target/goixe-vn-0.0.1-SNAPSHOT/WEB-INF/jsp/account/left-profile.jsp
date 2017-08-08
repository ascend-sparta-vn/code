<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- CSS Implementing Plugins -->
	<link rel="stylesheet" href="/resources/plugins/animate.css">
	<link rel="stylesheet" href="/resources/plugins/line-icons/line-icons.css">
	<link rel="stylesheet" href="/resources/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
	<link rel="stylesheet" href="/resources/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
	<link rel="stylesheet" href="/resources/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
<!--Left Sidebar-->
				<div class="col-md-3 md-margin-bottom-40">
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<img class="img-responsive profile-img margin-bottom-20" src="/resources/img/1482078659_Admin.png" alt="">
				</sec:authorize>
				
				<sec:authorize access="hasRole('ROLE_CLIENT')">
					<img class="img-responsive profile-img margin-bottom-20" src="/resources/img/users-9-2-128.png" alt="">
				</sec:authorize>
				
					

					<ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
						
						<li class="list-group-item" id = 'profile-menu-1'>
							<a href="/account/account-profile"><i class="fa fa-user"></i> <spring:message code="leftmenu.profile"/></a>
						</li>
						
						<li class="list-group-item" id = 'profile-menu-2'>
							<a href="/account/change-password"><i class="fa fa-lock"></i> <spring:message code="leftmenu.changePassword"/></a>
						</li>
						
						<li class="list-group-item" id = 'profile-menu-3'>
							<a href="/trucking/post"><i class="fa fa-pencil-square-o"></i> <spring:message code="leftmenu.postTrucking"/></a>
						</li>
						<li class="list-group-item" id = 'profile-menu-4'>
							<a href="/shipment/post"><i class="fa fa-pencil-square-o"></i> <spring:message code="leftmenu.postShipment"/></a>
						</li>
						<li class="list-group-item" id = 'profile-menu-5'>
							<a href="/trucking/manage-trucking"><i class="fa fa-truck"></i> <spring:message code="leftmenu.manageTrucking"/></a>
						</li>
						<li class="list-group-item" id = 'profile-menu-6'>
							<a href="/shipment/manage-goods"><i class="fa fa-cubes"></i><spring:message code="leftmenu.manageShipment"/></a>
						</li>
						<li class="list-group-item" id = 'profile-menu-7'>
							<a href="/order/trucking/"><i class="fa fa-phone"></i> <spring:message code="leftmenu.truckingRequest"/></a>
						</li>
						<li class="list-group-item" id = 'profile-menu-8'>
							<a href="/order/shipment/"><i class="fa fa-phone"></i> <spring:message code="leftmenu.shipmentRequest"/></a>
						</li>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="list-group-item" id = 'profile-menu-9'>
								<a href="/admin/manage-user"><i class="fa fa-users"></i> <spring:message code="leftmenu.manageUser"/></a>
							</li>
						</sec:authorize>
						
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="list-group-item" id = 'profile-menu-10'>
								<a href="/admin/manage-message"><i class="fa fa-comment"></i> <spring:message code="leftmenu.manageMessage"/></a>
							</li>
						</sec:authorize>
						
						
						<li class="list-group-item">
							<a href="/logout"><i class="fa fa-sign-out"></i> <spring:message code="homepage.logout"/></a>
						</li>
					</ul>

					<hr>
					<!--Datepicker-->
					<form action="#" id="sky-form2" class="sky-form">
						<div id="inline-start"></div>
					</form>
					<!--End Datepicker-->
				</div>
				<!--End Left Sidebar-->
				
<script type="text/javascript" src="/resources/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/plugins/datepicker.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function() {
			Datepicker.initDatepicker();
		});
</script>
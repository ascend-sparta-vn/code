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

<input type="hidden" id="viewMode" value="${viewMode}" />

<div class="container content profile">
	<div class="row">
		<%@include file="/WEB-INF/jsp/account/left-profile.jsp"%>

		<!-- Profile Content -->
		<div class="col-md-9">
			<div class="tag-box tag-box-v3 form-page">
	<div class="headline">
		<h2 class="label-headline"><spring:message code="general.information"/></h2>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
			<label for="member_type" class="p-label-required"><spring:message code="email"/></label>
				<div class="input-group ">
				  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-envelope-o"></i></span>
				  <input id="email" maxlength="50" readonly="readonly" value="${account.username}" name = "email" type="text" class="form-control" placeholder="<spring:message code="email"/>" aria-describedby="sizing-addon1">
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="title"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
					  <select name = "memberSex" class="form-control" id="memberSex">
					  	<c:choose>
							<c:when test="${accountDetail.gender == 1}">
								<option selected="selected" value="1"><spring:message code="mr"/></option>
					  			<option value="2"><spring:message code="mrs"/></option>
							</c:when>
							<c:otherwise>
								<option  value="1"><spring:message code="mr"/></option>
					  			<option selected="selected" value="2"><spring:message code="mrs"/></option>
							</c:otherwise>
						</c:choose>
					  </select>
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="first.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
					  <input maxlength="50" id="last-name" value="${accountDetail.lastName}" name="firstname" type="text" class="form-control" placeholder="<spring:message code="first.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="last.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
					  <input maxlength="50" id="firstname" value = "${accountDetail.firstName}" name="lastName" type="text" class="form-control" placeholder="<spring:message code="last.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="tel"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-phone"></i></span>
					  <input maxlength="50" value="${accountDetail.phoneNumber}" id = "mobile-number" name="mobileNumber" type="text" class="form-control" placeholder="<spring:message code="tel"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="address"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
					  <input maxlength="50" value="${accountDetail.address}" name="address" id = "address" type="text" class="form-control" placeholder="<spring:message code="address"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="province"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user-secret"></i></span>
					  <select id = "province" name = "province" class="form-control">
					  	<option value="-1"></option>
					  	<c:forEach items="${provinces}" var="province">
					  		<c:choose>
					  			<c:when test="${accountDetail.provinceId == province.id}">
					  				<option selected="selected" value="${province.id}">${province.name}</option>
					  			</c:when>
					  			<c:otherwise>
					  				<option value="${province.id}">${province.name}</option>
					  			</c:otherwise> 
					  		</c:choose>
					  		
					  		
						</c:forEach>	
					  </select>
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="kind.of.goods.trading"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
					  <select id="goodType" class="form-control">
					  	<c:choose>
					  			<c:when test="${accountDetail.goodsTrading == '1'}">
					  				<option selected="selected" value="1">Loại hàng hóa sản xuất</option>
									<option value="0">Loại hàng hóa thương mại</option>
					  			</c:when>
					  			<c:otherwise>
					  				<option value="1">Loại hàng hóa sản xuất</option>
									<option  selected="selected" value="0">Loại hàng hóa thương mại</option>
					  			</c:otherwise>
					  		</c:choose>
					  </select>
					
					</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="transport.requirement.monthly"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-truck"></i></span>
					  <input maxlength="50" id="weighPerMonth" value="${accountDetail.transportRequirementMonthly}" type="number" name="weighPerMonth" class="form-control" placeholder="<spring:message code="transport.requirement.monthly.placeholder"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="competence.intro"/></label>
				<textarea name="description" id="description" class="form-control" rows="5">${accountDetail.competenceIntro}</textarea>
			</div>
		</div>
	</div>
	
	<div class="headline">
		<h2 class = "label-headline"><spring:message code="if.enterprise"/></h2>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="company.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" value="${accountDetail.companyName}" name="companyName" id = "company-name" type="text" class="form-control" placeholder="<spring:message code="company.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="company.address"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-building-o"></i></span>
					  <input maxlength="50" value="${accountDetail.companyAdress}" id = "company-address" name = "companyAddress" type="text" class="form-control" placeholder="<spring:message code="company.address"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="year.establisment"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="start-year" value="${accountDetail.companyStartYear}" name="startYear" type="text" class="form-control" placeholder="<spring:message code="year.establisment"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="number.of.employee"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="total-employee" value="${accountDetail.companyEmployeeTotal}" name="totalEmployee" type="text" class="form-control" placeholder="<spring:message code="number.of.employee"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="ISO.obtain"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <select id="company-iso" name="companyIso" name="member_type" class="form-control">
					  		<c:choose>
					  			<c:when test="${accountDetail.companyIso == 1}">
					  				<option selected="selected" value="1">Có</option>
									<option value="0">Không</option>
					  			</c:when>
					  			<c:otherwise>
					  				<option value="1">Có</option>
									<option  selected="selected" value="0">Không</option>
					  			</c:otherwise>
					  		</c:choose>
						</select>
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="status"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="company-role" value="${accountDetail.companyRole}" name="companyRole" type="text" class="form-control" placeholder="<spring:message code="status"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="director"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="director-name" value="${accountDetail.companyDirectorName}"  name="directorName" type="text" class="form-control" placeholder="<spring:message code="director"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="vat"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="tax-code" value="${accountDetail.companyTaxCode}" name="taxCode" type="text" class="form-control" placeholder="<spring:message code="vat"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="tel"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-phone"></i></span>
					  <input maxlength="50" id="company-phone-number" value="${accountDetail.companyPhoneNumber}" name="companyPhoneNumber" type="text" class="form-control" placeholder="<spring:message code="tel"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="fax"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-fax"></i></span>
					  <input maxlength="50" id="company-fax" value="${accountDetail.companyFax}" name="companyFax" type="text" class="form-control" placeholder="<spring:message code="fax"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="business.registration.no"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="paper-number" value="${accountDetail.companyBussinessLicense}" name="paperNumber" type="text" class="form-control" placeholder="<spring:message code="business.registration.no"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="headline">
		<h2 class = "label-headline"><spring:message code="payment.info"/></h2>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="bank.account.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="account-bank-name" value="${accountDetail.accountBankName}" name="accountBankName" type="text" class="form-control" placeholder="<spring:message code="bank.account.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="account.number"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="account-bank-number" value="${accountDetail.accountBankNumber}" name="accountBankNumber" type="text" class="form-control" placeholder="<spring:message code="account.number"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="bank.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" id="banking-name" value="${accountDetail.bankName}" name="bankingName" type="text" class="form-control" placeholder="<spring:message code="bank.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-sm-12 text-left">
			<div class="form-group"><button id="btn-update-account" class="btn btn-primary"><spring:message code="accept"/></button></div>
		</div>
	</div>
			</div>
		</div>
		<!-- End Profile Content -->
	</div>
</div>

<!-- Modal -->
<div id="error-dialog" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <b id = "error-content">Some text in the modal.</b>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<script type="text/javascript" src="/resources/js/account/AccountManager.js"></script>
<script>
	var accountManager = new AccountManager();
	$(function () {
		accountManager.init();
	});
</script>


<style>
select:not([multiple]) {
    -webkit-appearance: none;
    -moz-appearance: none;
    background-position: right 50%;
    background-repeat: no-repeat;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAMCAYAAABSgIzaAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDZFNDEwNjlGNzFEMTFFMkJEQ0VDRTM1N0RCMzMyMkIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDZFNDEwNkFGNzFEMTFFMkJEQ0VDRTM1N0RCMzMyMkIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0NkU0MTA2N0Y3MUQxMUUyQkRDRUNFMzU3REIzMzIyQiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0NkU0MTA2OEY3MUQxMUUyQkRDRUNFMzU3REIzMzIyQiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PuGsgwQAAAA5SURBVHjaYvz//z8DOYCJgUxAf42MQIzTk0D/M+KzkRGPoQSdykiKJrBGpOhgJFYTWNEIiEeAAAMAzNENEOH+do8AAAAASUVORK5CYII=);
    padding: .5em;
    padding-right: 1.5em
}
</style>

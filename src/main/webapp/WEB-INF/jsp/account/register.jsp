<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="/resources/css/pages/page_search_inner_tables.css"
	rel="stylesheet" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="breadcrumbs ">
	<div class="container">
		<h1 class="pull-left"><spring:message code="registration"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class="active"><a href="/trucking/list-trucking"><spring:message code="registration"/></a></li>
		</ul>
	</div>
</div>
<!-- Hidden message -->
<input type=hidden id="message-email" value="<spring:message code="email.error" text="default text" />">
<input type=hidden id="message-password" value="<spring:message code="password.error" text="default text" />">
<input type=hidden id="message-repassword" value="<spring:message code="repassword.error" text="default text" />">
<input type=hidden id="message-correctpassword" value="<spring:message code="password.notsame.error" text="default text" />">
<input type=hidden id="message-name" value="<spring:message code="name.error" text="default text" />">
<input type=hidden id="message-tel" value="<spring:message code="phonenumber.error" text="default text" />">
<input type=hidden id="message-address" value="<spring:message code="address.error" text="default text" />">
<input type=hidden id="message-capcha" value="<spring:message code="capcha.error" text="default text" />">
<input type=hidden id="account-exists" value="<spring:message code="account.exists" text="default text" />">
<input type=hidden id="account-agree" value="<spring:message code="account.agree" text="default text" />">
<!-- /Hidden message -->
<div class="container content-sm">
	<form name="registration" method="POST" action="register" id = "register-form">
	<div class="headline">
		<h2 class="label-headline"><spring:message code="general.information"/></h2>
	</div>
	<div class="row" style="display:none;">
		<div class="col-sm-6">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="register.under"/></label>
					<div class="input-group ">
						<span class="input-group-addon" id="basic-addon1"><i class="fa fa-user-secret"></i></span> 
						<select id="member_type" name="memberType" class="form-control">
							<option value="1" selected="selected"><spring:message code="Shipment.owner"/></option>
							<option value="2"><spring:message code="Vehicle.owner"/></option>
						</select>
					</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="email"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-envelope-o"></i></span>
					  <input id="email" maxlength="50" name = "email" type="text" class="form-control" placeholder="<spring:message code="email"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="password"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-lock"></i></span>
					  <input maxlength="50" id = "password" name = "password" type="password" class="form-control" placeholder="<spring:message code="password"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="re.password"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-lock"></i></span>
					  <input maxlength="50" id = "repassword" name = "repassword" type="password" class="form-control" placeholder="<spring:message code="re.password"/>" aria-describedby="sizing-addon1">
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
					  <select name = "memberSex" class="form-control">
					  	<option value="1"><spring:message code="mr"/></option>
					  	<option value="2"><spring:message code="mrs"/></option>
					  </select>
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="first.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
					  <input maxlength="50" name="firstname" type="text" class="form-control" placeholder="<spring:message code="first.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="last.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user"></i></span>
					  <input maxlength="50" id="last-name" name="lastName" type="text" class="form-control" placeholder="<spring:message code="last.name"/>" aria-describedby="sizing-addon1">
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
					  <input maxlength="50" id = "mobile-number" name="mobileNumber" type="text" class="form-control" placeholder="<spring:message code="tel"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="address"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-map-marker"></i></span>
					  <input maxlength="50" name="address" id = "address" type="text" class="form-control" placeholder="<spring:message code="address"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class="p-label-required"><spring:message code="province"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-user-secret"></i></span>
					  <select id = "province" name = "province" class="form-control">
					  	<option value="-1"><spring:message code="province.choose"/></option>
					  	<c:forEach items="${provinces}" var="province"> 
					  		<option value="${province.id}">${province.name}</option>
						</c:forEach>	
					  </select>
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="kind.of.goods.trading"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-cubes"></i></span>
<%-- 					  <input maxlength="50" type="text" name="goodType" class="form-control" placeholder="<spring:message code="kind.of.goods.trading"/>" aria-describedby="sizing-addon1"> --%>
					
					<select id = "province" name = "goodType" class="form-control">
						<option value="1" selected="selected">Loại hàng hóa sản xuất</option>
						<option value="0">Loại hàng hóa thương mại</option>
					</select>
						
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="transport.requirement.monthly"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-truck"></i></span>
					  <input maxlength="50" type="number" name="weighPerMonth" class="form-control" placeholder="<spring:message code="transport.requirement.monthly.placeholder"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="competence.intro"/></label>
				<textarea name="competenceIntro" class="form-control" rows="5"></textarea>
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
					  <input maxlength="50" name="companyName" id = "company-name" type="text" class="form-control" placeholder="<spring:message code="company.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="company.address"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-marker"></i></span>
					  <input maxlength="50" id = "company-address" name = "companyAddress" type="text" class="form-control" placeholder="<spring:message code="company.address"/>" aria-describedby="sizing-addon1">
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
					  <input maxlength="10" name="startYear" type="text" class="form-control" placeholder="<spring:message code="year.establisment"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="number.of.employee"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="10" name="totalEmployee" type="text" class="form-control" placeholder="<spring:message code="number.of.employee"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="ISO.obtain"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <select name="companyIso" name="member_type" class="form-control">
							<option value="1">Có</option>
							<option value="0">Không</option>
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
					  <input maxlength="50" name="companyRole" type="text" class="form-control" placeholder="<spring:message code="status"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="director"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" name="directorName" type="text" class="form-control" placeholder="<spring:message code="director"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="vat"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" name="taxCode" type="text" class="form-control" placeholder="<spring:message code="vat"/>" aria-describedby="sizing-addon1">
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
					  <input maxlength="50" name="companyPhoneNumber" type="text" class="form-control" placeholder="<spring:message code="tel"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="fax"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-fax"></i></span>
					  <input maxlength="50" name="companyFax" type="text" class="form-control" placeholder="<spring:message code="fax"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="business.registration.no"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" name="paperNumber" type="text" class="form-control" placeholder="<spring:message code="business.registration.no"/>" aria-describedby="sizing-addon1">
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
					  <input maxlength="50" name="accountBankName" type="text" class="form-control" placeholder="<spring:message code="bank.account.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="account.number"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" name="accountBankNumber" type="text" class="form-control" placeholder="<spring:message code="account.number"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="member_type" class=""><spring:message code="bank.name"/></label>
					<div class="input-group ">
					  <span class="input-group-addon" id="sizing-addon1"><i class="fa fa-edit"></i></span>
					  <input maxlength="50" name="bankingName" type="text" class="form-control" placeholder="<spring:message code="bank.name"/>" aria-describedby="sizing-addon1">
					</div>
			</div>
		</div>
	</div>
	
	<div class="headline">
		<h2 class = "label-headline"><spring:message code="vinatrucking.regulation"/></h2>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div style="max-height: 189px;overflow-y: scroll;border: 1px dashed #CCC;padding: 9px"><p align="center" style="text-align:center;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">&nbsp;</p><p align="center" style="text-align:center;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><strong><span style="color:blue;"><span style="font-family:arial,sans-serif;"><span style="font-size:15.0pt;">QUY CHẾ HOẠT ĐỘNG SÀN GIAO DỊCH VẬN TẢI GOIXE.VN</span></span></span></strong></p><p align="center" style="text-align:center;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><strong><span style="color:blue;"><span style="font-family:arial,sans-serif;"><span style="font-size:15.0pt;">( Goixe.vn - goixe.online )</span></span></span></strong></p><p align="center" style="text-align:center;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">&nbsp;</p><p align="center" style="text-align:center;vertical-align:baseline;"><strong><em><span style="color:red;"><span style="font-family:arial,sans-serif;"><span style="font-size:13.0pt;">V2.3&nbsp; - Áp dụng từ ngày 01 tháng 01 năm 2017</span></span></span></em></strong></p><p align="center" style="text-align:center;vertical-align:baseline;">&nbsp;</p><p align="left" style="vertical-align:baseline;">&nbsp;</p><p align="left" style="vertical-align:baseline;"><strong><span style="font-family:arial,sans-serif;"><span style="font-size:13pt;">I.&nbsp;&nbsp; &nbsp;GIỚI THIỆU VỀ SÀN GIAO DỊCH VẬN TẢI GOIXE.VN</span></span></strong><br><br><span style="font-family:arial,sans-serif;"><span style="font-size:13pt;">Sàn giao dịch vận tải <strong>goixe.vn</strong> có tên miền <strong>goixe.vn</strong> là Website trực tuyến <strong>môi giới - kết nối &nbsp;và hỗ trợ &nbsp;thực hiện giao dịch </strong>giữa đơn vị vận tải (chủ xe vận chuyển hàng hóa) với nhau &nbsp;và với các đơn vị chủ hàng (có hàng hóa cần vận chuyển).<br><br>Sàn giao dịch vận tải <strong>Goixe</strong> hay <strong>goixe.vn </strong>do <strong>Công ty Cổ phần Sàn giao dịch Vận tải GoixeVN</strong> điều hành và khai thác </div>
		</div>
	</div>
	<br/>
	<div class="row">
		<div class="col-sm-12">
		        <label>
		          <input id="check-agree" type="checkbox"> <spring:message code="agree.register"/>
		        </label>
		</div>
	</div>
<!-- 	<div class="row"> -->
<!-- 		<div class="col-sm-12"> -->
<!-- 			 reCAPTCHA -->
<!-- 		      <div class="g-recaptcha" -->
<%-- 		          data-sitekey="${site_key}"></div> --%>
<!-- 		</div> -->
<!-- 	</div> -->

	<br/>
	<div class="row">
		<div class="col-sm-4">
			<label><spring:message code="capcha.label"/></label>
			<input type="text" id="defaultReal" name="defaultReal" class="form-control" placeholder="<spring:message code="capcha.placeholder"/>">
		</div>
	</div>
	
	</form>
	<div class="row">
		<div class="col-sm-12 text-center">
			<div class="form-group"><button id="btn-register" class="btn btn-primary"><spring:message code="accept"/></button>
			&nbsp;<button id="btn-reenter" type="reset" class="btn btn-primary"><spring:message code="reenter"/></button> 
			<button id="btn-comeback" type="button" data-class="js-ctrl-go-back" class="btn btn-primary" value="Quay lại">
			<spring:message code="go.bank"/>
			</button>&nbsp;</div>
		</div>
	</div>
</div>

<input type="hidden" value="${result}" id="result"/>
<input type="hidden" value="${resultMessage}" id="resultMessage"/>
			
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
		$('#defaultReal').realperson();
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

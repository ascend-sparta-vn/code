<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="resources/css/pages/page_contact.css">
<link rel="stylesheet" href="resources/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="resources/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

<!--=== Breadcrumbs ===-->
		<div class="breadcrumbs">
			<div class="container">
				<h1 class="pull-left"><spring:message code="contactUs.header"/></h1>
				<ul class="pull-right breadcrumb">
					<li><a href="index.html"><spring:message code="contactUs.homepage"/></a></li>
					<li class="active"><spring:message code="contactUs.header"/></li>
				</ul>
			</div>
		</div><!--/breadcrumbs-->
		<!--=== End Breadcrumbs ===-->

		<!--=== Content Part ===-->
		<div class="container content">
			<!-- Map lộ trình dự kiến -->
			<div class="row" style="margin-left: 0px; margin-right: 0px">
				
			</div>
			<div class="row margin-bottom-30">
				<div class="col-md-9 mb-margin-bottom-30">
					<div class="tab-v1">
						<div class="tab-content">
							<div class="tab-pane fade active in" id="home">
								<div id="map" class="map google-maps"></div>
							</div>
						</div>
					</div>
					<br>
					<form action="sendMessage" method="post" id="sky-form3" class="sky-form contact-style">
						<fieldset class="no-padding">
							<label><spring:message code="contactUs.name"/> <span class="color-red">*</span></label>
							<div class="row sky-space-20">
								<div class="col-md-7 col-md-offset-0">
									<div>
										<input type="text" name="name" id="name" class="form-control">
									</div>
								</div>
							</div>

							<label><spring:message code="contactUs.email"/> <span class="color-red">*</span></label>
							<div class="row sky-space-20">
								<div class="col-md-7 col-md-offset-0">
									<div>
										<input type="text" name="email" id="email" class="form-control">
									</div>
								</div>
							</div>

							<label><spring:message code="contactUs.message"/> <span class="color-red">*</span></label>
							<div class="row sky-space-20">
								<div class="col-md-11 col-md-offset-0">
									<div>
										<textarea rows="8" name="message" id="message" class="form-control"></textarea>
									</div>
								</div>
							</div>

							<p><button id="sendMessageBtn" type="submit" class="btn-u"><spring:message code="contactUs.sendMessage"/></button></p>
						</fieldset>


			<input type="hidden" value="${result}" id="sendResult"/>
			<input type="hidden" value="${resultMessage}" id="sendResultMessage"/>
						<div class="message">
							<i class="rounded-x fa fa-check"></i>
							<p><spring:message code="contactUs.resultMessage"/></p>
						</div>
					</form>
				</div><!--/col-md-9-->

				<div class="col-md-3">
					<!-- Contacts -->
					<div class="headline"><h2><spring:message code="contactUs.Address"/></h2></div>
					<ul class="list-unstyled who margin-bottom-30">
						<li><a href="#"><i class="fa fa-home"></i>25B, Thanh Xuân Bắc, Hà Nội</a></li>
						<li><a href="#"><i class="fa fa-envelope"></i>info@goixe.vn</a></li>
						<li><a href="#"><i class="fa fa-phone"></i>043.1233456 </a></li>
						<li><a href="#"><i class="fa fa-globe"></i>http://goixe.vn</a></li>
					</ul>

					<!-- Business Hours -->
					<div class="headline"><h2><spring:message code="contactUs.bussinessHour"/></h2></div>
					<ul class="list-unstyled margin-bottom-30">
						<li><strong><spring:message code="contactUs.weekDay"/></strong> : <spring:message code="contactUs.bussinessHourDetail"/></li>
						<li><strong><spring:message code="contactUs.staturday"/></strong> : <spring:message code="contactUs.staturdayDetail"/></li>
						<li><strong><spring:message code="contactUs.sunday"/></strong> : <spring:message code="contactUs.sundayDetail"/></li>
					</ul>

					<!-- Why we are? -->
					<div class="headline"><h2><spring:message code="contactUs.whyWeAre"/></h2></div>
					<p><spring:message code="contactUs.reasonHeader"/></p>
					<ul class="list-unstyled">
						<li><i class="fa fa-check color-green"></i> <spring:message code="contactUs.reason1"/></li>
						<li><i class="fa fa-check color-green"></i> <spring:message code="contactUs.reason2"/></li>
						<li><i class="fa fa-check color-green"></i> <spring:message code="contactUs.reason3"/></li>
					</ul>
				</div><!--/col-md-3-->
			</div><!--/row-->

			<!-- Owl Clients v1 -->
			<div class="headline"><h2><spring:message code="contactUs.ourClient"/></h2></div>
			<div class="owl-clients-v1">
				<div class="item">
					<img src="resources/img/clients4/1.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/2.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/3.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/4.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/5.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/6.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/7.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/8.png" alt="">
				</div>
				<div class="item">
					<img src="resources/img/clients4/9.png" alt="">
				</div>
			</div>
			<!-- End Owl Clients v1 -->
		</div><!--/container-->
		<!--=== End Content Part ===-->
		
<script src="https://maps.googleapis.com/maps/api/js?libraries=geometry,drawing,weather,visualization&sensor=false&v=3.exp&key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY"></script>
<script type="text/javascript" src="/resources/plugins/sky-forms-pro/skyforms/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<script src="/resources/js/about/ContactUs.js"></script>
<script src="/resources/js/forms/contact.js"></script>
<script>
var contactUs = new ContactUs();
$(function () {
	getResource(function(){
		contactUs.init();
		ContactForm.initContactForm();
	});
});

</script>
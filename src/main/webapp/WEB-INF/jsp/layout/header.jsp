<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="header header-sticky">
			<div class="container">
				<!-- Logo -->
				<a class="logo" href="/">
<!-- 					<img src="/resources/img/logo1-blue.png" alt="Logo"> -->
					<img src="/resources/img/logoOnmart.jpg" height="50px" width="90px" alt="Logo">
				</a>
				<!-- End Logo -->

				<!-- Topbar -->
				<div class="topbar">
					<ul class="loginbar pull-right">
						<li class="hoverSelector">
							<i class="fa fa-globe"></i>
							<a><spring:message code="homepage.language"/></a>
							<ul class="languages hoverSelectorBlock">
								<c:choose>
									<c:when test="${language == '2'}">
										<li >
											<a href="/change-language?lang=vi">Tiếng Việt </a>
										</li>
										<li class="active"><a href="/change-language?lang=en">English <i class="fa fa-check"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="active">
											<a href="/change-language?lang=vi">Tiếng Việt <i class="fa fa-check"></i></a>
										</li>
										<li><a href="/change-language?lang=en">English</a></li>
									</c:otherwise>
								</c:choose>
								
								
							</ul>
						</li>
<!-- 						<li class="topbar-devider"></li> -->
<!-- 						<li><a href="page_faq.html">Trợ giúp</a></li> -->
						<li class="topbar-devider"></li>
						
						<sec:authorize access="hasAnyRole('ADMIN', 'CUSTOMER', 'PROVIDER', 'TRANSPORTER')">
							<li class="">
							<a >
								<sec:authentication property="principal.username" />
							</a>
							<ul class="languages hoverSelectorBlock">
								<li><a href="/logout"><spring:message code="homepage.logout"/></a></li>
								<li><a href="/account/account-profile"><spring:message code="homepage.account"/></a></li>

							</ul>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ADMIN', 'CUSTOMER')">
							<li><a href="/product/checkout"> | <i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart</a></li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li><a href="/login"><spring:message code="homepage.login"/></a></li>
							<li class="topbar-devider"></li>
							<li><a href="/account/register"><spring:message code="homepage.register"/></a></li>
						</sec:authorize>
						
					</ul>
				</div>
				<!-- End Topbar --> 

				<!-- Toggle get grouped for better mobile display -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="fa fa-bars"></span>
				</button>
				<!-- End Toggle -->
			</div><!--/end container-->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
				<div class="container">
					<ul class="nav navbar-nav">
						<%--li id="menu1">
							<a href="/" class="dropdown-toggle">
								<spring:message code="homepage"/>
							</a>
						</li--%>
						<sec:authorize access="hasAnyRole('ADMIN', 'TRANSPORTER')">
							<li class="" id="menu5">
								<a href="/shipment/list">
									<spring:message code="bidding.label"/>
								</a>
							</li>
						</sec:authorize>

						<sec:authorize access="hasAnyRole('ADMIN', 'CUSTOMER')">
							<li class="" id="menu2">
								<a href="/order/list">
									<spring:message code="homepage.listOrder"/>
								</a>
							</li>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ADMIN', 'CUSTOMER')">
							<li class="" id="menu3">
								<a href="/product/list">
									<spring:message code="homepage.listProduct"/>
								</a>
							</li>
						</sec:authorize>

						<sec:authorize access="hasAnyRole('ADMIN')">
							<li class="dropdown" id="menu4">
								<a href="/trucking/list-trucking" class="dropdown-toggle" data-toggle="dropdown">
									<spring:message code="homepage.post"/>
								</a>
								<ul class="dropdown-menu">
									<li id="menu4-sub1">
										<a href="#"><spring:message code="homepage.postShipment"/></a>
									</li>
								</ul>
							</li>
						</sec:authorize>
						
						<li class="dropdown" id="menu4">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
								<spring:message code="homepage.intro"/>
							</a>
							<ul class="dropdown-menu">
								<li class="active"><a href="/about-us"><spring:message code="homepage.aboutUs"/></a></li>
								<li><a href="/legacy"><spring:message code="homepage.agreement"/></a></li>
								<li><a href="/contact-us"><spring:message code="homepage.contact"/></a></li>
							</ul>
						</li>
						
						
						
<!-- 						<li class="" id="menu5"> -->
<!-- 							<a href="javascript:void(0);"> -->
<!-- 								Liên hệ -->
<!-- 							</a> -->
<!-- 						</li> -->
						
					</ul>
				</div><!--/end container-->
			</div><!--/navbar-collapse-->
		</div>
		
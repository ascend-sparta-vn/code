<%--
  Created by IntelliJ IDEA.
  User: namnguyen
  Date: 8/18/17
  Time: 2:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/css/pages/page_search_inner_tables.css" rel="stylesheet" />
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />
<input type="hidden" id="currentPage" value="${currentPage}" />
<input type="hidden" id="size" value="${size}" />

<%-- banner title --%>
<div class="breadcrumbs-v4">
    <div class="container">
        <span class="page-name"><spring:message code="shipments.title"/></span>
        <h1><spring:message code="list.title"/> <span class="shop-blue"><spring:message code="shipments.title"/></span> </h1>
        <ul class="breadcrumb-v4-in">
            <li><a href="index.html">Homepage</a></li>
            <li class="active shop-blue"><spring:message code="shipments.title"/></li>
        </ul>
    </div><!--/end container-->
</div>

<div class="container content-sm">
    <div class="row">
        <!-- list of shipments -->
        <div class="filter-results">
            <div class="row illustration-v2 margin-bottom-30">
            </div>
        </div>

        <!-- pagination -->
        <div class="text-center">
            <ul class="pagination pagination-v2">
                <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
            </ul>
        </div>
    </div>
</div>
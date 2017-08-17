<%--
  Created by IntelliJ IDEA.
  User: trungnq
  Date: 8/17/17
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<!--=== Breadcrumbs ===-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--<link rel="stylesheet" href="assets/css/pages/page_invoice.css">--%>
<link rel='stylesheet' href="/resources/js/plugins/utils/page_invoice.css">


<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">Order</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Pages</a></li>
            <li class="active">Order</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container content">

    <!--Invoice Detials-->
    <div class="row invoice-info">
        <div class="col-xs-6">
            <div class="tag-box tag-box-v3">
                <h2>Order Information:</h2>
                <ul class="list-unstyled">
                    <li><strong>Code:</strong> <code>CODE_2017${order.id}</code> </li>
                    <li><strong>Customer:</strong> ${order.user.username} </li>
                    <li><strong>Amount:</strong> ${order.totalAmount} </li>
                    <li><strong>Date created:</strong> <fmt:formatDate value="${order.createdTimestamp}" pattern="MM/dd/yyyy"/> </li>
                </ul>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="tag-box tag-box-v3">
                <h2>Payment Details:</h2>
                <ul class="list-unstyled">
                    <li><strong>Mobile:</strong> ${wallet.mobileNumber}</li>
                    <li><strong>Email:</strong> ${wallet.email}</li>
                    <li><strong>Address:</strong> ${wallet.address}</li>
                </ul>
            </div>
        </div>
    </div>
    <!--End Invoice Detials-->

    <!--Invoice Table-->
    <div class="panel panel-default margin-bottom-40">
        <div class="panel-heading">
            <h3 class="panel-title">Product Details</h3>
        </div>
        <table class="table table-striped invoice-table">
            <thead>
            <tr>
                <th>#</th>
                <th>Item</th>
                <th class="hidden-sm">Description</th>
                <th>Quantity</th>
                <th>Unit Cost</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order.products}" var="product" varStatus="myIndex">
            <tr>
                <td>${myIndex.index + 1}</td>
                <td>${product.name}</td>
                <td class="hidden-sm">${product.description}</td>
                <td>${product.amount}</td>
                <td>${product.price}</td>
                <td>${product.price * product.amount}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-xs-6">
        </div>
            <button class="btn btn-info btn-xs" id = 'back' type="button"
                    onclick="location.href= '/order/list/'">
                Back
            </button>
        </div>
    </div>

    <div class="row" style="margin-left: 0px; margin-right: 0px;">
        <div class="tab-v1">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#trackingPlan" data-toggle="tab" aria-expanded="true"><spring:message code="trip.tracking"/></a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active in" id="trackingPlan">
                    <div id="map-trucking-plan" class="map google-maps"></div>
                </div>
            </div>
        </div>
    </div>


</div><!--/container-->


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
<script src="/resources/js/plugins/utils/slider/style-switcher.js"></script>
<script>
    $(document).ready(function(){
        StyleSwitcher.initStyleSwitcher();
        initMap();
    });

    function initMap () {
        var self = this;
        var mapCanvasPlanning = document.getElementById("map-trucking-plan");

        var styles = [ {
            featureType : "poi",
            elementType : "all",
            stylers : [ {
                visibility : "off"
            } ]
        }, {
            featureType : "transit.station.bus",
            stylers : [ {
                visibility : "off"
            } ]
        } ];
        var uluru = {lat: 20.988047223199995, lng: 105.83226885986328};
        var mapOptions = {
            center : new google.maps.LatLng(20.991475, 105.798983),
            zoom : 10,
            styles : styles,
            position: uluru
        }

        self.mapPlanning = new google.maps.Map(mapCanvasPlanning, mapOptions);


        var directionsService = new google.maps.DirectionsService();
        var directionsDisplay = new google.maps.DirectionsRenderer();
        directionsDisplay.setMap(mapPlanning);

        var start = {lat: 21.0277644, lng: 105.83415979999995};
        var end = {lat: 20.988047223199995, lng: 105.83026885986328};
        var request = {
            origin: start,
            destination: end,
            travelMode: 'DRIVING'
        };

        directionsService.route(request, function(response, status) {
            if (status == 'OK') {
                directionsDisplay.setDirections(response);
                var myRoute = response.routes[0].legs[0];
                console.log("LEGS LENGTH: " + response.routes[0].legs.length);
//                for(var i = 0; i < myRoute.steps.length; i ++) {
//                    console.log('STEP: ' + i);
//                    var endLocation = myRoute.steps[i].end_location;
//                    var marker = new google.maps.Marker({
//                        position: endLocation,
//                        map: self.mapPlanning
//                    });
//                }
                var stepNValue = myRoute.steps[myRoute.steps.length - 5].end_location;
                var marker = new google.maps.Marker({
                    position: stepNValue,
                    map: self.mapPlanning
                });
            }
        });


    }

</script>
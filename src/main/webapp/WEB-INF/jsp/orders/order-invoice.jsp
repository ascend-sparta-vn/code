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


<%--<link rel="stylesheet" href="assets/css/pages/page_invoice.css">--%>
<link rel='stylesheet' href="/resources/js/plugins/utils/page_invoice.css">


<div class="breadcrumbs">
    <div class="container">
        <h1 class="pull-left">Invoice</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li><a href="">Pages</a></li>
            <li class="active">Invoice</li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container content">
    <!--Invoice Header-->
    <div class="row invoice-header">
        <div class="col-xs-6">
            <img src="assets/img/img.jpg" alt="">
            <!-- You also can use a title instead of image
            <h2 class="pull-left">Product Invoice</h2>-->
        </div>
        <div class="col-xs-6 invoice-numb">
            #123456789 / 20, October 2013
            <span>Auiderer facilis consectetur</span>
        </div>
    </div>
    <!--End Invoice Header-->

    <!--Invoice Detials-->
    <div class="row invoice-info">
        <div class="col-xs-6">
            <div class="tag-box tag-box-v3">
                <h2>Customer Information:</h2>
                <ul class="list-unstyled">
                    <%--<li><strong>Full Name:</strong> ${currentUser.username}</li>--%>
                    <%--<li><strong>Mobile Number:</strong> ${currentUser.mobile}</li>--%>
                    <%--<li><strong>Email:</strong> ${currentUser.email}</li>--%>
                    <%--<li><strong>Address:</strong> ${currentUser.address}</li>--%>
                </ul>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="tag-box tag-box-v3">
                <h2>Peyment Details:</h2>
                <ul class="list-unstyled">
                    <%--<li><strong>Bank Name:</strong> Ascend Bank</li>--%>
                    <%--<li><strong>Mobile Number:</strong> ${wallet.mobileNumber}</li>--%>
                    <%--<li><strong>Thai ID:</strong> ${wallet.thaiId}</li>--%>
                    <%--<li><strong>Email:</strong> ${wallet.email}</li>--%>
                    <%--<li><strong>First Name:</strong> ${wallet.firstName}</li>--%>
                </ul>
            </div>
        </div>
    </div>
    <!--End Invoice Detials-->

    <!--Invoice Table-->
    <div class="panel panel-default margin-bottom-40">
        <div class="panel-heading">
            <h3 class="panel-title">Invoice Details</h3>
        </div>
        <div class="panel-body">
            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi.</p>
        </div>
        <table class="table table-striped invoice-table">
            <thead>
            <tr>
                <th>Item</th>
                <th class="hidden-sm">Description</th>
                <th>Quantity</th>
                <th>Unit Cost</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listProduct}" var="product">
                <tr>
                    <%--<td>${product.name}</td>--%>
                    <%--<td>${product.description}</td>--%>
                    <%--<td>${product.quantity}</td>--%>
                    <%--<td>${product.price}</td>--%>
                    <%--<td>${product.price * product.quantity}</td>--%>

                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>
    <!--End Invoice Table-->

    <!--Invoice Footer-->
    <div class="row">
        <div class="col-xs-6">
            <div class="tag-box tag-box-v3 no-margin-bottom">
                <address class="no-margin-bottom">
                    25, Lorem Lis Street, Orange <br>
                    California, US <br>
                    Phone: 800 123 3456 <br>
                    Fax: 800 123 3456 <br>
                    Email: <a href="mailto:info@example.com">info@example.com</a>
                </address>
            </div>
        </div>
        <div class="col-xs-6 text-right">
            <ul class="list-unstyled invoice-total-info">
                <li><strong>Sub - Total Amount:</strong> $109365</li>
                <li><strong>Discount:</strong> 14.8%</li>
                <li><strong>VAT ($6):</strong> $8371</li>
                <li><strong>Grand Total:</strong> $101486</li>
            </ul>
            <button class="btn-u sm-margin-bottom-10" onclick="javascript:window.print();"><i class="fa fa-print"></i> Print</button>
            <button class="btn-u" id="btnConfirmOtp">Confirm OTP</button>
        </div>
    </div>
    <!--End Invoice Footer-->
</div><!--/container-->
<!--=== End Content Part ===-->

<%--Modal OTP--%>
<div id="otpModal" class="modal fade" role="dialog" style="margin-top: 100px">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <p4>Confirm OTP</p4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="otp">Enter OTP</label>
                        <p><input id="otp" class="form-control col-md-2 wl_otp" placeholder="OTP code" type="text" /></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Confirm</button>
            </div>
        </div>

    </div>
</div>


<script src="/resources/js/plugins/utils/slider/style-switcher.js"></script>
<script>
    $(document).ready(function(){
        StyleSwitcher.initStyleSwitcher();
    });

    // submit OTP
    $("#btnConfirmOtp").click(function(){
        $("#otpModal").modal('show');
    });

</script>
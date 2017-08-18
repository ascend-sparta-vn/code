<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

                <link rel='stylesheet' href="/resources/js/plugins/utils/jquery-step/custom-jquery.steps.css">

                <div class="breadcrumbs">
                    <div class="container">
                        <h1 class="pull-left">
                            <spring:message code="shipment.detail" />
                        </h1>
                        <ul class="pull-right breadcrumb">
                            <li>
                                <a href="/">
                                    <spring:message code="homepage" />
                                </a>
                            </li>
                            <li class="active">
                                <a href="/shipment/list">
                                    <spring:message code="shipment.list" />
                                </a>
                            </li>
                            <li class="active">
                                <a href="#">
                                    <spring:message code="shipment.detail" />
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <br/>
<c:set var="amoutTotal" value="${0}" />
                <!--=== Breadcrumbs v4 ===-->
                <div class="breadcrumbs-v4">
                    <div class="container">
                        <span class="page-name">Check Out</span>
                        <h1>Maecenas <span class="shop-green">enim</span> sapien</h1>
                        <ul class="breadcrumb-v4-in">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="">Product</a></li>
                            <li class="active">Shopping Cart</li>
                        </ul>
                    </div>
                    <!--/end container-->
                </div>
                <!--=== End Breadcrumbs v4 ===-->

                <!--=== Content Medium Part ===-->
                <div class="content-md margin-bottom-30">
                    <div class="container">
                        <form class="shopping-cart" action="#">
                            <div>
                                <div class="header-tags">
                                    <div class="overflow-h">
                                        <h2>Shopping Cart</h2>
                                        <p>Review &amp; edit your product</p>
                                        <i class="rounded-x fa fa-check"></i>
                                    </div>
                                </div>
                                <section>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Unit</th>
                                                    <th>Price</th>
                                                    <th>Qty</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody class="product-list-table">
                                                <!-- Add no items sign here -->

                                                <c:forEach items="${listProduct}" var="product">
                                                    <c:set var="amoutTotal" value="${amoutTotal + product.price * product.quantity}" />
                                                    <tr>
                                                        <td class="product-in-table">
                                                            <img class="img-responsive" src=${product.imgUrl} alt="">
                                                            <div class="product-it-in">
                                                                <h3>${product.name}</h3>
                                                            </div>
                                                        </td>
                                                        <td>Unit</td>
                                                        <td id="price_${product.id}">${product.price}</td>
                                                        <td>
                                                            <button type='button' class="quantity-button" name='subtract' onclick="addQuantity('${product.id}', -1); " >-</button>
                                                            <input type='text' class="quantity-field product_${product.id}" name='qty1' value="${product.quantity}" id='qty_${product.id}'/>
                                                            <button type='button' class="quantity-button" name='add' onclick="addQuantity('${product.id}', 1);" >+</button>
                                                        </td>
                                                        <td class="shop-red total product_${product.id}" id="tdTotal_${product.id}">
                                                                ${VND} ${product.price * product.quantity}
                                                        </td>
                                                        <td>
                                                            <button type="button" class="close" >
                                                                <span>&times;</span>
                                                                <span class="sr-only">Close</span>
                                                            </button>
                                                        </td>
                                                    </tr>

                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </section>

                                <div class="header-tags">
                                    <div class="overflow-h">
                                        <h2>Billing info</h2>
                                        <p>Shipping and address infot</p>
                                        <i class="rounded-x fa fa-home"></i>
                                    </div>
                                </div>
                                <section class="billing-info">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <h2 class="title-type">Shipping Address</h2>
                                            <div class="billing-info-inputs checkbox-list">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <input id="name2" type="text" placeholder="First Name" name="firstname" class="form-control">
                                                        <input id="email2" type="text" placeholder="Email" name="email" class="form-control email">
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <input id="surname2" type="text" placeholder="Last Name" name="lastname" class="form-control">
                                                        <input id="phone2" type="tel" placeholder="Phone" name="phone" class="form-control">
                                                    </div>
                                                </div>
                                                <input id="shippingAddress" type="text" placeholder="Address Line 1" name="address1" class="form-control">
                                                <input id="shippingAddress2" type="text" placeholder="Address Line 2" name="address2" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <div class="header-tags">
                                    <div class="overflow-h">
                                        <h2>Payment</h2>
                                        <p>Select Payment method</p>
                                        <i class="rounded-x fa fa-credit-card"></i>
                                    </div>
                                </div>
                                <section>
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2 md-margin-bottom-50">
                                            <h2 class="title-type">Choose a payment method</h2>
                                            <!-- Accordion -->
                                            <div class="accordion-v2">
                                                <div class="panel-group" id="accordion">

                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#ascend_payment">
                                                                    <img src="/resources/img/icons/ascend.png" style="max-height: 24px; max-width: 24px;"/> Pay with Ascend wallet
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="ascend_payment" class="panel-collapse collapse in">
                                                            <div class="panel-body cus-form-horizontal">
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 no-col-space control-label">Mobile number</label>
                                                                    <div class="col-sm-4">
                                                                        <input type="text" class="form-control required" name="cardholder" placeholder="">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 no-col-space control-label">Password</label>
                                                                    <div class="col-sm-4">
                                                                        <input type="password" class="form-control required" name="cardholder" placeholder="">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group margin-left-20">
                                                                    <a href="#" data-toggle="modal" data-target="#responsive">Create new Ascend wallet if you don't have any</a>   
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#visa_payment">
                                                                    <i class="fa fa-credit-card"></i> Credit or Debit Card
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="visa_payment" class="panel-collapse collapse">
                                                            <div class="panel-body cus-form-horizontal">
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 no-col-space control-label">Cardholder Name</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" class="form-control required" name="cardholder" placeholder="">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 no-col-space control-label">Card Number</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" class="form-control required" name="cardnumber" placeholder="">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 no-col-space control-label">Payment Types</label>
                                                                    <div class="col-sm-8">
                                                                        <ul class="list-inline payment-type">
                                                                            <li><i class="fa fa-cc-paypal"></i></li>
                                                                            <li><i class="fa fa-cc-visa"></i></li>
                                                                            <li><i class="fa fa-cc-mastercard"></i></li>
                                                                            <li><i class="fa fa-cc-discover"></i></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-4">Expiration Date</label>
                                                                    <div class="col-sm-8 input-small-field">
                                                                        <input type="text" name="mm" placeholder="MM" class="form-control required sm-margin-bottom-20">
                                                                        <span class="slash">/</span>
                                                                        <input type="text" name="yy" placeholder="YY" class="form-control required">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 no-col-space control-label">CVC</label>
                                                                    <div class="col-sm-8 input-small-field">
                                                                        <input type="text" name="number" placeholder="" class="form-control required">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Accordion -->
                                        </div>
                                    </div>
                                </section>

                                <div class="coupon-code">
                                    <div class="row">
                                        <div class="col-sm-4 sm-margin-bottom-30">
                                            <h3>Discount Code</h3>
                                            <p>Enter your coupon code</p>
                                            <input class="form-control margin-bottom-10" name="code" type="text">
                                            <button type="button" class="btn-u btn-u-sea-shop">Apply Coupon</button>
                                        </div>
                                        <div class="col-sm-3 col-sm-offset-5">
                                            <ul class="list-inline total-result">
                                                <li>
                                                    <h4>Subtotal:</h4>
                                                    <div class="total-result-in">
                                                        $ <span class="sub_total_cost" id="span_amountTotal">${amoutTotal}</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <h4>Shipping:</h4>
                                                    <div class="total-result-in">
                                                        $<span class="shipment_cost text-right"> 0</span>
                                                    </div>
                                                </li>
                                                <li class="divider"></li>
                                                <li class="total-price">
                                                    <h4>Total:</h4>
                                                    <div class="total-result-in">
                                                        $ <span class="total_cost" id="total_cost">${amoutTotal}</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!--/end container-->
                </div>
                <!--=== End Content Medium Part ===-->

                <!--=== Shop Suvbscribe ===-->
                <div class="shop-subscribe">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 md-margin-bottom-20">
                                <h2>subscribe to our weekly <strong>newsletter</strong></h2>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Email your email...">
                                    <span class="input-group-btn">
								<button class="btn" type="button"><i class="fa fa-envelope-o"></i></button>
							</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/end container-->
                </div>
                <!--=== End Shop Suvbscribe ===-->
                
                <!--=== Modals ===-->
                <div class="modal fade" id="responsive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="margin: 120px auto;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel4">Wallet information</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p><input class="form-control wl_firstname" placeholder="First name" type="text" /></p>
                                        <p><input class="form-control wl_email" placeholder="Email" type="text" /></p>
                                        <p><input class="form-control wl_occupation" placeholder="Occupation" type="text" /></p>
                                        <p><input class="form-control wl_password" placeholder="Password" type="password" /></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p><input class="form-control wl_lastname" placeholder="Last name" type="text" /></p>
                                        <p><input class="form-control wl_mobile" placeholder="Mobile number" type="text" /></p>
                                        <p><input class="form-control wl_postalcode" placeholder="Postal code" type="text" /></p>
                                        <p><input class="form-control wl_citizenid" placeholder="Citizen id" type="text" /></p>
                                    </div>
                                </div>
                                <div class="row">
                                   <div class="col-md-12">
                                       <p><input class="form-control wl_address" placeholder="Address" type="text" /></p>
                                   </div>
                                </div>

                                <div id="modal_otp_zone">
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label" for="otp">Email</label>
                                            <p><input id="otp" class="form-control col-md-2" placeholder="OTP code" type="text" /></p>
                                        </div>
                                    </div>    
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn-u btn-u-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn-u btn-u-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--=== End modals ===-->
                
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
                <script src="/resources/js/product/ProductCheckout.js"></script>
                <script src="/resources/js/plugins/utils/slider/master-slider-showcase2.js"></script>
                <script src="/resources/js/plugins/utils/slider/style-switcher.js"></script>
                <script src="/resources/js/plugins/utils/slider/owl-carousel.js"></script>
                <script src="/resources/js/plugins/utils/jquery-step/jquery.steps.js"></script>
                <script src="/resources/js/plugins/utils/jquery-step/stepWizard.js"></script>
                <script src="/resources/js/lodash.js"></script>
                <script>
                    function addQuantity(productId, quantity) {
                        var price_ = document.getElementById('price_' + productId);
                        var qty_ = document.getElementById('qty_' + productId);
                        var tdTotal_ = document.getElementById('tdTotal_' + productId);

                        qty_.value  = parseInt(qty_.value) + parseInt(quantity);
                        tdTotal_.innerHTML = parseInt(tdTotal_.innerHTML) + parseInt(price_.innerHTML) * parseInt(quantity);

                        var span_amountTotal = document.getElementById('span_amountTotal');
                        var total_cost = document.getElementById('total_cost');
                        span_amountTotal.innerHTML = parseInt(span_amountTotal.innerHTML) + parseInt(price_.innerHTML) * quantity;
                        total_cost.innerHTML  = span_amountTotal.innerHTML;
                        var post = {};

                        var url = '/product/cart/add/' + productId + '/' + quantity;
                        $.ajax({
                            type : "GET",
                            contentType : "application/json",
                            url : url,
                            dataType : 'json',
                            success : function(response) {
                                //$('#td_' + order_id).html('Delivering');
                            },
                            error : function(e) {
                                showMessage('ERROR: /product/cart/add/', 'error');
                                console.log("ERROR /product/cart/add/: ", e);
                            },
                            done : function(e) {
                                console.log("DONE");
                            }
                        });

                    }
                    var productList = new ProductList();
                    $(document).ready(function() {
                        <%--productList.listProduct.push(${listProduct});--%>
                        getResource(function() {
                            productList.init();
                        });
                        // init slider lib
                        App.initScrollBar();
                        StepWizard.initStepWizard();
                        MasterSliderShowcase2.initMasterSliderShowcase2();
                    });
                </script>
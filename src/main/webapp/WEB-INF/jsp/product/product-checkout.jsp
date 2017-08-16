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
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <input id="city2" type="text" placeholder="City" name="city" class="form-control">
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <input id="zip2" type="text" placeholder="Zip/Postal Code" name="zip" class="form-control">
                                                    </div>
                                                </div>
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
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                                    <i class="fa fa-paypal"></i> Pay with Ascend wallet
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseTwo" class="panel-collapse collapse in">
                                                            <div class="content margin-left-10">
                                                                <a href="#"><img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/PP_logo_h_150x38.png" alt="PayPal"></a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                                    <i class="fa fa-credit-card"></i> Credit or Debit Card
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseOne" class="panel-collapse collapse">
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
                                                        <span class="sub_total_cost">$ 1280.00</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <h4>Shipping:</h4>
                                                    <div class="total-result-in">
                                                        <span class="shipment_cost text-right">- - - -</span>
                                                    </div>
                                                </li>
                                                <li class="divider"></li>
                                                <li class="total-price">
                                                    <h4>Total:</h4>
                                                    <div class="total-result-in">
                                                        <span class="total_cost">$ 1280.00</span>
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
                
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
                <script src="/resources/js/product/ProductCheckout.js"></script>
                <script src="/resources/js/plugins/utils/slider/master-slider-showcase2.js"></script>
                <script src="/resources/js/plugins/utils/slider/style-switcher.js"></script>
                <script src="/resources/js/plugins/utils/slider/owl-carousel.js"></script>
                <script src="/resources/js/plugins/utils/jquery-step/jquery.steps.js"></script>
                <script src="/resources/js/plugins/utils/jquery-step/stepWizard.js"></script>
                <script src="/resources/js/lodash.js"></script>
                <script>
                    var productList = new ProductList();
                    $(document).ready(function() {
                        getResource(function() {
                            productList.init();
                        });
                        // init slider lib
                        App.initScrollBar();
                        StepWizard.initStepWizard();
                        MasterSliderShowcase2.initMasterSliderShowcase2();
                    });
                </script>
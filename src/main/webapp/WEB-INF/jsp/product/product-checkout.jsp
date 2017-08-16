<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel='stylesheet' href="/resources/js/plugins/utils/jquery-step/custom-jquery.steps.css">

<div class="breadcrumbs">
	<div class="container">
		<h1 class="pull-left"><spring:message code="shipment.detail"/></h1>
		<ul class="pull-right breadcrumb">
			<li><a href="/"><spring:message code="homepage"/></a></li>
			<li class="active"><a href="/shipment/list"><spring:message code="shipment.list"/></a></li>
			<li class="active"><a href="#"><spring:message code="shipment.detail"/></a></li>
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
	</div><!--/end container-->
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
								<th>Price</th>
								<th>Qty</th>
								<th>Total</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td class="product-in-table">
									<img class="img-responsive" src="/resources/img/thumb/thumb1.jpg" alt="">
									<div class="product-it-in">
										<h3>Double-Breasted</h3>
										<span>Sed aliquam tincidunt tempus</span>
									</div>
								</td>
								<td>$ 160.00</td>
								<td>
									<button type='button' class="quantity-button" name='subtract' onclick='javascript: subtractQty1();' value='-'>-</button>
									<input type='text' class="quantity-field" name='qty1' value="5" id='qty1'/>
									<button type='button' class="quantity-button" name='add' onclick='javascript: document.getElementById("qty1").value++;' value='+'>+</button>
								</td>
								<td class="shop-red">$ 320.00</td>
								<td>
									<button type="button" class="close"><span>&times;</span><span class="sr-only">Close</span></button>
								</td>
							</tr>
							<tr>
								<td class="product-in-table">
									<img class="img-responsive" src="/resources/img/thumb/thumb1.jpg" alt="">
									<div class="product-it-in">
										<h3>Vivamus ligula</h3>
										<span>Sed aliquam tincidunt tempus</span>
									</div>
								</td>
								<td>$ 160.00</td>
								<td>
									<button type='button' class="quantity-button" name='subtract' onclick='javascript: subtractQty2();' value='-'>-</button>
									<input type='text' class="quantity-field" name='qty2' value="3" id='qty2'/>
									<button type='button' class="quantity-button" name='add' onclick='javascript: document.getElementById("qty2").value++;' value='+'>+</button>
								</td>
								<td class="shop-red">$ 320.00</td>
								<td>
									<button type="button" class="close"><span>&times;</span><span class="sr-only">Close</span></button>
								</td>
							</tr>
							<tr>
								<td class="product-in-table">
									<img class="img-responsive" src="/resources/img/thumb/thumb1.jpg" alt="">
									<div class="product-it-in">
										<h3>Vivamus ligula</h3>
										<span>Sed aliquam tincidunt tempus</span>
									</div>
								</td>
								<td>$ 160.00</td>
								<td>
									<button type='button' class="quantity-button" name='subtract' onclick='javascript: subtractQty3();' value='-'>-</button>
									<input type='text' class="quantity-field" name='qty3' value="1" id='qty3'/>
									<button type='button' class="quantity-button" name='add' onclick='javascript: document.getElementById("qty3").value++;' value='+'>+</button>
								</td>
								<td class="shop-red">$ 320.00</td>
								<td>
									<button type="button" class="close"><span>&times;</span><span class="sr-only">Close</span></button>
								</td>
							</tr>
							<tr>
								<td class="product-in-table">
									<img class="img-responsive" src="/resources/img/thumb/thumb1.jpg" alt="">
									<div class="product-it-in">
										<h3>Vivamus ligula</h3>
										<span>Sed aliquam tincidunt tempus</span>
									</div>
								</td>
								<td>$ 160.00</td>
								<td>
									<button type='button' class="quantity-button" name='subtract' onclick='javascript: subtractQty4();' value='-'>-</button>
									<input type='text' class="quantity-field" name='qty4' value="7" id='qty4'/>
									<button type='button' class="quantity-button" name='add' onclick='javascript: document.getElementById("qty4").value++;' value='+'>+</button>
								</td>
								<td class="shop-red">$ 320.00</td>
								<td>
									<button type="button" class="close"><span>&times;</span><span class="sr-only">Close</span></button>
								</td>
							</tr>
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
						<div class="col-md-6 md-margin-bottom-40">
							<h2 class="title-type">Billing Address</h2>
							<div class="billing-info-inputs checkbox-list">
								<div class="row">
									<div class="col-sm-6">
										<input id="name" type="text" placeholder="First Name" name="firstname" class="form-control required">
										<input id="email" type="text" placeholder="Email" name="email" class="form-control required email">
									</div>
									<div class="col-sm-6">
										<input id="surname" type="text" placeholder="Last Name" name="lastname" class="form-control required">
										<input id="phone" type="tel" placeholder="Phone" name="phone" class="form-control required">
									</div>
								</div>
								<input id="billingAddress" type="text" placeholder="Address Line 1" name="address1" class="form-control required">
								<input id="billingAddress2" type="text" placeholder="Address Line 2" name="address2" class="form-control required">
								<div class="row">
									<div class="col-sm-6">
										<input id="city" type="text" placeholder="City" name="city" class="form-control required">
									</div>
									<div class="col-sm-6">
										<input id="zip" type="text" placeholder="Zip/Postal Code" name="zip" class="form-control required">
									</div>
								</div>

								<label class="checkbox text-left">
									<input type="checkbox" name="checkbox"/>
									<i></i>
									Ship item to the above billing address
								</label>
							</div>
						</div>

						<div class="col-md-6">
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
						<div class="col-md-6 md-margin-bottom-50">
							<h2 class="title-type">Choose a payment method</h2>
							<!-- Accordion -->
							<div class="accordion-v2">
								<div class="panel-group" id="accordion">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
													<i class="fa fa-credit-card"></i>
													Credit or Debit Card
												</a>
											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse in">
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
													<label class="col-sm-4 no-col-space control-label">CSC</label>
													<div class="col-sm-8 input-small-field">
														<input type="text" name="number" placeholder="" class="form-control required">
														<a href="#">What's this?</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
													<i class="fa fa-paypal"></i>
													Pay with PayPal
												</a>
											</h4>
										</div>
										<div id="collapseTwo" class="panel-collapse collapse">
											<div class="content margin-left-10">
												<a href="#"><img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/PP_logo_h_150x38.png" alt="PayPal"></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Accordion -->
						</div>

						<div class="col-md-6">
							<h2 class="title-type">Frequently asked questions</h2>
							<!-- Accordion -->
							<div class="accordion-v2 plus-toggle">
								<div class="panel-group" id="accordion-v2">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion-v2" href="#collapseOne-v2">
													What payments methods can I use?
												</a>
											</h4>
										</div>
										<div id="collapseOne-v2" class="panel-collapse collapse in">
											<div class="panel-body">
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit, felis vel tincidunt sodales, urna metus rutrum leo, sit amet finibus velit ante nec lacus. Cras erat nunc, pulvinar nec leo at, rhoncus elementum orci. Nullam ut sapien ultricies, gravida ante ut, ultrices nunc.
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" class="collapsed" data-parent="#accordion-v2" href="#collapseTwo-v2">
													Can I use gift card to pay for my purchase?
												</a>
											</h4>
										</div>
										<div id="collapseTwo-v2" class="panel-collapse collapse">
											<div class="panel-body">
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit, felis vel tincidunt sodales, urna metus rutrum leo, sit amet finibus velit ante nec lacus. Cras erat nunc, pulvinar nec leo at, rhoncus elementum orci. Nullam ut sapien ultricies, gravida ante ut, ultrices nunc.
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" class="collapsed" data-parent="#accordion-v2" href="#collapseThree-v2">
													Will I be charged when I place my order?
												</a>
											</h4>
										</div>
										<div id="collapseThree-v2" class="panel-collapse collapse">
											<div class="panel-body">
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit, felis vel tincidunt sodales, urna metus rutrum leo, sit amet finibus velit ante nec lacus. Cras erat nunc, pulvinar nec leo at, rhoncus elementum orci. Nullam ut sapien ultricies, gravida ante ut, ultrices nunc.
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" class="collapsed" data-parent="#accordion-v2" href="#collapseFour-v2">
													How long will it take to get my order?
												</a>
											</h4>
										</div>
										<div id="collapseFour-v2" class="panel-collapse collapse">
											<div class="panel-body">
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit, felis vel tincidunt sodales, urna metus rutrum leo, sit amet finibus velit ante nec lacus. Cras erat nunc, pulvinar nec leo at, rhoncus elementum orci. Nullam ut sapien ultricies, gravida ante ut, ultrices nunc.
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
										<span>$ 1280.00</span>
									</div>
								</li>
								<li>
									<h4>Shipping:</h4>
									<div class="total-result-in">
										<span class="text-right">- - - -</span>
									</div>
								</li>
								<li class="divider"></li>
								<li class="total-price">
									<h4>Total:</h4>
									<div class="total-result-in">
										<span>$ 1280.00</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div><!--/end container-->
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
	</div><!--/end container-->
</div>
<!--=== End Shop Suvbscribe ===-->


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD18tbGrjpouvZTjOXNtXxCdJdFwUI09iY&callback=initialize"></script>
<script src="/resources/js/product/ProductDetail.js"></script>
<script src="/resources/js/plugins/utils/slider/master-slider-showcase2.js"></script>
<script src="/resources/js/plugins/utils/slider/style-switcher.js"></script>
<script src="/resources/js/plugins/utils/slider/owl-carousel.js"></script>
<script src="/resources/js/plugins/utils/jquery-step/jquery.steps.js"></script>
<script src="/resources/js/plugins/utils/jquery-step/stepWizard.js"></script>
<script>
    var manager = new ProductDetail();
    $(document).ready(function(){
        getResource(function(){
            manager.init();
        });
        // init slider lib
        App.initScrollBar();
        StepWizard.initStepWizard();
        MasterSliderShowcase2.initMasterSliderShowcase2();
    });

</script>
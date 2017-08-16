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

        <div class="col-md-9">
            <div class="profile-body margin-bottom-20">
                <div class="tab-v1">
                    <ul class="nav nav-justified nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#profile">Edit Profile</a></li>
                        <li><a data-toggle="tab" href="#passwordTab">Change Password</a></li>
                        <li><a data-toggle="tab" href="#payment">Payment Options</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="profile" class="profile-edit tab-pane fade in active">
                            <h2 class="heading-md">Manage your Name, ID and Email Addresses.</h2>
                            <p>Below are the name and email addresses on file for your account.</p>
                            <br>
                            <dl class="dl-horizontal">
                                <dt><strong>Your name </strong></dt>
                                <dd>
                                    Edward Rooster
                                    <span>
                                        <a class="pull-right" href="#">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                </dd>
                                <hr>
                                <dt><strong>Your ID </strong></dt>
                                <dd>
                                    FKJ-032440
                                    <span>
                                        <a class="pull-right" href="#">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                </dd>
                                <hr>
                                <dt><strong>Company name </strong></dt>
                                <dd>
                                    Htmlstream
                                    <span>
                                        <a class="pull-right" href="#">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                </dd>
                                <hr>
                                <dt><strong>Primary Email Address </strong></dt>
                                <dd>
                                    edward-rooster@gmail.com
                                    <span>
                                        <a class="pull-right" href="#">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                </dd>
                                <hr>
                                <dt><strong>Phone Number </strong></dt>
                                <dd>
                                    (304) 33-2867-499
                                    <span>
                                        <a class="pull-right" href="#">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                </dd>
                                <hr>
                                <dt><strong>Office Number </strong></dt>
                                <dd>
                                    (304) 44-9810-296
                                    <span>
                                        <a class="pull-right" href="#">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                </dd>
                                <hr>
                                <dt><strong>Address </strong></dt>
                                <dd>
                                    California, US
                                    <span>
                                        <a class="pull-right" href="#">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </span>
                                </dd>
                                <hr>
                            </dl>
                            <button type="button" class="btn-u btn-u-default">Cancel</button>
                            <button type="button" class="btn-u">Save Changes</button>
                        </div>

                        <div id="passwordTab" class="profile-edit tab-pane fade">
                            <h2 class="heading-md">Manage your Security Settings</h2>
                            <p>Change your password.</p>
                            <br>
                            <form class="sky-form" id="sky-form4" action="#">
                                <dl class="dl-horizontal">
                                    <dt>Old password</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-envelope"></i>
                                                <input type="email" placeholder="Email address" name="email">
                                                <b class="tooltip tooltip-bottom-right">Needed to verify your account</b>
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>Enter your password</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-lock"></i>
                                                <input type="password" id="password" name="password" placeholder="Password">
                                                <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                            </label>
                                        </section>
                                    </dd>
                                    <dt>Confirm Password</dt>
                                    <dd>
                                        <section>
                                            <label class="input">
                                                <i class="icon-append fa fa-lock"></i>
                                                <input type="password" name="passwordConfirm" placeholder="Confirm password">
                                                <b class="tooltip tooltip-bottom-right">Don't forget your password</b>
                                            </label>
                                        </section>
                                    </dd>
                                </dl>
                                <button type="button" class="btn-u btn-u-default">Cancel</button>
                                <button class="btn-u" type="submit">Save Changes</button>
                            </form>
                        </div>

                        <div id="payment" class="profile-edit tab-pane fade">
                            <h2 class="heading-md">Manage your Payment Settings</h2>
                            <p>Below are the payment options for your account.</p>
                            <br>
                            <form class="sky-form" id="sky-form" action="#">
                                <!--Checkout-Form-->
                                <section>
                                    <div class="inline-group">
                                        <label class="radio"><input type="radio" name="radio-inline" class="payment_method ascend_wallet"><i class="rounded-x"></i>Ascend wallet</label>
                                        <label class="radio"><input type="radio" checked="" name="radio-inline" class="payment_method visa_card"><i class="rounded-x"></i>Visa</label>
                                        <label class="radio"><input type="radio" name="radio-inline" class="payment_method master_card"><i class="rounded-x"></i>MasterCard</label>
                                    </div>
                                </section>
                                
                                <div id="payment_by_visa_master">
                                    <section>
                                        <label class="input">
                                            <input type="text" name="name" placeholder="Name on card">
                                        </label>
                                    </section>

                                    <div class="row">
                                        <section class="col col-10">
                                            <label class="input">
                                                <input type="text" name="card" id="card" placeholder="Card number">
                                            </label>
                                        </section>
                                        <section class="col col-2">
                                            <label class="input">
                                                <input type="text" name="cvv" id="cvv" placeholder="CVV2">
                                            </label>
                                        </section>
                                    </div>
                                    
                                    <div class="row">
                                    <label class="label col col-4">Expiration date</label>
                                        <section class="col col-5">
                                            <label class="select">
                                                <select name="month">
                                                    <option disabled="" selected="" value="0">Month</option>
                                                    <option value="1">January</option>
                                                    <option value="1">February</option>
                                                    <option value="3">March</option>
                                                    <option value="4">April</option>
                                                    <option value="5">May</option>
                                                    <option value="6">June</option>
                                                    <option value="7">July</option>
                                                    <option value="8">August</option>
                                                    <option value="9">September</option>
                                                    <option value="10">October</option>
                                                    <option value="11">November</option>
                                                    <option value="12">December</option>
                                                </select>
                                                <i></i>
                                            </label>
                                        </section>
                                        <section class="col col-3">
                                            <label class="input">
                                                <input type="text" placeholder="Year" id="year" name="year">
                                            </label>
                                        </section>
                                    </div>
                                    
                                    <button type="button" class="btn-u btn-u-default">Cancel</button>
                                    <button class="btn-u" type="submit">Save Changes</button>
                                </div>
                                
                                <div id="payment_by_ascend_wallet">
                                    <div class="row margin-bottom-20">
                                        <div class="col-sm-6 sm-margin-bottom-20">
                                            <div class="profile-blog">
                                                <img class="rounded-x" src="assets/img/testimonials/img1.jpg" alt="">
                                                <div class="name-location">
                                                    <strong>Mikel Andrews</strong>
                                                    <span><i class="fa fa-map-marker"></i><a href="#">California,</a> <a href="#">US</a></span>
                                                </div>
                                                <div class="clearfix margin-bottom-20"></div>
                                                <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                                                <hr>
                                                <ul class="list-inline share-list">
                                                    <li><i class="fa fa-bell"></i><a href="#">12 Notifications</a></li>
                                                    <li><i class="fa fa-group"></i><a href="#">54 Followers</a></li>
                                                    <li><i class="fa fa-share"></i><a href="#">Share</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="profile-blog">
                                                <img class="rounded-x" src="assets/img/testimonials/user.jpg" alt="">
                                                <div class="name-location">
                                                    <strong>Natasha Kolnikova</strong>
                                                    <span><i class="fa fa-map-marker"></i><a href="#">Moscow,</a> <a href="#">Russia</a></span>
                                                </div>
                                                <div class="clearfix margin-bottom-20"></div>
                                                <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                                                <hr>
                                                <ul class="list-inline share-list">
                                                    <li><i class="fa fa-bell"></i><a href="#">37 Notifications</a></li>
                                                    <li><i class="fa fa-group"></i><a href="#">46 Followers</a></li>
                                                    <li><i class="fa fa-share"></i><a href="#">Share</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div><!--/end row-->
                                    
                                    <div class="row margin-bottom-20">
                                        <div class="col-sm-6 sm-margin-bottom-20">
                                            <div class="profile-blog">
                                                <img class="rounded-x" src="assets/img/testimonials/img2.jpg" alt="">
                                                <div class="name-location">
                                                    <strong>Sasha Elli</strong>
                                                    <span><i class="fa fa-map-marker"></i><a href="#">California,</a> <a href="#">US</a></span>
                                                </div>
                                                <div class="clearfix margin-bottom-20"></div>
                                                <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                                                <hr>
                                                <ul class="list-inline share-list">
                                                    <li><i class="fa fa-bell"></i><a href="#">3 Notifications</a></li>
                                                    <li><i class="fa fa-group"></i><a href="#">25 Followers</a></li>
                                                    <li><i class="fa fa-share"></i><a href="#">Share</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="profile-blog">
                                                <img class="rounded-x" src="assets/img/testimonials/img3.jpg" alt="">
                                                <div class="name-location">
                                                    <strong>Frank Heller</strong>
                                                    <span><i class="fa fa-map-marker"></i><a href="#">Moscow,</a> <a href="#">Russia</a></span>
                                                </div>
                                                <div class="clearfix margin-bottom-20"></div>
                                                <p>Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.</p>
                                                <hr>
                                                <ul class="list-inline share-list">
                                                    <li><i class="fa fa-bell"></i><a href="#">7 Notifications</a></li>
                                                    <li><i class="fa fa-group"></i><a href="#">77 Followers</a></li>
                                                    <li><i class="fa fa-share"></i><a href="#">Share</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div><!--/end row-->
                                    
                                    <button type="button" class="btn-u btn-u-default btn-block text-center">Load More</button>
                                </div>
                                <!--End Checkout-Form-->
                            </form>
                        </div>
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

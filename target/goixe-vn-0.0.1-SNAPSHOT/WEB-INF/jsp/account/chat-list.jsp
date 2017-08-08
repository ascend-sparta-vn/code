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


<div class="container content profile">
    <div class="row">
        <%@include file="/WEB-INF/jsp/account/left-profile.jsp"%>

        <!-- Profile Content -->
        <div class="col-md-9">
            <div class="tab-v1">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab" aria-expanded="true">Danh bạ</a></li>
                    <li class=""><a href="#messages" data-toggle="tab" aria-expanded="false">Tin nhắn</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="home">
                        <div class="row" style="margin-top: 20px;">
                            <div class="input-group col-sm-4 pull-right">
                                <input type="text" class="form-control" placeholder="Nhập email hoặc SĐT">
                                <span class="input-group-btn">
											<button class="btn btn-success" type="button">Tìm kiếm</button>
										</span>
                            </div>
                        </div>


                        <div class="row" style="margin-top: 20px;">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="profile-blog blog-border">
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
                                                <li><i class="fa fa-twitter"></i><a href="#">Retweet</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="profile-blog blog-border">
                                            <img class="rounded-x" src="assets/img/testimonials/img4.jpg" alt="">
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
                                                <li><i class="fa fa-twitter"></i><a href="#">Retweet</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="messages">

                    </div>
                </div>
            </div>
        </div>
        <!-- End Profile Content -->
    </div>
</div>




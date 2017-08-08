<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="breadcrumbs-v4">
    <div class="container">
        <span class="page-name">Sàn đấu giá</span>
        <h1>Danh sách <span class="shop-blue">Đấu giá hàng vận chuyển</span> </h1>
        <ul class="breadcrumb-v4-in">
            <li><a href="index.html">Trang chủ</a></li>
            <li class="active shop-blue">Sàn đấu giá</li>
        </ul>
    </div><!--/end container-->
</div>

<div class="container content profile">
    <div class="row">
        <!--Left Sidebar-->
        <div class="col-md-2 md-margin-bottom-40">

            <ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
                <%--<c:forEach var="item" items="${listGoods}">--%>
                    <%--<li class="list-group-item">--%>
                        <%--<a href="page_profile.html"><i class="fa"></i> ${item.filter}</a>--%>
                    <%--</li>--%>
                <%--</c:forEach>--%>
                    <li class="list-group-item active">
                        <a href="page_profile.html">Đang đấu giá</a>
                    </li>
                    <li class="list-group-item">
                        <a href="page_profile.html">Đã kết thúc</a>
                    </li>
                    <li class="list-group-item">
                        <a href="page_profile.html">Kết quả</a>
                    </li>
                    <li class="list-group-item">
                        <a href="page_profile.html">TOP Winner</a>
                    </li>
            </ul>

        </div>
        <!--End Left Sidebar-->

        <!-- Profile Content -->
        <div class="col-md-10">
            <div class="profile-body">
                <!--Service Block v3-->
                <!--Table Search v1-->
                <div class="table-search-v1 margin-bottom-20">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>Bắt đầu lúc</th>
                                <th>Giá mời thầu</th>
                                <th>Nội dung</th>
                                <th> <i class="color-green fa fa-map-marker"></i> Nơi đi - Nơi đến</th>
                                <th>Thời gian còn lại</th>
                                <th>Số lượt đấu giá</th>
                                <th>Mức giá hiện tại</th>
                                <th class="text-center">Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>04/08/2017 12:30</td>
                                <td><b style="font-size: 14px;color: #ff511d">2.000.000 đ</b></td>
                                <td>Cần chở hàng nông sản đi Long An</td>
                                <td>Hà Nội - Long An</td>
                                <td class="text-center"><b style="font-size: 14px;">4:38:20</b></td>
                                <td>5</td>
                                <td class="text-center"><b style="font-size: 14px;color: blue;">1.800.000 đ</b></td>
                                <td class="text-center"><i class="color-green fa fa-info-circle"></i></td>
                            </tr>
                            <tr>
                                <td>04/08/2017 12:30</td>
                                <td><b style="font-size: 14px;color: #ff511d">3.100.000 đ</b></td>
                                <td>Cần chở hàng phế liệu về Hà Nội</td>
                                <td>Hải Phòng - Hà Nội</td>
                                <td class="text-center"><b style="font-size: 14px;">2:33:40</b></td>
                                <td>3</td>
                                <td class="text-center"><b style="font-size: 14px;color: blue;">2.950.000 đ</b></td>
                                <td class="text-center"><i class="color-green fa fa-info-circle"></i></td>
                            </tr>
                            <tr>
                                <td>04/08/2017 12:30</td>
                                <td><b style="font-size: 14px;color: #ff511d">3.100.000 đ</b></td>
                                <td>Cần chở hàng phế liệu về Hà Nội</td>
                                <td>Hải Phòng - Hà Nội</td>
                                <td class="text-center"><b style="font-size: 14px;">2:33:40</b></td>
                                <td>3</td>
                                <td class="text-center">-</td>
                                <td class="text-center"><i class="color-green fa fa-info-circle"></i></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--End Table Search v1-->

            </div>
        </div>
        <!-- End Profile Content -->
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

 
<!-- Page Breadcrumb -->
              <div class="page-breadcrumbs">
                  <ul class="breadcrumb">
                      <li>
                          <i class="fa fa-home"></i>
                          <a href="#">Trang chủ</a>
                      </li>
                      <li>
                          <a href="#">Quản lý mẫu thiết bị</a>
                      </li>
                      <li class="active">Danh sách</li>
                  </ul>
              </div>
<!-- /Page Breadcrumb -->
<!-- Page Header -->
                <div class="page-header position-relative" style="display:none;">
                    <div class="header-title">
                        <h1>
                            Danh sách
                            <small>
                                <i class="fa fa-angle-right"></i>
                                Các mẫu thiết bị đã tạo trên hệ thống
                            </small>
                        </h1>
                    </div>
                    <!--Header Buttons-->
                    <div class="header-buttons">
                        <a class="sidebar-toggler" href="#">
                            <i class="fa fa-arrows-h"></i>
                        </a>
                        <a class="refresh" id="refresh-toggler" href="">
                            <i class="fa fa-refresh"></i>
                        </a>
                        <a class="fullscreen" id="fullscreen-toggler" href="#">
                            <i class="fa fa-expand"></i>
                        </a>
                    </div>
                    <!--Header Buttons End-->
                </div>
 <!-- /Page Header -->
<!-- Page Body -->
<div class="page-body">
<div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">Các mẫu thiết bị đã tạo</span>

                                    <div class="widget-buttons">
                                        <a href="#" data-toggle="maximize">
                                            <i class="fa fa-expand"></i>
                                        </a>
                                        <a href="#" data-toggle="collapse">
                                            <i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="widget-body">
								<select >
									<option value="1">Chọn hệ profile</option>									
								</select>
								<select >
									<option value="1">Chọn loại cửa</option>									
								</select>
								<select >
									<option value="1">Chọn số cánh</option>									
								</select>
								<select >
									<option value="1">Chọn hệ 1</option>									
								</select>
								<select >
									<option value="1">Chọn hệ 2</option>									
								</select>
								<select >
									<option value="1">Chọn hệ mở</option>									
								</select>
								
									<a href="javascript:void(0);" class="btn btn-azure pull-right">Thêm mới</a>
<hr/>
								
                                    <table class="table table-bordered table-hover" id="mau-cua-cuon-table" style="width:100% !important;">
                                        <thead>
                                            <tr>
                                            	<th>
                                                    
                                                </th>
                                                <th>
                                                    Ký hiệu
                                                </th>
                                                <th>
                                                    Ảnh đại diện
                                                </th>
                                                <th>
                                                    Hệ Profile
                                                </th>
                                                <th>
                                                    Cửa trượt/quay
                                                </th>
                                                <th>
                                                    Loại cửa
                                                </th>
                                                <th>
                                                    Số cánh
                                                </th>
                                                <th>
                                                    Hệ mở
                                                </th>
                                                <th>
                                                    Loại bản lề
                                                </th>
                                                <th>
                                                    Hệ số an toàn
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                           
                                        </tbody>
                                    </table>
									
                                </div>
                            </div>
                        </div>
                    </div>
</div>

<script src="/resources/js/device/DeviceManager.js"></script>
<script>
var deviceManager = new DeviceManager();
$(function () {
	deviceManager.init();
});

</script>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

 
<!-- Page Breadcrumb -->
              <div class="page-breadcrumbs">
                  <ul class="breadcrumb">
                      <li>
                          <i class="fa fa-home"></i>
                          <a href="/homepage">Trang chủ</a>
                      </li>
                      <li>
                          <a href="/list-device">Quản lý mẫu thiết bị</a>
                      </li>
                      <li class="active">Thêm mới</li>
                  </ul>
              </div>
<!-- /Page Breadcrumb -->

<!-- Page Body -->
<div class="page-body">
<div class="row">
                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                    <div class="well with-header">
                                        <div class="header bordered-sky">Nhập thông tin cửa </div>
                                        <div class="labels-container">
                                        	<div class="form-title">
                                                   Các thông số cơ bản
                                            </div>
                                            <div class=row>
	                                            <div class="form-group col-lg-2">
	                                                 <label>Ký hiệu</label>
	                                                 <input type="text" class="form-control input-sm" id="kyHieu" placeholder="Nhập ký hiệu">
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Ảnh đại diện</label>
	                                                 <input type="file" class="form-control input-sm" id="anhDaiDien" placeholder="Chọn ảnh đại diện">
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Hệ Profile</label>
	                                                 <select id="heProfile" class="form-control input-sm">
	                                                 	<option value="X6,X8" selected="selected">X6,X8</option>
	                                                 	<option value="X6">X6</option>
	                                                 	<option value="X8">X8</option>
	                                                 </select>
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Cửa trượt/quay</label>
	                                                 <select id="cuaTruotQuay" class="form-control input-sm">
	                                                 	<option value="Cửa trượt" selected>Cửa trượt</option>
	                                                 	<option value="Cửa quay" >Cửa quay</option>
	                                                 </select>
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Cửa sổ/cửa đi</label>
	                                                 <select id="loaiCua" class="form-control input-sm">
	                                                 	<option selected value="Cửa sổ">Cửa sổ</option>
	                                                 	<option value="Cửa đi">Cửa đi</option>
	                                                 </select>
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label >Hệ mở</label>
	                                                 <select id="heMo" class="form-control input-sm">
	                                                 	<option value="" selected>Chọn hệ mở</option>
	                                                 	<option value="Mở trong" >Mở trong</option>
	                                                 	<option value="Mở ngoài">Mở ngoài</option>
	                                                 	<option value="Mở hất">Mở hất</option>
	                                                 	<option value="Mở quay lật">Mở quay lật</option>
	                                                 </select>
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Số cánh</label>
	                                                 <select id="soCanh" class="form-control input-sm">
	                                                 	<option value="1" selected>Một cánh</option>
	                                                 	<option value="2">Hai cánh</option>
	                                                 </select>
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Chủng loại bản lề</label>
	                                                 <select id="loaiBanLe" class="form-control input-sm">
	                                                 	<option value="" selected>Chọn loại bản lề</option>
	                                                 	<option value="Select" >Select</option>
	                                                 	<option value="Concept">Concept</option>
	                                                 	<option value="PADK">PADK</option>
	                                                 </select>
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Hệ số an toàn</label>
	                                                 <select id="heSoAnToan" class="form-control input-sm">
	                                                 	<option value="" selected>Chọn hệ số an toàn</option>
	                                                 	<option value="Economy">Economy</option>
	                                                 	<option value="Basic">Basic</option>
	                                                 	<option value="Advance">Advance</option>
	                                                 </select>
	                                            </div>
	                                            
                                            </div>
                                            
                                        </div>
                                        <hr class="wide">
                                        
                                        <!-- THANH DA DIEM -->
                                        <div class="Badges-container">
                                            <div class="form-title">
                                                   Thanh đa điểm 
                                            </div>
                                            <div class="row" style="margin-right:0px;margin-left:0px;">
                                            	 <a style="margin-bottom:10px;" id="addThanhDaDiem_PhuKienBtn" href="javascript:void(0);" class="btn btn-default">Thêm phụ kiện</a>
                                            	&nbsp (Nhân <select id="addThanhDaDiem_PhuKienSelectBox"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option></select> lần tất cả phụ kiện)
												<table class="table table-bordered table-hover"
													id="table-thanh-da-diem" style="width: 100% !important;">
													<thead>
														<tr>
															<th style="width: 10%">Code</th>
															<th style="width: 15%">Article</th>
															<th style="width: 15%">Note</th>
															<!-- <th style="width: 10%">Số lượng</th> -->
															<th style="width: 10%">Giá order (€)</th>
															<th style="width: 15%">Giá về Việt Nam (VNĐ)</th>
															<!-- <th style="width: 15%">Tổng giá vốn TP</th> -->
															<th style="width: 15%"
																class="sorting_disabled col-lg-5 col-md-5 col-xs-5"
																rowspan="1" colspan="1"></th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
                                        </div>
                                        <hr class="wide">
                                        
                                        
                                         <!-- THANH NOI CHIEU NGANG -->
                                        <div class="Badges-container">
                                            <div class="form-title">
                                                   Thanh nối chiều ngang (Chiều rộng)
                                            </div>
                                            <div class="row" style="margin-right:0px;margin-left:0px;">
                                            	 <a style="margin-bottom:10px;" id="addThanhChieuNgang_PhuKienBtn" href="javascript:void(0);" class="btn btn-default">Thêm phụ kiện</a>
												&nbsp (Nhân <select id="addThanhChieuNgang_PhuKienSelectBox"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option></select> lần tất cả phụ kiện)
												<table class="table table-bordered table-hover"
													id="table-thanh-chieu-ngang" style="width: 100% !important;">
													<thead>
														<tr>
															<th style="width: 10%">Code</th>
															<th style="width: 15%">Article</th>
															<th style="width: 15%">Note</th>
															<!-- <th style="width: 10%">Số lượng</th> -->
															<th style="width: 10%">Giá order (€)</th>
															<th style="width: 15%">Giá về Việt Nam (VNĐ)</th>
															<!-- <th style="width: 15%">Tổng giá vốn TP</th> -->
															<th style="width: 15%"
																class="sorting_disabled col-lg-5 col-md-5 col-xs-5"
																rowspan="1" colspan="1"></th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
                                        </div>
                                        <hr class="wide">
                                        
                                         <!-- THANH NOI CHIEU DOC -->
                                        <div class="Badges-container">
                                            <div class="form-title">
                                                   Thanh nối chiều dọc (Chiều cao)
                                            </div>
                                            <div class="row" style="margin-right:0px;margin-left:0px;">
                                            	 <a style="margin-bottom:10px;" id="addThanhChieuDoc_PhuKienBtn" href="javascript:void(0);" class="btn btn-default">Thêm phụ kiện</a>
												&nbsp (Nhân <select id="addThanhChieuDoc_PhuKienSelectBox"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option></select> lần tất cả phụ kiện)
												<table class="table table-bordered table-hover"
													id="table-thanh-chieu-doc" style="width: 100% !important;">
													<thead>
														<tr>
															<th style="width: 10%">Code</th>
															<th style="width: 15%">Article</th>
															<th style="width: 15%">Note</th>
															<!-- <th style="width: 10%">Số lượng</th> -->
															<th style="width: 10%">Giá order (€)</th>
															<th style="width: 15%">Giá về Việt Nam (VNĐ)</th>
															<!-- <th style="width: 15%">Tổng giá vốn TP</th> -->
															<th style="width: 15%"
																class="sorting_disabled col-lg-5 col-md-5 col-xs-5"
																rowspan="1" colspan="1"></th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
                                        </div>
                                        <hr class="wide">
                                        
                                        <!-- Klemon -->
                                        <div class="Badges-container">
                                            <div class="form-title">
                                                  Klemon
                                            </div>
                                            <div class="row" style="margin-right:0px;margin-left:0px;">
                                            	 <a style="margin-bottom:10px;" id="addKlemon_PhuKienBtn" href="javascript:void(0);" class="btn btn-default">Thêm phụ kiện</a>
												&nbsp (Nhân <select id="addKlemon_PhuKienSelectBox"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option></select> lần tất cả phụ kiện)
												<table class="table table-bordered table-hover"
													id="table-klemon" style="width: 100% !important;">
													<thead>
														<tr>
															<th style="width: 10%">Code</th>
															<th style="width: 15%">Article</th>
															<th style="width: 15%">Note</th>
															<!-- <th style="width: 10%">Số lượng</th> -->
															<th style="width: 10%">Giá order (€)</th>
															<th style="width: 15%">Giá về Việt Nam (VNĐ)</th>
															<!-- <th style="width: 15%">Tổng giá vốn TP</th> -->
															<th style="width: 15%"
																class="sorting_disabled col-lg-5 col-md-5 col-xs-5"
																rowspan="1" colspan="1"></th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
                                        </div>
                                        <hr class="wide">
                                        
                                        <div class="Badges-container">
                                            <div class="form-title">
                                                  Bản lề Concept
                                            </div>
                                            <div class="row" style="margin-right:0px;margin-left:0px;">
                                            	 <a style="margin-bottom:10px;" id="addBanLeConcept_PhuKienBtn" href="javascript:void(0);" class="btn btn-default">Thêm phụ kiện</a>
												<table class="table table-bordered table-hover"
													id="table-ban-le-concept" style="width: 100% !important;">
													<thead>
														<tr>
															<th>Code</th>
															<th>Article</th>
															<th>Note</th>
															<th>Số lượng</th>
															<th>Chiều tay nắm</th>
															<th>Giá order (€)</th>
															<th>Giá về Việt Nam (VNĐ)</th>
															<th class="sorting_disabled col-lg-5 col-md-5 col-xs-5" rowspan="1" colspan="1"></th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
                                        </div>
                                        <hr class="wide">
                                        
                                        <div class="Badges-container" style="display:none;">
                                            <div class="form-title">
                                                 Các phụ kiện có thể có khác
                                            </div>
                                            <div class="row" style="margin-right:0px;margin-left:0px;">
                                            	 <a style="margin-bottom:10px;" id="addPhuKienOptional_PhuKienBtn" href="javascript:void(0);" class="btn btn-default">Thêm phụ kiện</a>
												<table class="table table-bordered table-hover"
													id="table-phu-kien-optional" style="width: 100% !important;">
													<thead>
														<tr>
															<th>Code</th>
															<th>Article</th>
															<th>Note</th>
															<th>Số lượng</th>
															<th>Chiều tay nắm</th>
															<th>Giá order (€)</th>
															<th>Giá về Việt Nam (VNĐ)</th>
															<th class="sorting_disabled col-lg-5 col-md-5 col-xs-5" rowspan="1" colspan="1"></th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
                                        </div>
                                        <hr class="wide">
                                        
                                        <div class="Badges-container">
                                            <div class="form-title">
                                                 Các phụ kiện khác
                                            </div>
                                            <div class="row" style="margin-right:0px;margin-left:0px;">
                                            	 <a style="margin-bottom:10px;" id="addPhuKienRequired_PhuKienBtn" href="javascript:void(0);" class="btn btn-default">Thêm phụ kiện</a>
												<table class="table table-bordered table-hover"
													id="table-phu-kien-required" style="width: 100% !important;">
													<thead>
														<tr>
															<th>Code</th>
															<th>Article</th>
															<th>Note</th>
															<th>Số lượng</th>
															<th>Chiều tay nắm</th>
															<th>Giá order (€)</th>
															<th>Giá về Việt Nam (VNĐ)</th>
															<th class="sorting_disabled col-lg-5 col-md-5 col-xs-5" rowspan="1" colspan="1"></th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
                                        </div>
                                        
                                        <div class="Badges-container">
                                            <div class="form-title">
                                                 Nhập vấu
                                            </div>
                                            <div class="row">
                                            	<div class="form-group col-lg-2">
	                                                 <label>Code</label>
	                                                 <input type="text" class="form-control input-sm" id="vauCode" placeholder="Nhập Code">
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Article</label>
	                                                 <input type="text" class="form-control input-sm" id="vauArticle" placeholder="Nhập Article">
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Note</label>
	                                                 <input type="text" class="form-control input-sm" id="vauNote" placeholder="Nhập Note">
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Giá Order</label>
	                                                 <input type="number" class="form-control input-sm" id="vauGiaOrder" placeholder="Nhập giá order">
	                                            </div>
	                                            
	                                            <div class="form-group col-lg-2">
	                                                 <label>Giá về Việt Nam</label>
	                                                 <input type="number" class="form-control input-sm" id="vauGiaVeVietNam" placeholder="Nhập Article">
	                                            </div>
											</div>
                                        </div>
                                        
                                       <br/>
                                    <a href="javascript:void(0);" id="saveDeviceId" class="btn btn-primary">Lưu thông tin</a>
                                    </div>
                        </div>
                    </div>
</div>

<script src="/resources/js/device/AddDeviceManager.js"></script>
<script>
$("#sidebar").toggleClass("hide");
var addDeviceManager = new AddDeviceManager();
$(function () {
	addDeviceManager.init();
});

</script>
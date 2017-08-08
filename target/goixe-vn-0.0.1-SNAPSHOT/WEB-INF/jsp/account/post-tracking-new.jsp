<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="col-md-9" id="post-trucking-new">
	<div class="sky-form">
		<header>Thông tin đăng ký xe tìm hàng</header>
		<fieldset>
			<div class="row">
				<section clas="col col-12" style="padding-left: 15px; padding-right: 15px">
					<label class="textarea">
						<h4>Nhập biển số xe (Vd: 51C-123.45, 51C-123.46, ..., tối đa 05 xe / tin)</h4>
						<textarea id="plateNumberList" rows="2" name="comment" placeholder="Nhập biển số xe, ngăn cách nhau bởi dấu phẩy (,)"></textarea>
					</label>
				</section>
				<section class="col col-6">
					<h4>Loại xe</h4>
					<label class="select">
						<i class="icon-append"></i>
						<select name="" id="truckType">
							<option value="-1" selected="">Loại xe</option>
						</select>
					</label>
				</section>
				<section class="col col-6">
					<h4>Loại hàng chở</h4>
					<label class="select">
						<i class="icon-append fa fa-truck"></i>
						<select name="" id="goodsType">
							<option value="-1" selected="" disabled="">Loại hàng chở</option>
						</select>
					</label>
				</section>
			</div>
			<div class="row">
				<section class="col col-6">
					<h4>Khối lượng nhận chở (*)</h4>
					<label class="input">
						<i class="icon-append fa fa-cubes"></i>
						<input id="weight" type="email" name="email" placeholder="Nhập khối lượng nhận chở">
					</label>
				</section>
				<section class="col col-6">
					<h4>Đơn vị khối lượng (*)</h4>
					<label class="select">
						<i class="icon-append fa fa-truck"></i>
						<select name="" id="weightUnit">
							<option value="-1" selected="selected">Tải trọng</option>
							<option value="1" >Tấn</option>
							<option value="2" >Khối</option>
							<option value="3" >Kg</option>
						</select>
					</label>
				</section>
			</div>
		</fieldset>

		<fieldset>
			<div class="row">
				<section class="col col-6">
					<h4>Nơi đi</h4>
					<label class="select">
						<select name="budget" id="fromAddress">
							<option value="-1" selected="selected">Nơi đi</option>
						</select>
					</label>
				</section>
				<section class="col col-6">
					<h4>Nơi đến</h4>
					<label class="select">
						<select name="budget" id="toAddress">
							<option value="-1" selected="selected">Nơi đến</option>
						</select>
						<i></i>
					</label>
				</section>
			</div>
			<div class="row">
				<section class="col col-6">
					<label class="textarea">
						<h4>Địa chỉ nơi đi</h4>
						<textarea id="fromDetailAddress" rows="2" name="comment" placeholder="Nhập địa chỉ đi"></textarea>
					</label>
				</section>
				<section class="col col-6">
					<section clas="col col-12">
					<label class="textarea">
						<h4>Địa chỉ nơi đến</h4>
						<textarea id="toDetailAddress" rows="2" name="comment" placeholder="Nhập địa chỉ đến"></textarea>
					</label>
				</section>
			</div>
		</fieldset>
		<fieldset>
			<div class="row">
				<section class="col col-6">
					<h4>Ngày đi (*)</h4>
					<label class="input">
						<i class="icon-append fa fa-calendar"></i>
						<input id="startDate" type="text" name="start" id="start" placeholder="Chọn ngày đi" class="hasDatepicker">
					</label>
				</section>
				<section class="col col-6">
					<h4>Ngày hết hiệu lực (*)</h4>
					<label class="input">
						<i class="icon-append fa fa-calendar"></i>
						<input id="expiredDate" type="text" name="finish" id="finish" placeholder="Chọn ngày hết hiệu lực" class="hasDatepicker">
					</label>
				</section>
			</div>
			<div class="row">
				<section class="col col-6">
					<h4>Quãng đường (Số km của chuyến xe)</h4>
					<label class="input">
						<i class="icon-append fa fa-edit"></i>
						<input id="roadLength" type="email" name="email" placeholder="Số km của chuyến xe">
					</label>
				</section>
				<section class="col col-6">
					<h4>Đại lý tư vấn</h4>
					<label class="select">
						<i class="icon-append fa fa-truck"></i>
						<select name="" id="agency">
							<option value="-1" selected="selected">Đại lý tư vấn</option>
							<option value="1" selected="selected">Tư vấn 01</option>
							<option value="2" selected="selected">Tư vấn 02</option>
							<option value="3" selected="selected">Kiểm duyệt 01</option>
							<option value="4" selected="selected">Kiểm duyệt 02</option>
						</select>
					</label>
				</section>
			</div>
			<div class="row">
				<section class="col col-6">
					<h4>Giá</h4>
					<label class="input">
						<i class="icon-append fa fa-dollar"></i>
						<input id="price" type="email" name="email" placeholder="Giá tiền">
					</label>
				</section>
				<section class="col col-6">
					<h4>Đơn vị giá</h4>
					<label class="select">
						<select id="priceUnit" name="budget">
							<option value="-1" selected="selected">Đơn vị giá</option>
							<option value="1">Tấn</option>
							<option value="2">Khối</option>
							<option value="3">Khối/km</option>
							<option value="4">Chuyến</option>
						</select>
						<i></i>
					</label>
				</section>
			</div>
			<section clas="col col-12">
				<label class="textarea">
					<h4>Nhập mô tả</h4>
					<textarea id="description" rows="5" name="comment" placeholder="Nhập mô tả"></textarea>
				</label>
			</section>
			<section>
				<label class="label">Nhập mã bảo vệ:</label>
				<label class="input input-captcha">
					<img src="" width="100" height="32" alt="Captcha image">
					<input id="captcha" type="text" maxlength="6" name="captcha" id="captcha">
				</label>
			</section>
		</fieldset>
		<fieldset style="padding-top: 0px; border-top-width: 0px; margin-top: -30px;">
			<div class="row">
				<div class="col-lg-offset-3 col-lg-2" style="text-align: center">
					<label>&nbsp</label>
					<button id="addPostBtn" class="btn rounded btn-primary btn-u-sm form-control" type="button"><i class="fa fa-search"></i>Đăng tin</button>
				</div>
				<div class="col-lg-2" style="text-align: center">
					<label>&nbsp</label>
					<button id="clearPostBtn" class="btn rounded btn-primary btn-u-sm form-control" type="button"><i class="fa fa-search"></i>Nhập lại</button>
				</div>
				<div class="col-lg-2" style="text-align: center">
					<label>&nbsp</label>
					<button id="backPostBtn" class="btn rounded btn-primary btn-u-sm form-control" type="button"><i class="fa fa-search"></i>Quay lại</button>
				</div>
			</div>
		</fieldset>
	</div>
</div>
<script src="/resources/js/trucking/TruckingPost.js"></script>
<script>
	var manager = new TruckingPost();
	$(function () {
		manager.init();
	});
</script>

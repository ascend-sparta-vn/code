<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS Page Style -->
<link rel="stylesheet" href="resources/css/pages/page_job.css">
<link rel="stylesheet" href="resources/plugins/image-hover/css/img-hover.css">
<script type="text/javascript" src="resources/plugins/image-hover/js/touch.js"></script>
<script type="text/javascript" src="resources/plugins/image-hover/js/modernizr.js"></script>

 <div class="slider-inner">
			<div id="da-slider" class="da-slider">
				<div class="da-slide da-slide-current">
					<h2><i><spring:message code="banner1.line1.text"/> </i> <br> <i><spring:message code="banner1.line2.text"/></i> <br> <i><spring:message code="banner1.line3.text"/></i></h2>
					<p><i><spring:message code="banner1.subline1.text"/> </i> <br> <i><spring:message code="banner1.subline2.text"/></i> <br> <i><spring:message code="banner1.subline3.text"/></i></p>
					<div class="da-img"><img class="img-responsive" src="/resources/plugins/parallax-slider/img/banner1.png" alt=""></div>
				</div>
				<div class="da-slide">
					<h2><i><spring:message code="banner2.line1.text"/></i> <br> <i> <spring:message code="banner2.line2.text"/></i> <br> <i>  <spring:message code="banner2.line3.text"/></i></h2>
					<p><i><spring:message code="banner2.subline1.text"/></i> <br> <i><spring:message code="banner2.subline2.text"/></i> <br/><i><spring:message code="banner2.subline3.text"/></i></p>
					<div class="da-img">
						<img class="img-responsive" src="/resources/plugins/parallax-slider/img/banner2.png" alt="">
					</div>
				</div>
				<div class="da-slide">
					<h2><i><spring:message code="banner3.line1.text"/></i> <br> <i><spring:message code="banner3.line2.text"/></i> <br> <i><spring:message code="banner3.line3.text"/></i></h2>
					<p><i><spring:message code="banner3.subline1.text"/></i> <br> <i><spring:message code="banner3.subline2.text"/></i> <br> <i> <spring:message code="banner3.subline3.text"/></i></p>
					<div class="da-img"><img src="/resources/plugins/parallax-slider/img/banner3.png" alt="image01"></div>
				</div>
				<div class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</div>
			<nav class="da-dots"><span class="da-dots-current"></span><span></span><span></span></nav></div>
		</div>
		
		<div class="container content">
			<!-- Job Content -->
			<div class="headline"><h2>Hàng cần vận chuyển</h2></div>
			<div class="row job-content margin-bottom-40">
				<div class="col-md-3 col-sm-3 md-margin-bottom-40">
					<h3 class="heading-md"><strong>Nơi đi</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Hà Nội</a> <small class="hex">(142)</small></li>
						<li><a href="#">Hải Phòng</a> <small class="hex">(80)</small></li>
						<li><a href="#">Quảng Ninh</a> <small class="hex">(66)</small></li>
						<li><a href="#">Thành Phố HCM</a> <small class="hex">(20)</small></li>
						<li><a href="#">Tất cả</a> <small class="hex">(1000)</small></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3 md-margin-bottom-40">
					<h3 class="heading-md"><strong>Nơi đến</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Hà Nội</a> <small class="hex">(54)</small></li>
						<li><a href="#">Bình Dương</a> <small class="hex">(40)</small></li>
						<li><a href="#">Quảng Ninh</a> <small class="hex">(34)</small></li>
						<li><a href="#">Long An</a> <small class="hex">(22)</small></li>
						<li><a href="#">Tất cả</a> <small class="hex">(1000)</small></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3 md-margin-bottom-40">
					<h3 class="heading-md"><strong>Loại hàng hóa</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Hàng dân dụng</a> <small class="hex">(100)</small></li>
						<li><a href="#">Hàng điện lạnh</a> <small class="hex">(82)</small></li>
						<li><a href="#">Hàng thủy sản</a> <small class="hex">(42)</small></li>
						<li><a href="#">Đồ gỗ</a> <small class="hex">(30)</small></li>
						<li><a href="#">Đồ nông nghiệp</a> <small class="hex">(14)</small></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3">
					<h3 class="heading-md"><strong>Khối lượng hàng</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Trên 20 tấn</a> <small class="hex">(10)</small></li>
						<li><a href="#">Từ 10 - 20 tấn</a> <small class="hex">(54)</small></li>
						<li><a href="#">Từ 5 - 10 tấn</a> <small class="hex">(42)</small></li>
						<li><a href="#">Từ 1 - 5 tấn</a> <small class="hex">(34)</small></li>
						<li><a href="#">Dưới 1 tấn</a> <small class="hex">(22)</small></li>
					</ul>
				</div>
			</div>
			<!-- End Job Content -->
			
			<!-- Job Content -->
			<div class="headline"><h2>Xe đang tìm hàng</h2></div>
			<div class="row job-content margin-bottom-40">
				<div class="col-md-3 col-sm-3 md-margin-bottom-40">
					<h3 class="heading-md"><strong>Nơi đi</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Hà Nội</a> <small class="hex">(142)</small></li>
						<li><a href="#">Hải Phòng</a> <small class="hex">(80)</small></li>
						<li><a href="#">Quảng Ninh</a> <small class="hex">(66)</small></li>
						<li><a href="#">Thành Phố HCM</a> <small class="hex">(20)</small></li>
						<li><a href="#">Cần Thơ</a> <small class="hex">(10)</small></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3 md-margin-bottom-40">
					<h3 class="heading-md"><strong>Nơi đến</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Hà Nội</a> <small class="hex">(54)</small></li>
						<li><a href="#">Bình Dương</a> <small class="hex">(40)</small></li>
						<li><a href="#">Quảng Ninh</a> <small class="hex">(34)</small></li>
						<li><a href="#">Long An</a> <small class="hex">(22)</small></li>
						<li><a href="#">Đà Nẵng</a> <small class="hex">(5)</small></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3 md-margin-bottom-40">
					<h3 class="heading-md"><strong>Loại hàng hóa</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Hàng dân dụng</a> <small class="hex">(100)</small></li>
						<li><a href="#">Hàng điện lạnh</a> <small class="hex">(82)</small></li>
						<li><a href="#">Hàng thủy sản</a> <small class="hex">(42)</small></li>
						<li><a href="#">Đồ gỗ</a> <small class="hex">(30)</small></li>
						<li><a href="#">Đồ nông nghiệp</a> <small class="hex">(14)</small></li>
					</ul>
				</div>
				<div class="col-md-3 col-sm-3">
					<h3 class="heading-md"><strong>Khối lượng hàng</strong></h3>
					<ul class="list-unstyled categories">
						<li><a href="#">Trên 20 tấn</a> <small class="hex">(10)</small></li>
						<li><a href="#">Từ 10 - 20 tấn</a> <small class="hex">(54)</small></li>
						<li><a href="#">Từ 5 - 10 tấn</a> <small class="hex">(42)</small></li>
						<li><a href="#">Từ 1 - 5 tấn</a> <small class="hex">(34)</small></li>
						<li><a href="#">Dưới 1 tấn</a> <small class="hex">(22)</small></li>
					</ul>
				</div>
			</div>
			<!-- End Job Content -->

			<!--=== Job Team ===-->
		<div class="parallax-team parallaxBg">
			<div class="container content">
				<div class="title-box-v2">
					<h2>Mang lại <span class="color-green">Giá trị</span> lớn nhất cho khách hàng</h2>
					<p>Sàn giao dịch vận tải goixe.vn là cầu nối giữa lái xe và chủ hàng. Hàng hóa luôn được vận chuyển nhanh chóng, an toàn và tiện lợi </p>
				</div>

				<div class="row">
					<!-- Team v2 -->
					<div class="col-md-3 col-sm-6">
						<div class="team-v2">
							<img class="img-responsive" src="/resources/img/team/img-v1.jpg" alt="" />
							<div class="inner-team">
								<h3>Nguyễn Hoài Nam</h3>
								<small class="color-green">Lái xe (30 tuổi)</small>
								<p>Sử dụng website goixe.vn để tìm kiếm các nguồn hàng, tôi luôn chủ động được các chuyến xe của mình.</p>
								<hr>
								<ul class="list-inline team-social">
									<li>
										<a data-placement="top" data-toggle="tooltip" class="fb tooltips" data-original-title="Facebook" href="#">
											<i class="fa fa-facebook"></i>
										</a>
									</li>
									<li>
										<a data-placement="top" data-toggle="tooltip" class="tw tooltips" data-original-title="Twitter" href="#">
											<i class="fa fa-twitter"></i>
										</a>
									</li>
									<li>
										<a data-placement="top" data-toggle="tooltip" class="gp tooltips" data-original-title="Google plus" href="#">
											<i class="fa fa-google-plus"></i>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Team v2 -->

					<!-- Team v2 -->
					<div class="col-md-3 col-sm-6">
						<div class="team-v2">
							<img class="img-responsive" src="/resources/img/team/img-v1.jpg" alt="" />
							<div class="inner-team">
								<h3>Nguyễn Hà Linh</h3>
								<small class="color-green">Chủ hàng (40 tuổi)</small>
								<p>Đăng tin tìm người trở hàng trên goixe.vn giúp tôi tìm được lái xe tin cậy và giá cả cạnh tranh</p>
								<hr>
								<ul class="list-inline team-social">
									<li><a data-placement="top" data-toggle="tooltip" class="fb tooltips" data-original-title="Facebook" href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a data-placement="top" data-toggle="tooltip" class="tw tooltips" data-original-title="Twitter" href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a data-placement="top" data-toggle="tooltip" class="gp tooltips" data-original-title="Google plus" href="#"><i class="fa fa-google-plus"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Team v2 -->

					<!-- Team v2 -->
					<div class="col-md-3 col-sm-6">
						<div class="team-v2">
							<img class="img-responsive" src="/resources/img/team/img-v1.jpg" alt="" />
							<div class="inner-team">
								<h3>Trần Văn Chiến</h3>
								<small class="color-green">Giám đốc doanh nghiệp vận tải VPP</small>
								<p>Là đối tác thường xuyên của goixe.vn, giúp công ty vận tải tìm được nhiều khách hàng tiềm năng</p>
								<hr>
								<ul class="list-inline team-social">
									<li>
										<a data-placement="top" data-toggle="tooltip" class="fb tooltips" data-original-title="Facebook" href="#">
											<i class="fa fa-facebook"></i>
										</a>
									</li>
									<li>
										<a data-placement="top" data-toggle="tooltip" class="tw tooltips" data-original-title="Twitter" href="#">
											<i class="fa fa-twitter"></i>
										</a>
									</li>
									<li>
										<a data-placement="top" data-toggle="tooltip" class="gp tooltips" data-original-title="Google plus" href="#">
											<i class="fa fa-google-plus"></i>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Team v2 -->

					<!-- Team v2 -->
					<div class="col-md-3 col-sm-6">
						<div class="team-v2">
							<img class="img-responsive" src="/resources/img/team/img-v1.jpg" alt="" />
							<div class="inner-team">
								<h3>Phạm Xuân Trường</h3>
								<small class="color-green">Lái xe (24 tuổi)</small>
								<p>Đơn giản dễ sử dụng, Tôi sử dụng website được 2 tháng và trở được rất nhiều đơn hàng qua trang web</p>
								<hr>
								<ul class="list-inline team-social">
									<li>
										<a data-placement="top" data-toggle="tooltip" class="fb tooltips" data-original-title="Facebook" href="#">
											<i class="fa fa-facebook"></i></a>
										</li>
										<li>
											<a data-placement="top" data-toggle="tooltip" class="tw tooltips" data-original-title="Twitter" href="#">
												<i class="fa fa-twitter"></i>
											</a>
										</li>
										<li>
											<a data-placement="top" data-toggle="tooltip" class="gp tooltips" data-original-title="Google plus" href="#">
												<i class="fa fa-google-plus"></i>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- End Team v2 -->
				</div>
			</div>
		</div>
		<!--=== End Job Team ===-->
		
		<!--=== Job Partners ===-->
		<div class="container content job-partners">
			<div class="title-box-v2">
				<h2><span class="color-blue">Khách hàng</span> thường xuyên của sàn giao dịch</h2>
				<p>Danh sách các khách hàng công ty, doanh nghiệp thành viên tham gia vào hệ thống, là đối tác thường xuyên và tin cậy của <span class="color-blue">goixe.vn</span></p>
			</div>

			<ul class="list-inline our-clients" id="effect-2">
				<li>
					<figure>
						<img src="/resources/img/clients2/ea-canada.png" alt="">
						<div class="img-hover">
							<h4>Ea Canada</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/inspiring.png" alt="">
						<div class="img-hover">
							<h4>Inspiring</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/ucweb.png" alt="">
						<div class="img-hover">
							<h4>UcWeb</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/clarks.png" alt="">
						<div class="img-hover">
							<h4>Clarks</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/corepreserves.png" alt="">
						<div class="img-hover">
							<h4>Core Preserves</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/finals.png" alt="">
						<div class="img-hover">
							<h4>USL Champions</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/getaround.png" alt="">
						<div class="img-hover">
							<h4>GetAround</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/baderbrau.png" alt="">
						<div class="img-hover">
							<h4>Baderbrau</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/emirates.png" alt="">
						<div class="img-hover">
							<h4>Emirates</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/fddw.png" alt="">
						<div class="img-hover">
							<h4>Field Days</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/district-karaoke.png" alt="">
						<div class="img-hover">
							<h4>District Karaoke</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/marianos.png" alt="">
						<div class="img-hover">
							<h4>Mariano's</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/grifting-tree.png" alt="">
						<div class="img-hover">
							<h4>The Grifting Tree</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/jaguar.png" alt="">
						<div class="img-hover">
							<h4>Jaguar</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/hermes.png" alt="">
						<div class="img-hover">
							<h4>Hermes</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/starbucks.png" alt="">
						<div class="img-hover">
							<h4>Starbucks</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/national-geographic.png" alt="">
						<div class="img-hover">
							<h4>National Geographic</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/much-more.png" alt="">
						<div class="img-hover">
							<h4>Much More</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/hotiron.png" alt="">
						<div class="img-hover">
							<h4>Hotiron</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/fred-perry.png" alt="">
						<div class="img-hover">
							<h4>Fred Perry</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/bellfield.png" alt="">
						<div class="img-hover">
							<h4>Bellfield</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/getapp.png" alt="">
						<div class="img-hover">
							<h4>GetApp</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/austrian-airlines.png" alt="">
						<div class="img-hover">
							<h4>Austrian Airlines</h4>
						</div>
					</figure>
				</li>
				<li>
					<figure>
						<img src="/resources/img/clients2/general-electric.png" alt="">
						<div class="img-hover">
							<h4>General Electronic</h4>
						</div>
					</figure>
				</li>
			</ul>
		</div><!--/container-->
		<!--=== End Job Partners ===-->
			
		</div>
<script>
$(function () {
	$("li .active").removeClass("active");
	$("#menu1").addClass("active");
});

</script>
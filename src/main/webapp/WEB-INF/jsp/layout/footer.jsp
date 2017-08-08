<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="footer-default" class="footer-default">
			<div class="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-4 md-margin-bottom-40">
							<!-- About -->
							<div class="headline"><h2><spring:message code="footer.about.label"/></h2></div>
							<p class="margin-bottom-25 md-margin-bottom-40"><spring:message code="footer.about.content"/></p>
							<!-- End About -->

							<!-- Monthly Newsletter -->
							<div class="headline"><h2><spring:message code="footer.subscriber.label"/></h2></div>
							<p><spring:message code="footer.subscriber.content"/></p>
							<form class="footer-subscribe">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="<spring:message code="footer.subscriber.email"/>">
									<span class="input-group-btn">
										<button class="btn-u" type="button"><spring:message code="footer.subscriber.btn"/></button>
									</span>
								</div>
							</form>
							<!-- End Monthly Newsletter -->
						</div><!--/col-md-4-->

						<div class="col-md-4 md-margin-bottom-40">
							<!-- Recent Blogs -->
							<div class="posts">
								<div class="headline"><h2><spring:message code="footer.news.label"/></h2></div>
								<dl class="dl-horizontal">
									<dt><a href="#"><img src="/resources/img/sliders/elastislide/baomoi.png" alt=""></a></dt>
									<dd>
										<p><a href="http://www.baogiaothong.vn/san-giao-dich-van-tai-dau-tien-hoat-dong-the-nao-d129112.html">Sàn giao dịch vận tải goixe.vn chính thức tham gia vào hệ thống vận tải</a></p>
									</dd>
								</dl>
								<dl class="dl-horizontal">
									<dt><a href="#"><img src="/resources/img/sliders/elastislide/vietnamnet.png" alt=""></a></dt>
									<dd>
										<p><a href="http://www.mt.gov.vn/vn/tin-tuc/41084/phoi-hop-chi-dao-de-khai-thac-san-giao-dich-van-tai-gop-phan-nang-cao-hieu-qua-trong-hoat-dong-van-tai-hang-hoa.aspx">Phối hợp chỉ đạo để khai thác Sàn giao dịch vận tải góp phần nâng cao hiệu quả trong hoạt động vận tải hàng hóa</a></p>
									</dd>
								</dl>
								<dl class="dl-horizontal">
									<dt><a href="#"><img src="/resources/img/sliders/elastislide/vnexpress.png" alt=""></a></dt>
									<dd>
										<p><a href="#">Lợi ích lớn cho các doanh nghiệp khi tham gia sàn giao dịch vận tải</a></p>
									</dd>
								</dl>
							</div>
							<!-- End Recent Blogs -->
						</div><!--/col-md-4-->

						<div class="col-md-4">
							<!-- Contact Us -->
							<div class="headline"><h2><spring:message code="footer.contact.label"/></h2></div>
							<address class="md-margin-bottom-40">
								<spring:message code="footer.contact.line1"/>  <br>
								<spring:message code="footer.contact.line2"/> <br>
								<spring:message code="footer.contact.line3"/> <br>
								Email: <a href="mailto:info@goixe.vn" class="">info@goixe.vn</a>
							</address>
							<!-- End Contact Us -->

							<!-- Social Links -->
							<div class="headline"><h2><spring:message code="footer.link.label"/></h2></div>
							<ul class="social-icons">
								<li><a href="javascript:void(0)" data-original-title="Feed" class="social_rss"></a></li>
								<li><a href="javascript:void(0)" data-original-title="Facebook" class="social_facebook"></a></li>
								<li><a href="javascript:void(0)" data-original-title="Twitter" class="social_twitter"></a></li>
								<li><a href="javascript:void(0)" data-original-title="Goole Plus" class="social_googleplus"></a></li>
								<li><a href="javascript:void(0)" data-original-title="Pinterest" class="social_pintrest"></a></li>
								<li><a href="javascript:void(0)" data-original-title="Linkedin" class="social_linkedin"></a></li>
								<li><a href="javascript:void(0)" data-original-title="Vimeo" class="social_vimeo"></a></li>
							</ul>
							<!-- End Social Links -->
						</div><!--/col-md-4-->
					</div>
				</div>
			</div><!--/footer-->

			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<p>
								2016 © Goixe.vn - All Rights Reserved.
								<a href="javascript:void(0)">Privacy Policy</a> | <a href="javascript:void(0)">Terms of Service</a>
							</p>
						</div>
						<div class="col-md-6">
							<a href="index.html">
								<img class="pull-right" id="logo-footer" src="/resources/img/logo_goixe.png" alt="">
							</a>
						</div>
					</div>
				</div>
			</div><!--/copyright-->
		</div>
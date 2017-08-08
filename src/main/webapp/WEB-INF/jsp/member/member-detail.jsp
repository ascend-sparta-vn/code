<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="/resources/plugins/datepicker/datepicker.css" rel="stylesheet" />


<div class="breadcrumbs">
			<div class="container">
				<h1 class="pull-left">Chi tiết thông tin chủ hàng</h1>
				<ul class="pull-right breadcrumb">
					<li><a href="/">Trang chủ</a></li>
					<li class="active"><a href="#">Chi tiết chủ hàng</a></li>
				</ul>
			</div>
		</div>

<div class="container ">
	<!-- Begin Table -->
	<div class="table-search-v1">
		<div class="table-responsive panel panel-green margin-bottom-20">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-gear"></i>Chi tiết thành viên chủ xe
				</h3>
			</div>
			<table class="table table-bordered table-striped" id="truckingDetailTable">
				<tbody>
					<tr>
						<td style="width: 20%;">Email</td>
						<td id="email"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Gender</td>
						<td id="gender"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Last Name</td>
						<td id="lastName"></td>
					</tr>
					<tr>
						<td style="width: 20%;">First Name</td>
						<td id="firstName"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Phone number</td>
						<td id="phoneNumber"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Address</td>
						<td id="address"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Province ID</td>
						<td id="provinceId"><span class="currency-vnd"></span></td>
					</tr>
					<tr>
						<td style="width: 20%;">company name</td>
						<td id="companyName"><span class="currency-vnd"></span></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company address</td>
						<td id="companyAdress"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company start year</td>
						<td id="companyStartYear"></td>
					</tr>
					<tr>
						<td style="width: 20%;">company employee total</td>
						<td id="companyEmployeeTotal"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company iso</td>
						<td id="companyIso"></td>
					</tr>
					<tr>
						<td style="width: 20%;">company role</td>
						<td id="companyRole"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company director name</td>
						<td id="companyDirectorName"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company tax code</td>
						<td id="companyTaxCode"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company phone number</td>
						<td id="companyPhoneNumber"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company bussiness license</td>
						<td id="companyBussinessLicense"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Account bank name</td>
						<td id="accountBankName"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Bank name</td>
						<td id="bankName"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Bank number</td>
						<td id="accountBankNumber"></td>
					</tr>
					<tr>
						<td style="width: 20%;">create date</td>
						<td id="createdDate"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Company fax</td>
						<td id="companyFax"></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td style="width: 20%;">Competence intro</td> -->
<!-- 						<td id="competenceIntro"></td> -->
<!-- 					</tr> -->
					<tr>
						<td style="width: 20%;">Transport requirement monthly</td>
						<td id="transportRequirementMonthly"></td>
					</tr>
					<tr>
						<td style="width: 20%;">Goods trading</td>
						<td id="goodsTrading"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Map lộ trình dự kiến -->
	<div class="row" style="margin-left: 0px; margin-right: 0px">
		<div class="headline"><h3>Thông tin giới thiệu của thành viên</h3></div>
		<div>
			<h4 id="competenceIntro"></h4>
		</div>
		
	</div>
	
	<!-- button thành viên chủ hàng/chủ xe -->
	<div class="row">
		<div class="col-sm-6" >
			<a href="/member/list-commodity">
				<button class="btn-u btn-u-blue" style="width: 100%;" type="button">Thành viên chủ hàng</button>
			</a>
		</div>
		<div class="col-sm-6" >
			<a href="#">
				<button class="btn-u btn-u-blue " style="width: 100%;" type="button">Thành viên chủ xe</button>
			</a>
		</div>
	</div>
</div>





<script src="/resources/js/member/MemberDetail.js"></script>
<script>
var manager = new MemberDetail();
$(function () {
	manager.init();
});

</script>
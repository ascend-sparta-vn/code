/**
 * 
 */

function MemberDetail() {

}

//init
MemberDetail.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu2").addClass("active");
	
	// get warningid from link
	var param = getSearchParameters();
//	console.log(param);
	if(param != null & param != ''){
		self.initDataGrid(param);
	}
	
	self.initSelection();
}

/**
 * @Todo: init table here
 */
MemberDetail.prototype.initDataGrid = function(accountId){
	var self = this;
	// get data truck detail
	var self = this;
	if(accountId == null || accountId == '') return;
	
	var url = "/member_rest/getMemberById?accountId=" + accountId;
	$.ajax({
		type : "GET",
		url : url,
		success : function(response) {
			console.log(response);
			if(response != null){
				$("#email").html(response.email);
				$("#gender").html(response.gender);
				$("#lastName").html(response.lastName);
				$("#firstName").html(response.firstName);
				$("#phoneNumber").html(response.phoneNumber);
				$("#address").html(response.address);
				$("#provinceId").html(response.provinceId);
				$("#companyName").html(response.companyName);
				$("#companyAdress").html(response.companyAdress);
				$("#companyStartYear").html(response.companyStartYear);
				$("#companyEmployeeTotal").html(response.companyEmployeeTotal);
				$("#companyIso").html(response.companyIso);
				$("#companyRole").html(response.companyRole);
				$("#companyDirectorName").html(response.companyDirectorName);
				$("#companyTaxCode").html(response.companyTaxCode);
				$("#companyPhoneNumber").html(response.companyPhoneNumber);
				$("#companyBussinessLicense").html(response.companyBussinessLicense);
				$("#accountBankName").html(response.accountBankName);
				$("#bankName").html(response.bankName);
				$("#accountBankNumber").html(response.accountBankNumber);
				$("#createdDate").html(getFullDateFromLongValue(response.createdDate));
				$("#goodsTrading").html(response.goodsTrading);
				$("#transportRequirementMonthly").html(response.transportRequirementMonthly);
				$("#competenceIntro").html(response.competenceIntro);
				$("#companyFax").html(response.companyFax);
			}
		},
		error : function(e) {
			console.log("ERROR initDataGrid: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}


MemberDetail.prototype.initSelection = function(){
	//searchMemberBtn
	$("#searchMemberBtn").click(function(){
		
	});
	
	//clearSearchMemberBtn
	$("#clearSearchMemberBtn").click(function(){
		
	});
	
	//backSearchMemberBtn
	$("#backSearchMemberBtn").click(function(){
		
	});
}




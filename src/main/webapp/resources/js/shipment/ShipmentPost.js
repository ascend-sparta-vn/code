/**
 * 
 */

function ShipmentPost() {
}

//init
ShipmentPost.prototype.init = function(){
	var self = this;
	// init menu active
	$("li .active").removeClass("active");
	$("#menu4").addClass("active");
	$("#menu4-sub1").addClass("active");
	
	// init selection
	self.initSelection();
	
	// reset form data
	self.resetPostFormData();
}

ShipmentPost.prototype.initSelection = function(){
	var self = this;
	$("#fromProvince").change(function(){
		var frmProvince = $("#fromProvince").val();
		getListDistrictByProvinceId(frmProvince, "#fromDistrict");
	});
	
	$("#toProvince").change(function(){
		var toProvince = $("#toProvince").val();
		getListDistrictByProvinceId(toProvince, "#toDistrict");
	});
	
	// init list provice and truck_type
	getListProvince("#fromProvince");
	getListProvince("#toProvince");
	getListTruckType("#truckType");
	getListGoodsType("#goodsType");
	getListDealType("#dealType");
	// add post data
	$("#addPostBtn").click(function() {
		var action = '/rest_shipment/addShipmentPost';
		bootbox.confirm({
			message : jQuery.i18n.prop('order.cofirm.post'),
			size: "small",
			callback: function (result) {
		        if (result) {
		        	self.addShipmentPost(action);
		        } else {
		        	return;
		        }
		    }
		});
	});
	
	// clear post
	$("#clearPostBtn").click(function(){
		self.resetPostFormData();
	});
}

ShipmentPost.prototype.addShipmentPost = function(){
	var self = this;
	var post = self.getPostFormData();
	if(!self.validateFormData(post)){
		return;
	}
	var url = "/rest_shipment/addShipmentPost";
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : url,
		data : JSON.stringify(post),
		dataType : 'json',
		success : function(response) {
			if (response.code == RESPONSE.CODE.SUCCESS) {
				showMessage(response.msg, "success");
				self.resetPostFormData();
			} else {
				showMessage(response.msg, "error");
			}
		},
		error : function(e) {
			showMessage('ERROR: /rest_shipment/addShipmentPost', 'error');
			console.log("ERROR addShipmentPost: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});

}

ShipmentPost.prototype.getPostFormData = function(){
	var post = {};
	post.name =$("#name").val();
	post.code =$("#code").val();
	post.goodsTypeId =$("#goodsType").val();
	// convert weight
	post.weight =$("#weight").val();
	post.weightUnit =$("#weightUnit").val();
	post.fromDistrict =$("#fromDistrict").val();
	post.toDistrict =$("#toDistrict").val();
	post.fromProvince =$("#fromProvince").val();
	post.toProvince =$("#toProvince").val();
	post.fromDetailAddress =$("#fromDetailAddress").val();
	post.toDetailAddress =$("#toDetailAddress").val();
	post.startDate =$("#startDate").val();
	post.expiredDate =$("#expiredDate").val();
	post.distance =$("#roadLength").val();
	post.agency =$("#agency").val();
	post.dealType =$("#dealType").val();
	
	// get price
	post.price =$("#price").val();
	post.priceUnit =$("#priceUnit").val();
	post.description =$("#description").val();
	
	return post;
}

ShipmentPost.prototype.validateFormData = function(post){
	if(post == null) return false;
	if(post.name == null || post.name == ''){
		showMessage('Tên lô hàng không hợp lệ', 'error');
		return false;
	}
	if(post.goodsTypeId == null || post.goodsTypeId == '-1'){
		showMessage('Loại hàng hóa không hợp lệ', 'error');
		return false;
	}
	if(post.dealType == null || post.dealType == '-1'){
		showMessage('Loại giao dịch không hợp lệ', 'error');
		return false;
	}
	if(post.fromProvince == null || post.fromProvince == '-1'){
		showMessage('Thành phố chở đi không hợp lệ', 'error');
		return false;
	}
	if(post.toProvince == null || post.toProvince == '-1'){
		showMessage('Thành phố chở đến không hợp lệ', 'error');
		return false;
	}
	if(post.fromDistrict == null || post.fromDistrict == '-1'){
		showMessage('Quận/huyện chở đi không hợp lệ', 'error');
		return false;
	}
	if(post.toDistrict == null || post.toDistrict == '-1'){
		showMessage('Quận/huyện chở đến không hợp lệ', 'error');
		return false;
	}
	if(post.startDate == null || post.startDate == ''){
		showMessage('Ngày bắt đầu không hợp lệ', 'error');
		return false;
	}
	if(post.expiredDate == null || post.expiredDate == ''){
		showMessage('Ngày hết hiệu lực không hợp lệ', 'error');
		return false;
	}
	return true;
}

ShipmentPost.prototype.getListDistrictByProvinceId = function(provinceId, container){
	$(container).empty();
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/rest/getListDistrictByProvinceId?provinceId=" + provinceId,
		dataType : 'json',
		success : function(response) {
			for(var i = 0; i < response.length; i++) {
				var district = response[i];
				if(district != null) {
					$(container).append("<option value='" + district.id +"'>" + decodeHtml(district.name) +"</option>");
				}
			}
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}

ShipmentPost.prototype.resetPostFormData = function(){
	$("#name").val('');
	$("#goodsType").val('-1');
	$("#dealType").val('-1');
	$("#weight").val('');
	$("#weightUnit").val('-1');
	$("#fromProvince").val('-1');
	$("#toProvince").val('-1');
	$("#fromDistrict").val('-1');
	$("#toDistrict").val('-1');
	$("#fromDetailAddress").val('');
	$("#toDetailAddress").val('');
	$("#startDate").val('');
	$("#expiredDate").val('');
	$("#roadLength").val('');
	$("#agency").val('-1');
	$("#price").val('');
	$("#priceUnit").val('-1');
	$("#description").val('');
	$("#code").val('');
}



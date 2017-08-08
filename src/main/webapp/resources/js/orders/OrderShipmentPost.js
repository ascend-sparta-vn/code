/**
 * 
 */

function OrderShipmentPost() {
	this.currentParamId = '-1';
	this.listProvince=[];
	this.eventId = -1;
	this.partnerId = -1;
}

//init
OrderShipmentPost.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu4").addClass("active");
	
	
	self.initSelection();
	
	// get warningid from link
	var param = getSearchParameters();
	if(param != null & param != ''){
		self.currentParamId = param;
		self.initDataGrid(param);
	}
	// init map
	self.initMap();
}

/**
 * @Todo: init table here
 */
OrderShipmentPost.prototype.initDataGrid = function(shipId){
	var self = this;
	// clear table data
	self.clearTableData();
	// get data truck detail
	if(shipId == null || shipId == '') return;
	
	var url = "/rest_shipment/getShipmentById?shipId=" + shipId;
	$.ajax({
		type : "GET",
		url : url,
		success : function(response) {
			console.log(response);
			if(response.shipment != null && response.shipment != ''){
				self.eventId = response.shipment.id || -1;
				self.partnerId = response.shipment.ownerId || -1;
				$("#shipmentCodeHeader").html(' - ' + convertShipmentLabel(response.shipment.code));
				$("#ownerId").html(convertOwnerLabel(response.shipment.ownerId));
				$("#dealType").html(response.shipment.dealType);
				$("#name").html(response.shipment.name);
//				$("#code").html(response.shipment.code);
				$("#goodsTypeName").html(response.shipment.goodsType.name);
				$("#startDate").html(getDateFromLongValue(response.shipment.startDate));
				$("#finishDate").html(getDateFromLongValue(response.shipment.finishDate));
				$("#fromAddress").html(self.convertProvinceDistrict(response.shipment.fromDisTrictObj, response.shipment.fromDetailAddress));
				$("#toAddress").html(self.convertProvinceDistrict(response.shipment.toDisTrictObj, response.shipment.toDetailAddress));
				$("#dealType").html(response.shipment.dealType.name);
				$("#distance").html(response.shipment.distance);
				$("#weight").html(convertWeight(response.shipment));
				$("#price").html(convertPrice(response.shipment));
				$("#description").html(response.shipment.description);
				$("#agency").html(convertAgency(response.shipment));
				$("#postDate").html(getDateFromLongValue(response.shipment.postDate));
				$("#approveDate").html(getDateFromLongValue(response.shipment.approveDate));
				$("#expiredDate").html(getDateFromLongValue(response.shipment.expiredDate));
				// fill in post form
				$("#eventPrice").val(response.shipment.price);
				$("#quantity").val(response.shipment.weight);
				$("#weightUnit").val(response.shipment.weightUnit);
				// draw map
				self.drawTrackingPlan(response.shipment.fromDisTrictObj.location, response.shipment.toDisTrictObj.location);
			}else{
				showMessage("Không tồn tại lô hàng", "error");
				return;
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

/**
 * @Todo : init google map API
 * 
 * @author hongson
 * @date 11.09.2016
 */
OrderShipmentPost.prototype.initMap = function(){
	var self = this;
	// initialize planning map
	var mapCanvasPlanning = document.getElementById("map-trucking-plan");
	
	var styles = [ {
		featureType : "poi",
		elementType : "all",
		stylers : [ {
			visibility : "off"
		} ]
	}, {
		featureType : "transit.station.bus",
		stylers : [ {
			visibility : "off"
		} ]
	} ];
	var mapOptions = {
		center : new google.maps.LatLng(20.991475, 105.798983),
		zoom : 10,
		styles : styles
	}
	
	self.mapPlanning = new google.maps.Map(mapCanvasPlanning, mapOptions);
}

OrderShipmentPost.prototype.drawTrackingPlan = function(fromLocation, toLocation){
	var self = this;
	var coordinate1 = ParseDMS(fromLocation);
	var coordinate2 = ParseDMS(toLocation);
	if(coordinate1 == null || coordinate2 == null) return;
	var myLatLng = {lat: coordinate1.lat, lng: coordinate1.lng};
	var myLatLng2 = {lat: coordinate2.lat, lng: coordinate2.lng};
	  
	self.getRoutesTowPoint(myLatLng, myLatLng2);
}

/**
 * @private
 * @param {google.maps.LatLng} point1
 * @param {google.maps.LatLng} point2
 * @param {number} stationId
 */
OrderShipmentPost.prototype.getRoutesTowPoint = function(point1, point2) {
	var self = this;
	var directionsDisplay = new google.maps.DirectionsRenderer();
	var directionsService = new google.maps.DirectionsService();
	var mapOptions = {
		zoom : 14
	}
	directionsDisplay.setMap(self.mapPlanning);
	var request = {
		origin : point1,
		destination : point2,
		travelMode : 'DRIVING'
	};
	directionsService.route(request, function(result, status) {
		if (status == 'OK') {
			directionsDisplay.setDirections(result);
		}
	});
}

OrderShipmentPost.prototype.initSelection = function(){
	var self = this;
	$("#shipmentHeader").click(function(){
		$("#shipmentDetailTable").toggle();
	});
	
	// add post data
	$("#addPostBtn").click(function() {
		var action = '/rest_order/addShipmentOrder';
		bootbox.confirm({
			message : jQuery.i18n.prop('order.cofirm.post'),
			size: "small",
			callback: function (result) {
		        if (result) {
		        	self.addOrderPost(action);
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

OrderShipmentPost.prototype.addOrderPost = function(action){
	var self = this;
	var post = self.getPostFormData();
	if(!self.validateFormData(post)){
		return;
	}
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : action,
		data : JSON.stringify(post),
		dataType : 'json',
		success : function(data) {
			if (data.code == RESPONSE.CODE.SUCCESS) {
				showMessage(data.msg, "success");
				window.location='/order/shipment/';
			} else {
				showMessage(data.msg, "error");
			}
		},
		error : function(e) {
			console.log("ERROR: ", e);
			showMessage("Lỗi hệ thống. Xin vui lòng liên hệ với Administrator", "error");
		},
		done : function(e) {
			console.log("DONE");
		}
	});

}

OrderShipmentPost.prototype.convertProvinceDistrict = function(districtObj, detail){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return (detail || '') + ', ' + districtName  + ', ' + province.name ;
	
};

OrderShipmentPost.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

OrderShipmentPost.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}

OrderShipmentPost.prototype.getPostFormData = function(){
	var post = {};
	var self = this;
	// set eventId
	post.eventId= self.eventId;
	post.ownerId=-1;
	post.partnerId = self.partnerId;
	post.quantity = parseFloat($("#quantity").val()) || 0;
	post.unit = parseInt($("#weightUnit").val()) || -1;
	post.orderType = -1;
	post.expectedPrice = parseFloat($("#expectedPrice").val()) || 0;
	post.shiftFee = parseFloat($("#shiftFee").val()) || 0;
	post.description =$("#descriptionOrder").val() || '';
//	post.vatFee = ($("#vatFee").val() == 'on') ? 1 : 0;
//	post.porterFee = ($("#porterFee").val() == 'on') ? 1 : 0;
	post.vatFee = ($("#vatFee").is(":checked") == true) ? 1 : 0;
	post.porterFee = ($("#porterFee").is(":checked") == true) ? 1 : 0;
//	post.transactionType = TRANSACTION.TYPE.SHIPMENT; //1=shipment; 2=trucking
	
	return post;
}

OrderShipmentPost.prototype.resetPostFormData = function(){
	$("#quantity").val('');
	$("#weightUnit").val('-1');
	$("#expectedPrice").val('');
	$("#shiftFee").val('');
	$("#porterFee").val('');
	$("#vatFee").val('');
	$("#descriptionOrder").val('');
}

OrderShipmentPost.prototype.validateFormData = function(post){
	if(post == null) return false;
	if(post.quantity == null || post.quantity == ''){
		showMessage('Khối lượng lô hàng không hợp lệ', 'error');
		return false;
	}
	if(post.unit == null || post.unit == ''){
		showMessage('Đơn vị khối lượng lô hàng không hợp lệ', 'error');
		return false;
	}
	if(post.expectedPrice == null || post.expectedPrice == ''){
		showMessage('Giá đề xuất cho lô hàng không hợp lệ', 'error');
		return false;
	}
	return true;
}

OrderShipmentPost.prototype.clearTableData = function(){
}




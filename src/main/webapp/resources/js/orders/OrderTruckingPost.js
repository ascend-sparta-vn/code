/**
 * 
 */

function OrderTruckingPost() {
	this.currentParamId = '-1';
	this.listProvince=[];
	this.eventId = -1;
	this.partnerId = -1;
	this.truckInfo = {};
}

//init
OrderTruckingPost.prototype.init = function(){
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
	
	// get realtime location
	setInterval(function(){self.getRealtimeLocation();}, REALTIME.TRUCKING_LOCATION);
}

/**
 * @Todo: init table here
 */
OrderTruckingPost.prototype.initDataGrid = function(truckId){
	var self = this;
	// clear table data
	self.clearTableData();
	// get data truck detail
	if(truckId == null || truckId == '') return;
	
	var url = "/rest_trucking/getTruckingById?truckId=" + truckId;
	$.ajax({
		type : "GET",
		url : url,
		success : function(response) {
			console.log(response);
			if(response.trucking != null && response.trucking != ''){
				self.eventId = response.trucking.id || -1;
				self.partnerId = response.trucking.ownerId || -1;
				self.truckInfo = response.trucking;
				$("#truckCodeHeader").html(' - ' + (convertTruckLabel(response.trucking.truck.truckCode || '')));
				$("#ownerTruckId").html(convertOwnerLabel(response.trucking.truck.ownerTruckId));
				$("#truckCode").html(convertTruckLabel(response.trucking.truck.plateNumber));
				$("#truckTypeName").html(response.trucking.truck.truckType.name);
				$("#goodsTypeName").html(response.trucking.goodsType.name);
				$("#fromAddress").html(self.convertFullAddress(response.trucking.fromDisTrictObj, response.trucking.fromDetailAddress));
				$("#toAddress").html(self.convertFullAddress(response.trucking.toDisTrictObj, response.trucking.toDetailAddress));
				$("#startDate").html(getDateFromLongValue(response.trucking.startDate));
				$("#weightString").html(convertWeight(response.trucking));
				$("#price").html(convertPrice(response.trucking));
				$("#description").html(response.trucking.description);
				$("#agency").html(response.trucking.agency);
				$("#postDate").html(getDateFromLongValue(response.trucking.postDate));
				$("#approveDate").html(getDateFromLongValue(response.trucking.approveDate));
				$("#expiredDate").html(getDateFromLongValue(response.trucking.expiredDate));
				// fill in post form
				$("#eventPrice").val(response.trucking.price);
				$("#quantity").val(response.trucking.weight);
				$("#weightUnit").val(response.trucking.weightUnit);
				// draw routing in planning
				self.drawTrackingPlan(response.trucking.fromDisTrictObj.location, response.trucking.toDisTrictObj.location);
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
OrderTruckingPost.prototype.initMap = function(){
	var self = this;
	// initialize planning map
	var mapCanvasPlanning = document.getElementById("map-trucking-plan");
	var mapCanvasTracking = document.getElementById("map-tracking");
	
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
	
	// initialize tracking realtime map
	self.mapTracking = new google.maps.Map(mapCanvasTracking, mapOptions);
	
}

OrderTruckingPost.prototype.drawTrackingPlan = function(fromLocation, toLocation){
	var self = this;
	var coordinate1 = ParseDMS(fromLocation);
	var coordinate2 = ParseDMS(toLocation);
	if(coordinate1 == null || coordinate2 == null) return;
	var myLatLng = {lat: coordinate1.lat, lng: coordinate1.lng};
	var myLatLng2 = {lat: coordinate2.lat, lng: coordinate2.lng};
	  
	self.getRoutesTowPoint(myLatLng, myLatLng2);
}

OrderTruckingPost.prototype.getRealtimeLocation = function(){
	var self = this;
	var plateNumber = self.truckInfo.truck.plateNumber;
	if(plateNumber == null || plateNumber == '') return;
	
	var url = "/rest_trucking/getCurrentLocation?plateNumber=" + plateNumber.trim();
	$.ajax({
		type : "GET",
		url : url,
		success : function(response) {
			console.log(response);
			if(response.location != null && response.location != ''){
				// update location bus
				self.createBus(response.location);
			}else{
//				showMessage("Vị trí xe không xác định", "error");
				console.log('Vị trí xe không xác định');
				return;
			}
		},
		error : function(e) {
			console.log("ERROR getCurrentLocation: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
	  
}

OrderTruckingPost.prototype.createBus = function(bus){
	var self = this;
	var latlng = new google.maps.LatLng(bus.lat, bus.lng);
    var infowindow = new google.maps.InfoWindow({
        content: ''
    });
    var marker = new google.maps.Marker({
        map: self.mapTracking,
    	position: latlng,
        icon: '/resources/img/bus/i-38.png'
    });
    var content = '<div id="busInfobox" style="width:250px;font-size:12px;" >';
    content += '<div class="row" id="inner-popup"><div class="col-md-4">\n\
                <span class="ten-bien-so" style="font-weight:bold">' + bus.plateNumber + '</span></div><div class="col-md-8 text-right">\n\
                <span class="ten-tuyen">Mã chủ xe: ' + convertOwnerLabel(self.truckInfo.truck.ownerTruckId) + '</span></div></div>\n\
                <div class="row" style="margin-left:0px;">\n\
                <span class="ten-duong">Cập nhật lúc: ' + getFullDateFromLongValue(bus.updatedTime) + '</span></div>\n\
                \
                <div class="row" style="margin-left:0px;">\
                <span class="ten-duong">Loại hàng: ' + self.truckInfo.goodsType.name + '</span></div>\n\
                <div class="row">\n\
                <div class="col-md-6" style="padding-right: 5px;"> <span class="ten-duong"> Nơi đi:\n\
                <span class="ten-duong" style="color:red;font-size:12px;font-weight:bold;margin-left:5px;"> ' + self.convertFullAddress(self.truckInfo.fromDisTrictObj, self.truckInfo.fromDetailAddress) + ' </span> \n\
                </span> </div><div class="col-md-6" style="padding-left: 5px; padding-right: 15px"> <span class="ten-duong"> Nơi đến:\n\
                <span class="ten-duong" style="color:red;font-size:12px;font-weight:bold;margin-left:5px;"> ' + self.convertFullAddress(self.truckInfo.toDisTrictObj, self.truckInfo.toDetailAddress) + '</span>\n\
                </span> </div></div>\n\
                <div class="row"><div class="col-md-6"> \n\
                <span class="ten-duong"> Khối lượng hàng\n\
                <span style="color:red;font-size:12px;font-weight:bold;margin-left:5px;" class="ten-duong"> ' + convertWeight(self.truckInfo) + '</span></span> \n\
                </div><div class="col-md-6"> <span class="ten-duong"> Giá tiền\n\
                <span style="color:red;font-size:12px;font-weight:bold;margin-left:5px;" class="ten-duong"> ' + convertPrice(self.truckInfo) + '</span>\n\
                </span> </div>\n\
                </div><div class="row border-bottom-1">\n\
                \
                </div>';
    infowindow.setContent(content);
    infowindow.open(self.mapTracking, marker);
    marker.addListener('mouseover', function () {
        infowindow.open(self.mapTracking, marker);
    });
    marker.addListener('mouseout', function () {
        infowindow.close();
    });
    var myOptions = {
            content: bus.plateNumber, 
            	boxStyle: {
                border: "1px solid #f7941e",
                textAlign: "center",
                fontSize: "7pt",
                width: "48px",
                color: "#fff",
                backgroundColor: "red",
                borderRadius: "4px"
            },
            pixelOffset: new google.maps.Size(5, 5),
            disableAutoPan: true,
            position: latlng,
            closeBoxURL: "",
            isHidden: false,
            pane: "mapPane",
            enableEventPropagation: true
        };
        var lable = new MarkerLable(myOptions);
        lable.open(self.mapTracking);
//    var rs = {
//        marker: marker,
//        infowindow:infowindow,
//        lable:lable
//    };
}

/**
 * @private
 * @param {google.maps.LatLng} point1
 * @param {google.maps.LatLng} point2
 * @param {number} stationId
 */
OrderTruckingPost.prototype.getRoutesTowPoint = function(point1, point2) {
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



OrderTruckingPost.prototype.initSelection = function(){
	var self = this;
	$("#truckingHeader").click(function(){
		$("#truckingDetailTable").toggle();
	});
	$("#tab-1").click(function(){
		$("#tab1-content").show();
		$("#tab2-content").hide();
		self.initMap();
		self.drawTrackingPlan(self.truckInfo.fromDisTrictObj.location, self.truckInfo.toDisTrictObj.location);
	});
	$("#tab-2").click(function(){
		$("#tab2-content").show();
		$("#tab1-content").hide();
		self.initMap();
		self.getRealtimeLocation();
	});
	// add post data
	$("#addPostBtn").click(function() {
		var action = '/rest_order/addTruckingOrder';
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

OrderTruckingPost.prototype.addOrderPost = function(action) {
	var self = this;
	var post = self.getPostFormData();
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : action,
		data : JSON.stringify(post),
		dataType : 'json',
		//timeout : 30000,
		success : function(data) {
			console.log(data);
			if (data.code == RESPONSE.CODE.SUCCESS) {
				showMessage(data.msg, "success");
				window.location='/order/trucking/';
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


OrderTruckingPost.prototype.convertProvinceDistrict = function(districtObj, detail){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return (detail || '') + ', ' + districtName  + ', ' + province.name ;
	
};

OrderTruckingPost.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

OrderTruckingPost.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}

OrderTruckingPost.prototype.getPostFormData = function(){
	var post = {};
	var self = this;
	// set eventId
	post.eventId= self.eventId;
	post.ownerId=-1;
	post.partnerId = self.partnerId;
	post.quantity =$("#quantity").val() || 0;
	post.unit =$("#weightUnit").val() || -1;
	post.orderType = -1;
	post.expectedPrice =$("#expectedPrice").val() || 0;
	post.shiftFee =$("#shiftFee").val() || 0;
	post.description =$("#descriptionOrder").val() || '';
	post.vatFee = ($("#vatFee").is(":checked") == true) ? 1 : 0;
	post.porterFee = ($("#porterFee").is(":checked") == true) ? 1 : 0;
	
	return post;
}

OrderTruckingPost.prototype.resetPostFormData = function(){
	$("#quantity").val('');
	$("#weightUnit").val('-1');
	$("#expectedPrice").val('');
	$("#shiftFee").val('');
	$("#porterFee").val('');
	$("#vatFee").val('');
	$("#descriptionOrder").val('');
}

OrderTruckingPost.prototype.validateFormData = function(post){
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

OrderTruckingPost.prototype.clearTableData = function(){
}

OrderTruckingPost.prototype.convertFullAddress = function(districtObj, detail){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return (detail || '') + ', ' + districtName  + ', ' + province.name ;
	
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};


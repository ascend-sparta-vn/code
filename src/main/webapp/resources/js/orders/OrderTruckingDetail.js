/**
 * 
 */

function OrderTruckingDetail() {
	this.currentParamId = '-1';
	this.listProvince=[];
	this.truckInfo = {};
}

//init
OrderTruckingDetail.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu4").addClass("active");
	
	// init map
	self.initMap();
	
	self.initSelection();
	
	// get warningid from link
	var param = getSearchParameters();
	if(param != null & param != ''){
		self.currentParamId = param;
		self.initDataGrid(param);
	}
	
	setInterval(function(){self.getRealtimeLocation();}, REALTIME.TRUCKING_LOCATION);
}


OrderTruckingDetail.prototype.initSelection = function(){
	var self = this;
	$("#truckingHeader").click(function(){
		$("#truckingDetailTable").toggle();
	});
	$("#orderHeader").click(function(){
		$("#orderDetailTable").toggle();
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
}

OrderTruckingDetail.prototype.initMap = function(){
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

OrderTruckingDetail.prototype.drawTrackingPlan = function(fromLocation, toLocation){
	var self = this;
	var coordinate1 = ParseDMS(fromLocation);
	var coordinate2 = ParseDMS(toLocation);
	if(coordinate1 == null || coordinate2 == null) return;
	var myLatLng = {lat: coordinate1.lat, lng: coordinate1.lng};
	var myLatLng2 = {lat: coordinate2.lat, lng: coordinate2.lng};
	  
	self.getRoutesTowPoint(myLatLng, myLatLng2);
}

OrderTruckingDetail.prototype.getRealtimeLocation = function(){
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

OrderTruckingDetail.prototype.createBus = function(bus){
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
                </span> </div><div class="col-md-6" style="padding-left: 5px; padding-right: 15px> <span class="ten-duong"> Nơi đến:\n\
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
OrderTruckingDetail.prototype.getRoutesTowPoint = function(point1, point2) {
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
/**
 * @Todo: init table here
 */
OrderTruckingDetail.prototype.initDataGrid = function(orderId){
	var self = this;
	// clear table data
	self.clearTableData();
	// get data truck detail
	if(orderId == null || orderId == '') return;
	var url = "/rest_product/getOrderTruckingDetailByOrderId?orderId=" + orderId;
	$.ajax({
		type : "GET",
		url : url,
		success : function(response) {
			console.log(response);
			// fill shipment data
			if(response != null && response.truckInfo != ''){
				var truckInfo = response.truckInfo;
				self.truckInfo = response.truckInfo;
				$("#truckingCodeHeader").html(' - ' + convertTruckLabel(truckInfo.truck.truckCode || ''));
				$("#ownerId").html(convertOwnerLabel(truckInfo.truck.ownerTruckId));
				$("#truckCode").html(convertTruckLabel(truckInfo.truck.plateNumber));
				$("#truckType").html(truckInfo.truck.truckType.name);
				$("#goodsTypeName").html(truckInfo.goodsType.name);
				$("#fromAddress").html(self.convertProvinceDistrict(truckInfo.fromDisTrictObj, truckInfo.fromDetailAddress));
				$("#toAddress").html(self.convertProvinceDistrict(truckInfo.toDisTrictObj, truckInfo.toDetailAddress));
				$("#startDate").html(getDateFromLongValue(truckInfo.startDate));
				$("#weight").html(convertWeight(truckInfo));
				$("#price").html(convertPrice(truckInfo));
				$("#description").html(truckInfo.description);
				$("#agency").html(truckInfo.agency);
				$("#finishDate").html(getDateFromLongValue(truckInfo.expiredDate));
				$("#postDate").html(getDateFromLongValue(truckInfo.postDate));
				$("#approveDate").html(getDateFromLongValue(truckInfo.approveDate));
				$("#expiredDate").html(getDateFromLongValue(truckInfo.expiredDate));
			}else{
				showMessage("Không tồn tại lô hàng", "error");
				return;
			}
			// fill order data
			if(response != null && response.order != ''){
				var order = response.order;
				$("#orderCodeHeader").html(' - ' + convertOrderLabel(order.id));
				$("#ownerOrderId").html(convertOwnerLabel(order.ownerId));
				$("#partnerId").html(convertOwnerLabel(order.partnerId));
				$("#eventId").html(convertShipmentLabel(order.eventId));
				$("#quantity").html(convertQuantity(order));
				$("#expectedPrice").html(order.expectedPrice + ' VNĐ');
				$("#vatFee").html(convertFeeType(order.vatFee));
				$("#porterFee").html(convertFeeType(order.porterFee));
				$("#shiftFee").html(order.shiftFee + ' VNĐ');
				$("#descriptionOrder").html(order.description);
				$("#orderType").html(convertOrderType(order.orderType));
//				$("#transactionType").html(convertTransactionType(order.transactionType));
				$("#createdDate").html(getDateFromLongValue(order.createdDate));
			}else{
				showMessage("Không tồn tại giao dịch", "error");
				return;
			}
			// draw routing in planning
			self.drawTrackingPlan(response.truckInfo.fromDisTrictObj.location, response.truckInfo.toDisTrictObj.location);
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

OrderTruckingDetail.prototype.clearTableData = function(){
	
}

OrderTruckingDetail.prototype.convertFullAddress = function(districtObj, detail){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return (detail || '') + ', ' + districtName  + ', ' + province.name ;
	
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};

OrderTruckingDetail.prototype.convertProvinceDistrict = function(districtObj, detail){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return (detail || '') + ', ' + districtName  + ', ' + province.name ;
	
};

OrderTruckingDetail.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

OrderTruckingDetail.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}
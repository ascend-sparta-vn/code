/**
 * 
 */

function OrderShipmentDetail() {
	this.currentParamId = '-1';
	this.listProvince=[];
	this.currAccountId = -1;
	this.shipment = {};
}

//init
OrderShipmentDetail.prototype.init = function(){
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


OrderShipmentDetail.prototype.initSelection = function(){
	var self = this;
	$("#shipmentHeader").click(function(){
		$("#shipmentDetailTable").toggle();
	});
	$("#orderHeader").click(function(){
		$("#orderDetailTable").toggle();
	});
}

OrderShipmentDetail.prototype.initMap = function(){
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

OrderShipmentDetail.prototype.drawTrackingPlan = function(fromLocation, toLocation){
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
OrderShipmentDetail.prototype.getRoutesTowPoint = function(point1, point2) {
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
OrderShipmentDetail.prototype.initDataGrid = function(orderId){
	var self = this;
	// clear table data
	self.clearTableData();
	// get data truck detail
	if(orderId == null || orderId == '') return;
	var url = "/rest_order/getOrderShipmentDetailByOrderId?orderId=" + orderId;
	$.ajax({
		type : "GET",
		url : url,
		success : function(response) {
			console.log(response);
			// fill shipment data
			if(response != null && response.shipment != ''){
				var shipment = response.shipment;
				self.shipment = response.shipment;
				$("#shipmentCodeHeader").html(' - ' + convertShipmentLabel(shipment.code));
				$("#ownerId").html(convertOwnerLabel(shipment.ownerId));
				$("#dealType").html(shipment.dealType);
				$("#name").html(shipment.name);
//				$("#code").html(shipment.code);
				$("#goodsTypeName").html(shipment.goodsType.name);
				$("#startDate").html(getDateFromLongValue(shipment.startDate));
				$("#finishDate").html(getDateFromLongValue(shipment.finishDate));
				$("#fromAddress").html(self.convertProvinceDistrict(shipment.fromDisTrictObj, shipment.fromDetailAddress));
				$("#toAddress").html(self.convertProvinceDistrict(shipment.toDisTrictObj, shipment.toDetailAddress));
				$("#dealType").html(shipment.dealType.name);
				$("#distance").html(shipment.distance);
				$("#weight").html(convertWeight(shipment));
				$("#price").html(convertPrice(shipment));
				$("#description").html(shipment.description);
				$("#agency").html(convertAgency(shipment));
				$("#postDate").html(getDateFromLongValue(shipment.postDate));
				$("#approveDate").html(getDateFromLongValue(shipment.approveDate));
				$("#expiredDate").html(getDateFromLongValue(shipment.expiredDate));
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
				$("#orderType").html(convertOrderType(order, self.currAccountId));
//				$("#transactionType").html(convertTransactionType(order.transactionType));
				$("#createdDate").html(getDateFromLongValue(order.createdDate));
			}else{
				showMessage("Không tồn tại giao dịch", "error");
				return;
			}
			// draw map
			self.drawTrackingPlan(response.shipment.fromDisTrictObj.location, response.shipment.toDisTrictObj.location);
		},
		error : function(e) {
			console.log("ERROR initDataGrid: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}


OrderShipmentDetail.prototype.clearTableData = function(){
	
}

OrderShipmentDetail.prototype.convertProvinceDistrict = function(districtObj, detail){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return (detail || '') + ', ' + districtName  + ', ' + province.name ;
	
};

OrderShipmentDetail.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

OrderShipmentDetail.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}
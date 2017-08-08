/**
 * 
 */

function ShipmentDetail() {
	this.currentParamId = '-1';
	this.listProvince=[];
	this.currAccountId = -1;
	this.shipment = {};
}

//init
ShipmentDetail.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu4").addClass("active");
	
	
	// get warningid from link
	var param = getSearchParameters();
	if(param != null & param != ''){
		self.currentParamId = param;
		self.initDataGrid(param);
	}
	
	self.initSelection();
	// init map
	self.initMap();
}


ShipmentDetail.prototype.initSelection = function(){
	var self = this;
	
	// order cart
	$("#orderCart").click(function(){
		window.location ='/order/shipment/post?' + self.shipmentId;
	});
}

ShipmentDetail.prototype.initMap = function(){
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

ShipmentDetail.prototype.drawTrackingPlan = function(fromLocation, toLocation){
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
ShipmentDetail.prototype.getRoutesTowPoint = function(point1, point2) {
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
ShipmentDetail.prototype.initDataGrid = function(shipId){
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
				self.shipmentId = response.shipment.id;
				self.shipment = response.shipment;
				$("#shipmentCodeHeader").html(' - ' + convertShipmentLabel(response.shipment.code));
				$("#ownerId").html(convertOwnerLabel(response.shipment.ownerId));
				$("#dealType").html(response.shipment.dealType);
				$("#name").html(response.shipment.name);
				$("#code").html(convertShipmentLabel(response.shipment.code));
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
				// set btnPrevious and btnNext value
				if(response.prevShipment != null && response.prevShipment != ''){
					$("#btnPreviousDiv").show();
					$("#btnPrevious").attr("href", "/shipment/detail?" + (parseInt(response.prevShipment)));
				}else{
					$("#btnPreviousDiv").hide();
				}
				if(response.nextShipment != null && response.nextShipment != ''){
					$("#btnNextDiv").show();
					$("#btnNext").attr("href", "/shipment/detail?" + (parseInt(response.nextShipment)));
				}else{
					$("#btnNextDiv").hide();
				}
				// hide order cart if were owner
				if(self.currAccountId != response.shipment.ownerId){
					$("#orderCartDiv").show();
				}else{
					$("#orderCartDiv").hide();
				}
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


ShipmentDetail.prototype.clearTableData = function(){
	
}

ShipmentDetail.prototype.convertProvinceDistrict = function(districtObj, detail){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return (detail || '') + ', ' + districtName  + ', ' + province.name ;
	
};

ShipmentDetail.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

ShipmentDetail.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}
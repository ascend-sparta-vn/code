/**
 *
 */

function TruckingDetail() {
    this.currentParamId = '-1';
    this.listProvince = [];
    this.truckInfo = {};
    this.currAccountId = -1;
}

//init
TruckingDetail.prototype.init = function(){
    var self = this;
    var mapPlanning, mapTracking;
    $("li .active").removeClass("active");
    $("#menu3").addClass("active");


    // get warningid from link
    var param = getSearchParameters();
    if(param != null & param != ''){
        self.currentParamId = param;
        self.initDataGrid(param);
    }

    self.initSelection();
    // init map
    self.initMap();

    // draw routing in planning
//	self.drawTrackingPlan();
    // get realtime location
    setInterval(function(){self.getRealtimeLocation();}, REALTIME.TRUCKING_LOCATION);
}

TruckingDetail.prototype.initSelection = function(){
    var self = this;
    // order cart
    $("#orderCart").click(function(){
        window.location ='/order/trucking/post?' + self.truckingId;
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

TruckingDetail.prototype.initMap = function(){
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

TruckingDetail.prototype.drawTrackingPlan = function(fromLocation, toLocation){
    var self = this;
    var coordinate1 = ParseDMS(fromLocation);
    var coordinate2 = ParseDMS(toLocation);
    if(coordinate1 == null || coordinate2 == null) return;
    var myLatLng = {lat: coordinate1.lat, lng: coordinate1.lng};
    var myLatLng2 = {lat: coordinate2.lat, lng: coordinate2.lng};

    self.getRoutesTowPoint(myLatLng, myLatLng2);
}

TruckingDetail.prototype.getRealtimeLocation = function(){
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

TruckingDetail.prototype.createBus = function(bus){
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
TruckingDetail.prototype.getRoutesTowPoint = function(point1, point2) {
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
TruckingDetail.prototype.initDataGrid = function(truckId){
    var self = this;
    // get data truck detail
    var self = this;
    if(truckId == null || truckId == '') return;

    var url = "/rest_trucking/getTruckingById?truckId=" + truckId;
    $.ajax({
        type : "GET",
        url : url,
        success : function(response) {
            console.log(response);
            if(response.trucking != null && response.trucking != ''){
                self.truckingId = truckId;
                self.truckInfo = response.trucking;
                $("#truckCodeHeader").html(' - ' + (convertTruckLabel(response.trucking.truck.truckCode || '')));
                $("#ownerTruckId").html(convertOwnerLabel(response.trucking.truck.ownerTruckId));
                $("#truckCode").html(convertTruckLabel(response.trucking.truck.truckCode));
                $("#plateNumber").html(convertTruckLabel(response.trucking.truck.plateNumber));
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
                $("#title").html(response.trucking.title);

                // set btnPrevious and btnNext value
                if(response.prevTrucking != null && response.prevTrucking != ''){
                    $("#btnPreviousDiv").show();
                    $("#btnPrevious").attr("href", "/trucking/detail?" + (parseInt(response.prevTrucking)));
                }else{
                    $("#btnPreviousDiv").hide();
                }
                if(response.nextTrucking != null && response.nextTrucking != ''){
                    $("#btnNextDiv").show();
                    $("#btnNext").attr("href", "/trucking/detail?" + (parseInt(response.nextTrucking)));
                }else{
                    $("#btnNextDiv").hide();
                }
                // hide order cart if were owner
                if(self.currAccountId != response.trucking.truck.ownerTruckId){
                    $("#orderCartDiv").show();
                }else{
                    $("#orderCartDiv").hide();
                }

                // draw routing in planning
                self.drawTrackingPlan(response.trucking.fromDisTrictObj.location, response.trucking.toDisTrictObj.location);
                // get realtime location
//				self.getRealtimeLocation();
            }else{
                showMessage("Không tồn tại xe", "error");
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

TruckingDetail.prototype.convertFullAddress = function(districtObj, detail){
    var self = this;
    var districtName = districtObj.name || '';
    var province = self.getProvinceId(districtObj.provinceId) || '';
    return (detail || '') + ', ' + districtName  + ', ' + province.name ;

    var districtName = districtObj.name || '';
    var province = self.getProvinceId(districtObj.provinceId) || '';
    return province.name + ', ' + districtName;

};

TruckingDetail.prototype.getProvinceId = function(id) {
    var self = this;
    var obj = {};
    if (self.listProvince && self.listProvince.length > 0){
        $.each(self.listProvince, function (i, item) {
            (item.id == id) && (obj = item);
        });
        return obj;
    }
};

TruckingDetail.prototype.initProvince = function(id, name) {
    var self = this;
    var obj = {};
    obj.id = id;
    obj.name = name;
    self.listProvince.push(obj);
}







/**
 * 
 */

function ContactUs() {
}

//init
ContactUs.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu4").addClass("active");
	
	// init map
	self.initMap();
	
	self.initButton();
	
	//check message
	if ($("#sendResult").val() != '') {
		showMessage($("#sendResultMessage").val(), $("#sendResult").val());
	}
	
}


/**
 * @Todo : init google map API
 * 
 * @author hongson
 * @date 11.09.2016
 */
ContactUs.prototype.initMap = function(latLngObj){
	var self = this;
	//init map
	  var mapCanvas = document.getElementById("map");
	  var styles = [
	                {
	                    featureType: "poi",
	                    elementType: "all",
	                    stylers: [
	                        {visibility: "off"}
	                    ]}, {
	                    featureType: "transit.station.bus",
	                    stylers: [
	                        {visibility: "off"}
	                    ]
	                }
	            ];
	  var mapOptions = {
	    center: (latLngObj == null) ? new google.maps.LatLng(21.010817, 105.82214399999998) : latLngObj,
	    zoom: 17,
	    styles:styles
	  }
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  
	  google.maps.event.addListenerOnce(map, 'idle', function(){
		  self.mapPlanning = map;
		});
	  
	  var myLatLng = {lat: 21.010817, lng: 105.82214399999998};
	  var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: '25B, Thanh Xuân Bắc, Hà Nội'
        });
	  
};

/**
 * @Todo : init button
 * 
 * @author sonpham
 * @date 11.12.2016
 */
ContactUs.prototype.initButton = function() {
	$("#sendMessageBtn").click(function(){
		
	});
};


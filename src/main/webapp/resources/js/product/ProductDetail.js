/**
 * 
 */

function ProductDetail() {
	this.currentParamId = '-1';
	this.listProvince=[];
	this.currAccountId = -1;
	this.shipment = {};
}

//init
ProductDetail.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu4").addClass("active");
	
	
	// get warningid from link
	// var param = getSearchParameters();
	// if(param != null & param != ''){
	// 	self.currentParamId = param;
	// 	self.initDataGrid(param);
	// }
}


/**
 * @Todo: init table here
 */
ProductDetail.prototype.initDataGrid = function(shipId){
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


ProductDetail.prototype.addToCart = function (productId, quantity){

    var url = "/product/cart/add/" + productId + '/' + quantity;
    $.ajax({
        type : "GET",
        url : url,
        success : function(response) {
            console.log('success');
            if(response == 1)
                showMessage('add product to successfull', "success");
            else
                showMessage('add product to failed', "error");
        },
        error : function(e) {
            console.log("ERROR addToCart: ", e);
            showMessage('Contact to admin to resolve this problem', "error");
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}

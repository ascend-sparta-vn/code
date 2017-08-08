function OrderShipmentManager() {
	this.listProvince = [];
}
//init
OrderShipmentManager.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu4").addClass("active");
	
	self.initButtonClick();
	self.initDataTable();
	self.initSelectAction();
	
}

//search

/**
 * @Todo: init table here
 */
OrderShipmentManager.prototype.initDataTable = function(){
	var self = this;
	var dataReq = self.getPostSearchData();
	var url = '/rest_order/getListOrderShipment';
	var table = $("#orderShipmentTable").dataTable();
	table.fnDestroy();
	var t = $('#orderShipmentTable').DataTable({
		"columns": [
			 { "data": "id"},
			 {"render": function ( data, type, row ) {
				 return convertOrderType(row, self.currAccountId);
             }},
//             {"render": function ( data, type, row ) {
//            	 return convertOrderType(row.orderType);
//             }},
             { "data": "shipment.goodsType.name"},
			 {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.shipment.fromDisTrictObj);
             }},
             {"render": function ( data, type, row ) {
                 return getDateFromLongValue(row.shipment.startDate);
             }},
//             { "data": "quantity"},
             {"render": function ( data, type, row ) {
                 return self.generateLink(row);
             }}
         ],
         "columnDefs": [
                        { "width": "5%", "targets":  0,  "orderable":false},
                        { "width": "5%", "targets": 1,  "orderable":false},
                        { "width": "5%", "targets": 2,  "orderable":true}
//                        { "width": "13%", "targets": 3,  "orderable":true},
//                        { "width": "10%", "targets": 4,  "orderable":false},
                      ],
          "ajax": {
              "url": url,
              "type": "POST",
              "data": function () {
                  return JSON.stringify(dataReq);
              },
              "contentType": "application/json",
              "dataSrc": ""            	 
          },
//         "aaSorting": [[2, 'desc']],
         "aLengthMenu": [
                         [20, 40, 50, -1],
                         [20, 40, 40, "All"]
                     ],
         "fnInitComplete": function(oSettings, json) {
//			self.listUser = json;
			console.log(json);
         },
         "language" : {
				"paginate" : {
					"previous" : JQUERY_DATA_TABLE.LANGUAGE.PREVIOUS_PAGE,
					"next" : JQUERY_DATA_TABLE.LANGUAGE.NEXT_PAGE,
					
				},
				"sZeroRecords": JQUERY_DATA_TABLE.LANGUAGE.SZERORECORDS,
				"sInfoFiltered": "",
				"processing":     JQUERY_DATA_TABLE.LANGUAGE.PROCESSING,
				"search": "",
				"sLengthMenu": "_MENU_",
				"info": "",
				"infoEmpty":JQUERY_DATA_TABLE.LANGUAGE.INFOEMPTY
			},
         "iDisplayLength": 50,
         "searching" : false,
         dom: 'Bfrtip'
     });
	
	t.on( 'order.dt search.dt', function () {
	    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();
	
}


OrderShipmentManager.prototype.getPostSearchData = function() {
	var obj = {};
	obj["toProvince"] = $("#provinceTo").val() || '-1';
	obj["fromProvince"] = $("#provinceFrom").val() || '-1';
	obj["startDate"] = $("#fromDate").val() || '';
	obj["postDate"] = $("#toDate").val() || '';
	obj["goodsTypeId"] = $("#goodsType").val() || '-1';
	obj["orderType"] = $("#orderType").val() || '-1';
	
	obj["approveDate"] = '';
	obj["expiredDate"] = '';
	obj["truckType"] = '-1';
	
	return obj;
}

/**
 * @Todo: init button here
 */
OrderShipmentManager.prototype.initButtonClick = function() {
	var self = this;
	// show advanced search box
	$("#advancedTruckingBtn").click(function(){
		$("#advanceSearchBox").slideToggle();
	});
	
	$("#searchTruckingBtn").click(function(){
		self.initDataTable();
	});
	
	$("#clearTruckingBtn").click(function(){
		self.clearSearchForm();
	});
	
};


OrderShipmentManager.prototype.initSelectAction = function(data) {
	//load list province
	var self = this;
	getListProvince("#provinceTo");
	getListProvince("#provinceFrom");
	getListGoodsType("#goodsType");
	
	$("#provinceTo").change(function(){
		self.initDataTable();
	});
	$("#provinceFrom").change(function(){
		self.initDataTable();
	});
	$("#goodsType").change(function(){
		self.initDataTable();
	});
	$("#orderType").change(function(){
		self.initDataTable();
	});
	$("#toDate").change(function(){
		self.initDataTable();
	});
	$("#fromDate").change(function(){
		self.initDataTable();
	});
};

//to delete trucking order
OrderShipmentManager.prototype.deleteOrderShipment = function(id) {
	var self = this;
	if(id == null || id == ''){
		showMessage('Đơn hàng không tồn tại', "error");
		return;
	}
	bootbox.confirm({
		message : jQuery.i18n.prop('common.cofirm.delete'),
		size: "small",
		callback: function (result) {
	        if (result) {
	        	$.ajax({
	        		type : "POST",
	        		contentType : "application/json",
	        		url : "/rest_order/deleteOrderShipment",
	        		data : JSON.stringify(id),
	        		dataType : 'json',
	        		//timeout : 30000,
	        		success : function(data) {
	        			console.log(data);
	        			if( data.code == RESPONSE.CODE.SUCCESS ) {
	        				showMessage(data.msg, "success");
	        				self.initDataTable();
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
	        } else {
	        	return;
	        }
	    }
	});
};

OrderShipmentManager.prototype.generateLink = function(row){
	var str ="";
	var id = row.id;
	var editLink = '<a href="/order/shipment/detail?'+id+'" class="skin-text-color"><i class="fa fa-info-circle fa-lg" style="color: #0096F0"></i></a>';
	var deleteLink = '&nbsp<a href="#" onclick="deleteOrderShipment('+id+')" class="skin-text-color"><i class="fa fa-trash-o fa-lg"></i></a>';
	str += editLink;
	str += deleteLink;
	return str;
};

OrderShipmentManager.prototype.generateLabel = function(code){
	var str ="";
	var editLink = '<code> SHP '+code+' </code>';
	str += editLink;
	return str;
};

OrderShipmentManager.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}

OrderShipmentManager.prototype.clearSearchForm = function(){
	var self = this;
	$("#provinceFrom").val('-1');
	$("#provinceTo").val('-1');
	$("#districtFrom").val('-1');
	$("#districtTo").val('-1');
	$("#fromDate").val('');
	$("#toDate").val('');
	$("#goodsType").val('-1');
	
	self.initDataTable();
};

OrderShipmentManager.prototype.convertProvinceDistrict = function(districtObj){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};
OrderShipmentManager.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};


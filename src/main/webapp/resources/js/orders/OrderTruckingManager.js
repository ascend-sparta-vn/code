function OrderTruckingManager() {
	this.listProvince = [];
	this.currAccountId = '';
}
//init
OrderTruckingManager.prototype.init = function(){
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
OrderTruckingManager.prototype.initDataTable = function(){
	var self = this;
	var dataReq = self.getPostSearchData();
	var url = '/rest_product/getListOrderTrucking';
	var table = $("#orderTruckingTable").dataTable();
	table.fnDestroy();
	var t = $('#orderTruckingTable').DataTable({
		"columns": [
			 { "data": "id"},
			 {"render": function ( data, type, row ) {
				 return convertOrderType(row, self.currAccountId);
             }},
//             {"render": function ( data, type, row ) {
//            	 return convertOrderType(row.orderType);
//             }},
             { "data": "truckInfo.truck.truckType.name"},
			 {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.truckInfo.fromDisTrictObj);
             }},
             {"render": function ( data, type, row ) {
                 return getDateFromLongValue(row.truckInfo.startDate);
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
         "iDisplayLength": 20,
         "searching" : false,
         dom: 'Bfrtip'
     });
	
	t.on( 'order.dt search.dt', function () {
	    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();
	
}


OrderTruckingManager.prototype.getPostSearchData = function() {
	var obj = {};
	obj["toProvince"] = $("#provinceTo").val() || '-1';
	obj["fromProvince"] = $("#provinceFrom").val() || '-1';
	obj["truckType"] = $("#truckType").val() || '-1';
	obj["startDate"] = $("#fromDate").val() || '';
	obj["postDate"] = $("#toDate").val() || '';
	obj["orderType"] = $("#orderType").val() || '-1';
	
	obj["approveDate"] = '';
	obj["expiredDate"] = '';
	obj["goodsTypeId"] = $("#goodsType").val() || '-1';
	
	return obj;
}

/**
 * @Todo: init button here
 */
OrderTruckingManager.prototype.initButtonClick = function() {
	var self = this;
	
	// show advanced search box
	$("#advancedTruckingBtn").click(function(){
		$("#advanceSearchBox").slideToggle();
	});
	
	$("#myModal").bind("show", function() {
		var user = self.user;
		$("#usernameModal").val(user.username);
		$("#passwordModal").val("");
		$("#roleModal").val(user.listRole);
		$("#enabledModal").val(user.enabled);
	});
	
	$("#searchTruckingBtn").click(function(){
		self.initDataTable();
	});
	
	$("#clearTruckingBtn").click(function(){
		self.clearSearchForm();
	});
	
};

// to delete trucking order
OrderTruckingManager.prototype.deleteOrderTrucking = function(id) {
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
	        		url : "/rest_product/deleteOrderTrucking",
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

OrderTruckingManager.prototype.initSelectAction = function(data) {
	//load list province
	var self = this;
	getListProvince("#provinceTo");
	getListProvince("#provinceFrom");
	getListTruckType("#truckType");
	
	$("#provinceTo").change(function(){
		self.initDataTable();
	});
	$("#provinceFrom").change(function(){
		self.initDataTable();
	});
	$("#truckType").change(function(){
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

OrderTruckingManager.prototype.generateLink = function(row){
	var str ="";
	var id = row.id;
	var editLink = '<a href="/order/trucking/detail?'+id+'" class="skin-text-color"><i class="fa fa-info-circle fa-lg" style="color: #0096F0"></i></a>';
	var deleteLink = '&nbsp<a href="#" onclick="deleteOrderTrucking('+id+')" class="skin-text-color"><i class="fa fa-trash-o fa-lg"></i></a>';
	str += editLink;
	str += deleteLink;
	return str;
};

OrderTruckingManager.prototype.generateLabel = function(code){
	var str ="";
	var editLink = '<code> SHP '+code+' </code>';
	str += editLink;
	return str;
};

OrderTruckingManager.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}

OrderTruckingManager.prototype.clearSearchForm = function(){
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

OrderTruckingManager.prototype.convertProvinceDistrict = function(districtObj){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};
OrderTruckingManager.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};


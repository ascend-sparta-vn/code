function ShipmentManager() {
	this.listProvince = [];
}
//init
ShipmentManager.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu2").addClass("active");
	
	self.initButtonClick();
	// get param from here, else return all
	var param = getSearchParameters(); //fromProvince=1&toProvince=1&goodsTypeId=1&fromDate=06/12/2016
	var data = {};
	if(param != null && param != ''){
		var vals = param.split('&');
		for(var i =0, leng = vals.length; i < leng; i++){
			var key = vals[i].split('=')[0];
			var value = vals[i].split('=')[1];
			data[key] = value;
		}
		// set default value in searchReq
		data["toDistrict"] = '-1';
		data["fromDistrict"] = '-1';
		data["postDate"] = '';
		// set selected box
		$("#provinceFrom").val(data.fromProvince);
		$("#provinceTo").val(data.toProvince);
		$("#goodsType").val(data.goodsTypeId);
		$("#fromDate").val(data.fromDate);
		$("#districtFrom").val('-1');
		$("#districtTo").val('-1');
		$("#toDate").val('');
	}
	self.initDataTable(data);
	self.initSelectAction(data);
	
}

//search

/**
 * @Todo: init table here
 */
ShipmentManager.prototype.initDataTable = function(param){
	var self = this;
//	var data = self.getPostSearchData();
	var data = {};
	var url = '/rest_trucking/getListTrucking';
	if(param == null || param.fromProvince == null){
		data = self.getPostSearchData();
	}
	else{
		data = param;
	}
	var table = $("#shipmentTable").dataTable();
	table.fnDestroy();
	var url = "/rest_shipment/getListShipment" ;
	var t = $('#shipmentTable').DataTable({
		"columns": [
			 { "data": "id"},
//			 { "data": "code"},
			 {"render": function ( data, type, row ) {
				 return self.generateLabel(row.code);
             }},
			 { "data": "name"},
			 {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.fromDisTrictObj);
             }},
             {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.toDisTrictObj);
             }},
             { "data": "goodsType.name"},
             {"render": function ( data, type, row ) {
            	 return convertWeight(row);
             }},
             {"render": function ( data, type, row ) {
            	 return convertPrice(row);
             }},
//             {"render": function ( data, type, row ) {
//                 return getDateFromLongValue(row.startDate);
//             }},
             {"render": function ( data, type, row ) {
                 return getDateFromLongValue(row.expiredDate);
             }},
             {"render": function ( data, type, row ) {
                 return self.generateLink(row);
             }}
         ],
         "columnDefs": [
                        { "width": "5%", "targets":  0,  "orderable":false},
                        { "width": "10%", "targets": 1,  "orderable":false},
                        { "width": "12%", "targets": 2,  "orderable":true},
                        { "width": "13%", "targets": 3,  "orderable":true},
                        { "width": "10%", "targets": 4,  "orderable":false},
                        { "width": "10%", "targets": 5,  "orderable":false},
                        { "width": "10%", "targets": 6,  "orderable":true},
                        { "width": "10%", "targets": 7,  "orderable":true},
                        { "width": "10%", "targets": 8,  "orderable":true},
                        { "width": "5%", "targets":  9,  "orderable":false},
                      ],
          "ajax": {
              "url": url,
              "type": "POST",
              "data": function () {
                  return JSON.stringify(data);
              },
              "contentType": "application/json",
              "dataSrc": ""            	 
          },
         "aaSorting": [[7, 'desc']],
         "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
         "fnInitComplete": function(oSettings, json) {
			self.listUser = json;
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
         "searching" : true,
         dom: 'Bfrtip'
     });
	
	t.on( 'order.dt search.dt', function () {
	    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();
	
}


ShipmentManager.prototype.getPostSearchData = function() {
	var obj = {};
	obj["toProvince"] = $("#provinceTo").val() || '-1';
	obj["fromProvince"] = $("#provinceFrom").val() || '-1';
	obj["toDistrict"] = $("#districtTo").val() || '-1';
	obj["fromDistrict"] = $("#districtFrom").val() || '-1';
	obj["startDate"] = $("#fromDate").val() || '';
	obj["postDate"] = $("#toDate").val() || '';
	obj["goodsTypeId"] = $("#goodsType").val() || '-1';
	return obj;
}

/**
 * @Todo: init button here
 */
ShipmentManager.prototype.initButtonClick = function() {
	var self = this;
	$("#addUserBtn").click(function() {
		bootbox.dialog({
			size : "medium",
            message: $("#myModal").html(),
            title: "Thêm mới",
            className: "modal-darkorange",
            buttons: {
                success: {
                    label: "Lưu",
                    className: "btn-blue",
                    callback: function () { }
                },
                "Hủy": {
                    className: "btn-danger",
                    callback: function () { }
                }
            },
            "backdrop" : "static"
        });
	});
	
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


ShipmentManager.prototype.getUserByUserName = function(username){
	var self = this;
	var obj = null;
	if (self.listUser && self.listUser.length > 0){
		$.each(self.listUser, function (i, item) {
			(item.username == username) && (obj = item);
		});
		return obj;
	}
};

ShipmentManager.prototype.initSelectAction = function(data) {
	//load list province
	var self = this;
//	getListProvince("#provinceTo");
//	getListProvince("#provinceFrom");
//	getListGoodsType("#goodsType");
	getListDealType("#dealType");
	
	if(data != null && data.toProvince != null){
		getListProvince("#provinceTo", data.toProvince);
		getListDistrictByProvinceId(data.toProvince, "#districtTo");
	}else
		getListProvince("#provinceTo");
	
	if(data != null && data.fromProvince != null){
		getListProvince("#provinceFrom", data.fromProvince);
		getListDistrictByProvinceId(data.fromProvince, "#districtFrom");
	}else
		getListProvince("#provinceFrom");
	
	if(data != null && data.goodsTypeId != null)
		getListGoodsType("#goodsType", data.goodsTypeId);
	else
		getListGoodsType("#goodsType");
	if(data != null && data.startDate != null){
		$("#fromDate").datepicker({
		    format: 'dd/mm/yyyy',
		    autoclose: true
		}).datepicker("update", data.startDate); 
	}

	$("#provinceTo").change(function(){
		getListDistrictByProvinceId($("#provinceTo").val(), "#districtTo");
		self.initDataTable();
	});
	$("#provinceFrom").change(function(){
		getListDistrictByProvinceId($("#provinceFrom").val(), "#districtFrom");
		self.initDataTable();
	});
	$("#districtFrom").change(function(){
		self.initDataTable();
	});
	$("#districtTo").change(function(){
		self.initDataTable();
	});
	$("#toDate").change(function(){
		self.initDataTable();
	});
	$("#fromDate").change(function(){
		self.initDataTable();
	});
	$("#goodsType").change(function(){
		self.initDataTable();
	});
};

ShipmentManager.prototype.generateLink = function(row){
	var str ="";
	var id = row.id;
	var editLink = '<a href="./detail?'+id+'" class="skin-text-color"><i class="fa fa-info-circle fa-lg" style="color: #0096F0"></i></a>'
					+ '&nbsp <a href="/trucking/list-trucking?fromProvince='+row.fromDisTrictObj.provinceId+ '&toProvince='+ row.toDisTrictObj.provinceId 
					+ '&goodsTypeId=' + row.goodsType.id + '&startDate=' + getDateFromLongValue(row.startDate) + '" style="color: #090"><i class="fa fa-search fa-lg"></i></a>'
					;
	str += editLink;
	return str;
};

ShipmentManager.prototype.generateLabel = function(code){
	var str ="";
	var editLink = '<code>'+code+' </code>';
	str += editLink;
	return str;
};

ShipmentManager.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}

ShipmentManager.prototype.clearSearchForm = function(){
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

ShipmentManager.prototype.convertProvinceDistrict = function(districtObj){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};
ShipmentManager.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

function convert2TruckingReq(row){
	var req = {};
	if(row == null || row == '') return req;
	req.fromProvince =row.fromDisTrictObj.provinceId;
	req.toProvince =row.toDisTrictObj.provinceId;
	req.goodsTypeId =row.goodsType.id;
	
	return JSON.stringify(req);
}
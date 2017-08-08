function TruckingManager() {
	this.listProvince = [];
}
//init
TruckingManager.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu3").addClass("active");
	
//	self.initSelectAction();
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
		data["truckType"] = '-1';
		data["postDate"] = '';
		// set selected box
		$("#provinceFrom").val(data.fromProvince);
		$("#provinceTo").val(data.toProvince);
		$("#goodsType").val(data.goodsTypeId);
		$("#fromDate").val(data.fromDate);
		$("#districtFrom").val('-1');
		$("#districtTo").val('-1');
		$("#truckType").val('-1');
		$("#toDate").val('');
	}
	// search by data parameter
	self.initDataTable(data);
	self.initSelectAction(data);
}

//search

/**
 * @Todo: init table here
 */
TruckingManager.prototype.initDataTable = function(param){
	var self = this;
	var data = {};
	var url = '/rest_trucking/getListTrucking';
	if(param == null || param.fromProvince == null){
		data = self.getPostSearchData();
	}
	else{
		data = param;
	}
	var table = $("#truckingTable").dataTable();
	table.fnDestroy();
	var t = $('#truckingTable').DataTable({
		"columns": [
			 { "data": "id"},
//			 { "data": "truck.truckCode"},
			 {"render": function ( data, type, row ) {
				 return convertTruckingLabel(row.truck.truckCode);
			 }},
             {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.fromDisTrictObj);
             }},
             {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.toDisTrictObj);
             }},
             { "data": "truck.truckType.name"},
             { "data": "goodsType.name"},
             {"render": function ( data, type, row ) {
            	 return convertWeight(row);
             }},
             {"render": function ( data, type, row ) {
            	 return convertPrice(row);
             }},
             {"render": function ( data, type, row ) {
                 return getDateFromLongValue(row.startDate);
             }},
             {"render": function ( data, type, row ) {
                 return getDateFromLongValue(row.expiredDate);
             }},
             {"render": function ( data, type, row ) {
                 return self.generateLink(row);
             }}
         ],
         "columnDefs": [
                        { "width": "5%", "targets":  0,  "orderable":false},
//                        { "width": "5%", "targets": 1,  "orderable":false},
                        { "width": "13%", "targets": 2,  "orderable":true},
                        { "width": "13%", "targets": 3,  "orderable":true},
                        { "width": "10%", "targets": 4,  "orderable":false},
                        { "width": "10%", "targets": 5,  "orderable":false},
                        { "width": "10%", "targets": 6,  "orderable":true},
                        { "width": "10%", "targets": 7,  "orderable":true},
                        { "width": "10%", "targets": 8,  "orderable":true},
                        { "width": "4%", "targets":  9,  "orderable":false},
                        { "width": "6%", "targets":  10,  "orderable":false}
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
         "aLengthMenu": [
                         [20, 40, 50, -1],
                         [20, 40, 40, "All"]
                     ],
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
         "searching" : false,
         dom: 'Bfrtip'
     });
	
	t.on( 'order.dt search.dt', function () {
	    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	        cell.innerHTML = i+1;
	    } );
	} ).draw();
	
}


TruckingManager.prototype.getPostSearchData = function() {
	var obj = {};
	obj["toProvince"] = $("#provinceTo").val() || '-1';
	obj["fromProvince"] = $("#provinceFrom").val() || '-1';
	obj["toDistrict"] = $("#districtTo").val() || '-1';
	obj["fromDistrict"] = $("#districtFrom").val() || '-1';
	obj["truckType"] = $("#truckType").val() || '-1';
	obj["startDate"] = $("#fromDate").val() || '';
	obj["postDate"] = $("#toDate").val() || '';
	obj["goodsTypeId"] = $("#goodsType").val() || '-1';
	return obj;
}

/**
 * @Todo: init button here
 */
TruckingManager.prototype.initButtonClick = function() {
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


TruckingManager.prototype.getUserByUserName = function(username){
	var self = this;
	var obj = null;
	if (self.listUser && self.listUser.length > 0){
		$.each(self.listUser, function (i, item) {
			(item.username == username) && (obj = item);
		});
		return obj;
	}
};

TruckingManager.prototype.initSelectAction = function(data) {
	//load list province
	var self = this;
	
	if(data != null && data.toProvince != null){
		getListProvince("#provinceTo", data.toProvince, jQuery.i18n.prop('province_to_choose'));
		getListDistrictByProvinceId(data.toProvince, "#districtTo", null, jQuery.i18n.prop('district_to_choose'));
	} else {
		getListProvince("#provinceTo", null, jQuery.i18n.prop('province_to_choose'));
	}
	
	if(data != null && data.fromProvince != null){
		getListProvince("#provinceFrom", data.fromProvince, jQuery.i18n.prop('province_from_choose'));
		getListDistrictByProvinceId(data.fromProvince, "#districtFrom", null, jQuery.i18n.prop('district_from_choose'));
	} else {
		getListProvince("#provinceFrom",null, jQuery.i18n.prop('province_from_choose'));
	}
	getListTruckType("#truckType");
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
	// onchange action
	$("#provinceTo").change(function(){
		getListDistrictByProvinceId($("#provinceTo").val(), "#districtTo", null,jQuery.i18n.prop('district_to_choose') );
		self.initDataTable();
	});
	$("#provinceFrom").change(function(){
		getListDistrictByProvinceId($("#provinceFrom").val(), "#districtFrom", null, jQuery.i18n.prop('district_from_choose'));
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
	$("#truckType").change(function(){
		self.initDataTable();
	});
	$("#goodsType").change(function(){
		self.initDataTable();
	});
};


TruckingManager.prototype.getStatus = function(enabled){
	var str = "";
	if(enabled == true) {
		var str = '<span class="label label-success">Active</span>';
	} else {
		var str = '<span class="label label-default">Deactive</span>';
	}
	return str;
};

TruckingManager.prototype.generateLink = function(row){
	var str ="";
//	var username = row.username;
//	var truckId = row.id;
//	var editLink = '<a href="./detail?'+row.id+'">'
//					+ '<button style="border-radius:50%;font-size:11px;" class="btn-u btn-u-blue" type="button">'
//					+ '<i class="fa fa-info"></i></button></a>';
	var editLink = '<a href="./detail?'+row.id+'" class="skin-text-color"><i class="fa fa-info-circle fa-lg" style="color: #0096F0"></i></a>'
					+ '&nbsp <a href="/shipment/list?fromProvince='+row.fromDisTrictObj.provinceId+ '&toProvince='+ row.toDisTrictObj.provinceId 
					+ '&goodsTypeId=' + row.goodsType.id + '&startDate=' + getDateFromLongValue(row.startDate) + '" style="color: #090"><i class="fa fa-search fa-lg"></i></a>'
					;
	str += editLink;
	return str;
};

TruckingManager.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

TruckingManager.prototype.convertProvinceDistrict = function(districtObj){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};

TruckingManager.prototype.reloadTableData = function(){
	$("#truckingTable").DataTable()
		.ajax.url("/rest_trucking/getListTrucking")
		.load(function(json){
			
		},true);
};

TruckingManager.prototype.clearSearchForm = function(){
	var self = this;
	$("#provinceFrom").val('-1');
	$("#provinceTo").val('-1');
	$("#districtFrom").val('-1');
	$("#districtTo").val('-1');
	$("#fromDate").val('');
	$("#toDate").val('');
	$("#truckType").val('-1');
	$("#goodsType").val('-1');
	
	self.initDataTable();
};

TruckingManager.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}
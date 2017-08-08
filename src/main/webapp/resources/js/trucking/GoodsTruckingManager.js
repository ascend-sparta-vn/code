function GoodsTruckingManager() {
	this.listProvince = [];
	this.listGoods = [];
}

GoodsTruckingManager.prototype.init = function(){
	var self = this;
	self.initDataTable();
	self.initClickButton();
	self.initSelectAction();
}


GoodsTruckingManager.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}

GoodsTruckingManager.prototype.initMode = function() {
	var self = this;
	var approveMode = $("#trucking-approve-mode").val();
	var editMode = $("#trucking-edit-mode").val();
	
	if(approveMode == ROLE_MODE.APPROVE){
		$("#btn-approve-trucking").show();
		$("#btn-cancel-trucking").show();
	}
	
	if(editMode == ROLE_MODE.EDIT) {
		$("#btn-update-trucking").show();
		//show edit
		
	} else {
		$('input').prop("disabled", true);
		$('select').prop('disabled', true);
		$('textarea').prop('disabled', true);
	}
}


/**
 * @Todo: init table here
 */

GoodsTruckingManager.prototype.convertProvinceDistrict = function(districtObj){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};

GoodsTruckingManager.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

GoodsTruckingManager.prototype.getGoodsById = function(id){
	var self = this;
	var obj = {};
	if (self.listGoods && self.listGoods.length > 0){
			$.each(self.listGoods, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

GoodsTruckingManager.prototype.deleteGoodsTrucking = function(id){
	var self = this;
	bootbox.confirm({
		message : jQuery.i18n.prop('common.cofirm.delete'),
		size: "small",
		callback: function (result) {
	        if (result) {
	        	$.ajax({
	        		type : "POST",
	        		contentType : "application/json",
	        		url : "delete-goods-trucking/" + id,
	        		dataType : 'json',
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
	        			showMessage("Xóa thất bại", "error");
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

GoodsTruckingManager.prototype.getStatus = function(status){
	var str = "";
	if(status == 1) {
		var str = '<span class="label label-success">Approved</span>';
	} else {
		var str = '<span class="label label-default">Unapproved</span>';
	}
	return str;
	
};

GoodsTruckingManager.prototype.initDataTable = function(){
	var self = this;
	var table = $("#truckingTable").dataTable();
	table.fnDestroy();
	var url = "/rest_trucking/get-trucking-details";
	var t = $('#truckingTable').DataTable({
         "columns": [
             {"data": "truck.plateNumber"},
			 {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.fromDisTrictObj);
             }},
             {"render": function ( data, type, row ) {
            	 return self.convertProvinceDistrict(row.toDisTrictObj);
             }},
             {"render": function ( data, type, row ) {
            	 return self.getStatus(row.status);
             }},
             {"render": function ( data, type, row ) {
                 return getDateFromLongValue(row.startDate);
             }},
             {"render": function ( data, type, row ) {
                 return self.generateLink(row);
             }}
         ],
         "columnDefs": [
                        { "width": "10%", "targets": 0 },
                        { "width": "20%", "targets": 1 },
                        { "width": "20%", "targets": 2 },
                        { "width": "15%", "targets": 3 },
                        { "width": "5%", "targets": 4 },
                        { "width": "10%", "targets": 5 }
                      ],
         "ajax": {
             "url": url,
             "type": "POST",
             "contentType": "application/json",
             "dataSrc": ""            	 
         },
         "aaSorting": [[1, 'asc']],
         "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
         "iDisplayLength": 10,
         "fnInitComplete": function(oSettings, json) {
			self.listGoods = json;
         },
         "language" : {
				"paginate" : {
					"previous" : JQUERY_DATA_TABLE.LANGUAGE.PREVIOUS_PAGE,
					"next" : JQUERY_DATA_TABLE.LANGUAGE.NEXT_PAGE,
					
				},
				"sZeroRecords": JQUERY_DATA_TABLE.LANGUAGE.SZERORECORDS,
				"sInfoFiltered": "",
				"processing":     JQUERY_DATA_TABLE.LANGUAGE.PROCESSING,
				"search": JQUERY_DATA_TABLE.LANGUAGE.SEARCH,
				"lengthMenu" : JQUERY_DATA_TABLE.LANGUAGE.LENGTHMENU,
				"info": JQUERY_DATA_TABLE.LANGUAGE.INFO,
				"infoEmpty":JQUERY_DATA_TABLE.LANGUAGE.INFOEMPTY
			},
     });
	
}


GoodsTruckingManager.prototype.getUserByUserName = function(username){
	var self = this;
	var obj = null;
	if (self.listUser && self.listUser.length > 0){
		$.each(self.listUser, function (i, item) {
			(item.username == username) && (obj = item);
		});
		return obj;
	}
};

GoodsTruckingManager.prototype.initSelectAction = function() {
	getListProvince("#fromProvince", $("#trucking-from-province").val());
	getListProvince("#toProvince", $("#trucking-to-province").val());
	getListGoodsType("#goodsType", $("#trucking-goodstype").val());
	
	$("#fromProvince").change(function(){
		var frmProvince = $("#fromProvince").val();
		getListDistrictByProvinceId(frmProvince, "#fromDistrict", $("#trucking-from-district").val());
	});
	
	$("#toProvince").change(function(){
		var toProvince = $("#toProvince").val();
		getListDistrictByProvinceId(toProvince, "#toDistrict", $("#trucking-to-district").val());
	});
	
	$("#weightUnit").val($("#trucking-weightunit").val());
	$("#priceUnit").val($("#trucking-pricetunit").val());
	$("#agency").val($("#trucking-agency").val());
	$("#truckId").val($("#your-trucking-id").val());
	$("#fromDetailAddress").val('');
	$("#fromDetailAddress").val($("#trucking-from-address").val());
	$("#toDetailAddress").val($("#trucking-to-address").val());
	$("#description").val($("#trucking-to-description").val());
	
	if($("#trucking-status").val() == 1) {
		$("#status").html('<span class="label label-success">' + jQuery.i18n.prop('status.approved') + '</span>');
	} else {
		$("#status").html('<span class="label label-default">' + jQuery.i18n.prop('status.unapproved') + '</span>');
	}
	
	$("#startDate").datepicker({
	    format: 'dd/mm/yyyy',
	    autoclose: true
	}); 
	
	$("#expiredDate").datepicker({
	    format: 'dd/mm/yyyy',
	    autoclose: true
	});
};


GoodsTruckingManager.prototype.getFormData = function(){
	var self = this;
	var obj = {};
	obj.id = $("#trucking-id").val();
	obj.truckId = $("#truckId").val();
	obj.goodsTypeId = $("#goodsType").val();
	obj.fromDistrict = $("#fromDistrict").val();
	obj.toDistrict = $("#toDistrict").val();
	obj.distance = $("#roadLength").val();
	obj.weightString = $("#weight").val();
	obj.price = $("#price").val();
	obj.weightUnit = $("#weightUnit").val();
	obj.priceUnit = $("#priceUnit").val();
	obj.fromDetailAddress = $("#fromDetailAddress").val();
	obj.toDetailAddress = $("#toDetailAddress").val();
	obj.startDate = $("#startDate").val();
	obj.expiredDate = $("#expiredDate").val();
	obj.description = $("#description").val();
	obj.agency = $("#agency").val();
	return obj;
};


GoodsTruckingManager.prototype.generateLink = function(row){
	var str ="";
	var id = row.id;
	var editLink = '<a href="#" onclick="editGoodsTrucking('+id+')" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i> Sửa</a>';
	var deleteLink = '<a href="#" onclick="deleteGoodsTrucking(\''+id+'\')" class="btn btn-default btn-xs black"><i class="fa fa-trash-o"></i> Xóa</a>';
	
	str += editLink;
	str += " " + deleteLink;
	return str;
};

GoodsTruckingManager.prototype.validateFormData = function(post){
	if(post == null) return false;
	if(post.name == null || post.name == ''){
		showMessage('Tên lô hàng không hợp lệ', 'error');
		return false;
	}
	if(post.goodsTypeId == null || post.goodsTypeId == '-1'){
		showMessage('Loại hàng hóa không hợp lệ', 'error');
		return false;
	}
	if(post.fromDistrict == null || post.fromDistrict == '-1'){
		showMessage('Quận/huyện chở đi không hợp lệ', 'error');
		return false;
	}
	if(post.toDistrict == null || post.toDistrict == '-1'){
		showMessage('Quận/huyện chở đến không hợp lệ', 'error');
		return false;
	}
	if(post.startDate == null || post.startDate == ''){
		showMessage('Ngày bắt đầu không hợp lệ', 'error');
		return false;
	}
	if(post.expiredDate == null || post.expiredDate == ''){
		showMessage('Ngày hết hiệu lực không hợp lệ', 'error');
		return false;
	}
	return true;
}

GoodsTruckingManager.prototype.initClickButton = function(){

	var self = this;
	$("#profile-menu-5").addClass("active");
	$("#btn-update-trucking").click(function(){
		var post = self.getFormData();
//		if(!self.validateFormData(post)){
//			return;
//		}
		var url = "../update-goods-trucking";
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : url,
			data : JSON.stringify(post),
			dataType : 'json',
			success : function(data) {
				if (data.code == RESPONSE.CODE.SUCCESS) {
					showMessage(data.msg, "success");
				} else {
					showMessage(data.msg, "error");
				}
				
			},
			error : function(e) {
				showMessage('ERROR: /rest_shipment/addShipmentPost', 'error');
				console.log("ERROR addShipmentPost: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	});
	
	//approve
	$("#btn-approve-trucking").click(function(){
		self.approve(DATA_STATUS.APPROVE);
	});
	
	//cancel
	$("#btn-cancel-trucking").click(function(){
		self.approve(DATA_STATUS.NO_APPROVE);
	});
	
	//come back previous
	$("#btn-comeback").click(function(){
		window.location.href="../manage-trucking";
	});
}

GoodsTruckingManager.prototype.approve = function(status){
	var url = "../approve-goods-trucking/" + $("#trucking-id").val() + "/" + status;
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : url,
		dataType : 'json',
		success : function(data) {
			if (data.code == RESPONSE.CODE.SUCCESS) {
				showMessage(data.msg, "success");
			} else {
				showMessage(data.msg, "error");
			}
			
			if(status == 1) {
				$("#status").html('<span class="label label-success">' + jQuery.i18n.prop('status.approved') + '</span>');
			} else {
				$("#status").html('<span class="label label-default">' + jQuery.i18n.prop('status.unapproved') + '</span>');
			}
		},
		error : function(e) {
			showMessage('ERROR: /rest_shipment/addShipmentPost', 'error');
			console.log("ERROR addShipmentPost: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}

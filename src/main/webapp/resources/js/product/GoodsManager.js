function GoodsManager() {
	this.listProvince = [];
	this.listGoods = [];
}

GoodsManager.prototype.init = function(){
	var self = this;
	self.initDataTable();
	self.initClickButton();
	self.initSelectAction();
}


GoodsManager.prototype.initProvince = function(id, name) {
	var self = this;
	var obj = {};
	obj.id = id;
	obj.name = name;
	self.listProvince.push(obj);
}

GoodsManager.prototype.initMode = function() {
	var self = this;
	var approveMode = $("#goods-approve-mode").val();
	var editMode = $("#goods-edit-mode").val();
	
	if(approveMode == ROLE_MODE.APPROVE){
		$("#btn-approve-goods").show();
		$("#btn-cancel-goods").show();
	}
	
	if(editMode == ROLE_MODE.EDIT) {
		$("#btn-update-goods").show();
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

GoodsManager.prototype.convertProvinceDistrict = function(districtObj){
	var self = this;
	var districtName = districtObj.name || '';
	var province = self.getProvinceId(districtObj.provinceId) || '';
	return province.name + ', ' + districtName;
	
};

GoodsManager.prototype.getProvinceId = function(id){
	var self = this;
	var obj = {};
	if (self.listProvince && self.listProvince.length > 0){
			$.each(self.listProvince, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

GoodsManager.prototype.getGoodsById = function(id){
	var self = this;
	var obj = {};
	if (self.listGoods && self.listGoods.length > 0){
			$.each(self.listGoods, function (i, item) {
			(item.id == id) && (obj = item);
	});
	return obj;
	}
};

GoodsManager.prototype.deleteGoods = function(id){
	var self = this;
	bootbox.confirm({
		message : jQuery.i18n.prop('common.cofirm.delete'),
		size: "small",
		callback: function (result) {
	        if (result) {
	        	$.ajax({
	        		type : "POST",
	        		contentType : "application/json",
	        		url : "delete-goods/" + id,
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

GoodsManager.prototype.getStatus = function(status){
	var str = "";
	if(status == 1) {
		var str = '<span class="label label-success">Approved</span>';
	} else {
		var str = '<span class="label label-default">Unapproved</span>';
	}
	return str;
	
};

GoodsManager.prototype.initDataTable = function(){
	var self = this;
	var table = $("#shipmentTable").dataTable();
	table.fnDestroy();
	var url = "/rest_shipment/getGoods";
	var t = $('#shipmentTable').DataTable({
         "columns": [
			 { "data": "name"},
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


GoodsManager.prototype.getUserByUserName = function(username){
	var self = this;
	var obj = null;
	if (self.listUser && self.listUser.length > 0){
		$.each(self.listUser, function (i, item) {
			(item.username == username) && (obj = item);
		});
		return obj;
	}
};

GoodsManager.prototype.initSelectAction = function() {
	getListProvince("#fromProvince", $("#goods-from-province").val());
	getListProvince("#toProvince", $("#goods-to-province").val());
	getListGoodsType("#goodsType", $("#goods-to-goodstype").val());
	getListDealType("#dealType", $("#goods-to-dealtype").val());
	
	$("#fromProvince").change(function(){
		var frmProvince = $("#fromProvince").val();
		getListDistrictByProvinceId(frmProvince, "#fromDistrict", $("#goods-from-district").val());
	});
	
	$("#toProvince").change(function(){
		var toProvince = $("#toProvince").val();
		getListDistrictByProvinceId(toProvince, "#toDistrict", $("#goods-to-district").val());
	});
	
	$("#weightUnit").val($("#goods-weightunit").val());
	$("#priceUnit").val($("#goods-pricetunit").val());
	$("#agency").val($("#goods-agency").val());
	
	if($("#goods-status").val() == 1) {
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


GoodsManager.prototype.getFormData = function(){
	var self = this;
	var obj = {};
	obj.id = $("#goods-id").val();
	obj.dealTypeId = $("#dealType").val();
	obj.name = $("#name").val();
	obj.code = $("#code").val();
	obj.goodsTypeId = $("#goodsType").val();
	obj.fromDistrict = $("#fromDistrict").val();
	obj.toDistrict = $("#toDistrict").val();
	obj.distance = $("#roadLength").val();
	obj.weight = $("#weight").val();
	obj.price = $("#price").val();
	obj.weightUnit = $("#weightUnit").val();
	obj.priceUnit = $("#priceUnit").val();
	obj.fromDetailAddress = $("#fromDetailAddress").val();
	obj.toDetailAddress = $("#toDetailAddress").val();
	obj.startDate = $("#startDate").val();
	obj.expiredDate = $("#expiredDate").val();
	return obj;
};


GoodsManager.prototype.generateLink = function(row){
	var str ="";
	var id = row.id;
	var editLink = '<a href="#" onclick="editGoods('+id+')" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i> Sửa</a>';
	var deleteLink = '<a href="#" onclick="deleteGoods(\''+id+'\')" class="btn btn-default btn-xs black"><i class="fa fa-trash-o"></i> Xóa</a>';
	
	str += editLink;
	str += " " + deleteLink;
	return str;
};

GoodsManager.prototype.validateFormData = function(post){
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

GoodsManager.prototype.initClickButton = function(){

	var self = this;
	$("#profile-menu-6").addClass("active");
	$("#btn-update-goods").click(function(){
		var post = self.getFormData();
		if(!self.validateFormData(post)){
			return;
		}
		var url = "../update-goods";
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
	$("#btn-approve-goods").click(function(){
		self.approve(DATA_STATUS.APPROVE);
	});
	
	//cancel
	$("#btn-cancel-goods").click(function(){
		self.approve(DATA_STATUS.NO_APPROVE);
	});
	
	//come back previous
	$("#btn-comeback").click(function(){
		window.location.href = "../manage-goods";
	});
}

GoodsManager.prototype.approve = function(status){
	var url = "../approve-goods/" + $("#goods-id").val() + "/" + status;
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

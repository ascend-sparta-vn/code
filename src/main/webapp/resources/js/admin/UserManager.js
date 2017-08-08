function UserManager() {
}
//init
UserManager.prototype.init = function(){
	var self = this;
	self.initDataTable();
	self.initButtonClick();
	self.initSelectAction();
}

//search

/**
 * @Todo: init table here
 */
UserManager.prototype.initDataTable = function(){
	var self = this;
	var table = $("#userTable").dataTable();
	table.fnDestroy();
	var url = "/admin/getDanhSachUser" ;
	var t = $('#userTable').DataTable({
         "columns": [
			 { "data": "username"},
			 {"render": function ( data, type, row ) {
                 return self.getRoleLabel(row.listRole);
             }},
             { "data": "createdDate"},
             { "data": "lastSignInDate"},
             {"render": function ( data, type, row ) {
                 return self.getStatus(row.enabled);
             }},
             {"render": function ( data, type, row ) {
                 return self.generateLink(row);
             }}
         ],
         "columnDefs": [
                        { "width": "10%", "targets": 0 },
                        { "width": "10%", "targets": 1 },
                        { "width": "20%", "targets": 2 },
                        { "width": "20%", "targets": 3 },
                        { "width": "10%", "targets": 4 },
                        { "width": "30%", "targets": 5 }
                      ],
         "ajax": {
             "url": url,
             "type": "POST",
             "contentType": "application/json",
             "dataSrc": ""            	 
         },
         "aaSorting": [[0, 'asc']],
         "aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
         "iDisplayLength": 10,
         "fnInitComplete": function(oSettings, json) {
			self.listUser = json;
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


/**
 * @Todo: init button here
 */
UserManager.prototype.initButtonClick = function() {
	var self = this;
	$("#addUserBtn").click(function() {
		bootbox.dialog({
			size : "medium",
            message: $("#myModal").html(),
            title: jQuery.i18n.prop('manageUser.modalHeaderAdd'),
            className: "modal-darkorange",
            buttons: {
            	success: {
            		label: jQuery.i18n.prop('common.saveBtn'),
                    className: "btn-primary",
                    callback: function () {
                    	self.saveOrEditUser('addUser', function(result) {
                    		if(result) bootbox.hideAll();
                    	});
                    	return false;
                    }
                },
                cancel: {
                	label : jQuery.i18n.prop('common.cancelBtn'),
                    className: "btn-default",
                    callback: function () { }
                }
            },
            "backdrop" : "static"
        }).on('shown.bs.modal', function() {
        	$("#passwordLabel", '.bootbox').html(jQuery.i18n.prop('manageUser.modalPassword'));
        	$("#passwordModal", '.bootbox').prop("placeholder", jQuery.i18n.prop('manageUser.modalPasswordPlaceholder'));
        });
	});
	
	$("#myModal").bind("show", function() {
		var user = self.user;
		$("#usernameModal").val(user.username);
		$("#passwordModal").val("");
		$("#roleModal").val(user.listRole);
		$("#enabledModal").val(user.enabled);
	});
	
};


UserManager.prototype.getPostData = function() {
	var user = {};
	user["username"] = $("#usernameModal",'.bootbox').val();
	user["password"] = $("#passwordModal",'.bootbox').val();
	user["enabled"] = $("#enabledModal",'.bootbox').val();
	user["roleModal"] = $("#roleModal",'.bootbox').val();
	user["userId"] = $("#userIdModal",'.bootbox').val();
	return user;
}

UserManager.prototype.getUserByUserName = function(username){
	var self = this;
	var obj = null;
	if (self.listUser && self.listUser.length > 0){
		$.each(self.listUser, function (i, item) {
			(item.username == username) && (obj = item);
		});
		return obj;
	}
};

UserManager.prototype.initSelectAction = function() {
};


UserManager.prototype.deleteUser = function(user) {
	var self = this;
	bootbox.confirm({
		message : jQuery.i18n.prop('common.cofirm.delete'),
		size: "small",
		callback: function (result) {
	        if (result) {
	        	$.ajax({
	        		type : "POST",
	        		contentType : "application/json",
	        		url : "deleteUser",
	        		data : JSON.stringify(user.id),
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
	        			showMessage("Xóa người dùng thất bại", "error");
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

UserManager.prototype.editUser = function(user, role, enabled){
	console.log(user);
	var self = this;
	self.user = user;
	//fill du lieu vao modal
	
	var dialog = bootbox.dialog({
		size : "medium",
		backdrop : "static",
        message: $("#myModal").html(),
        title: jQuery.i18n.prop('manageUser.modalHeaderEdit'),
        className: "modal-darkorange",
        buttons: {
        	save: {
        		label: jQuery.i18n.prop('common.saveBtn'),
                className: "btn-primary",
                callback: function () {
                	self.saveOrEditUser('editUser', function(result) {
                		if(result) bootbox.hideAll();
                	});
                	return false;
                }
            },
            remove: {
            	label: jQuery.i18n.prop('common.deleteBtn'),
                className: "btn-danger",
                callback: function () { 
                	self.deleteUser(user);
                }
            },
            cancel: {
            	label: jQuery.i18n.prop('common.cancelBtn'),
                className: "btn-default",
                callback: function () { }
            }
        },
    }).on('shown.bs.modal', function() {
    	//fill du lieu vao modal
    	$("#usernameModal",'.bootbox').prop("disabled", true);
    	$("#usernameModal",'.bootbox').val(user.username);
    	$("#roleModal",'.bootbox').val(role);
    	$("#enabledModal",'.bootbox').val(enabled);
    	$("#userIdModal", '.bootbox').val(user.id);
    	$("#passwordLabel", '.bootbox').html(jQuery.i18n.prop('manageUser.modalPasswordReset'));
    	$("#passwordModal", '.bootbox').prop("placeholder", jQuery.i18n.prop('manageUser.modalPasswordResetPlaceholder'));
    });
	
	
};

UserManager.prototype.getRoleLabel = function(listRole){
	var roleArray = listRole.split(",");
	var str = "";
	for( var i = 0 ; i < roleArray.length ; i++) {
		if(roleArray[i] == 'ROLE_ADMIN') {
			var label = '<span class="label label-orange">Admin</span>';
			str += " " + label;
		} else if(roleArray[i] == 'ROLE_CLIENT') {
			var label = '<span class="label label-info">Customer</span>';
			str += " " + label;
		}
	}
	return str;
};

UserManager.prototype.getStatus = function(enabled){
	var str = "";
	if(enabled == true) {
		var str = '<span class="label label-success">Active</span>';
	} else {
		var str = '<span class="label label-default">Deactive</span>';
	}
	return str;
	
};

UserManager.prototype.generateLink = function(row){
	var str ="";
	var username = row.username;
	
	var editText = jQuery.i18n.prop('common.updateBtn');
	var viewText = jQuery.i18n.prop('common.viewBtn');
	
	
	
	var editLink = '<a href="#" onclick="editUser(\''+username+'\',\''+row.listRole+'\', \''+row.enabled+'\')" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i>'+editText+'</a>';
	var viewLink = '<a href="/admin/view-user/'+row.id+'" class="btn btn-default btn-xs black"><i class="icon-info"></i> '+viewText+'</a>';
	
	str += editLink;
	str += " " + viewLink;
	return str;
};

UserManager.prototype.saveOrEditUser = function(action, callbackFunction) {
	var self = this;
	var user = self.getPostData();
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : action,
		data : JSON.stringify(user),
		dataType : 'json',
		//timeout : 30000,
		success : function(data) {
			console.log(data);
			if (data.code == RESPONSE.CODE.SUCCESS) {
				showMessage(data.msg, "success");
				self.initDataTable();
				callbackFunction(true);
			} else {
				showMessage(data.msg, "error");
				callbackFunction(false);
			}
			
		},
		error : function(e) {
			console.log("ERROR: ", e);
			showMessage(e, "error");
			callbackFunction(false);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}

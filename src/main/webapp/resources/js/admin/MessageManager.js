function MessageManager() {
}
//init
MessageManager.prototype.init = function(){
	var self = this;
	self.initDataTable();
}

//search

/**
 * @Todo: init table here
 */
MessageManager.prototype.initDataTable = function(){
	var self = this;
	var table = $("#messageTable").dataTable();
	table.fnDestroy();
	var url = "/admin/getListMessages" ;
	var t = $('#messageTable').DataTable({
         "columns": [
			 {"render": function ( data, type, row ) {
                 return decodeHtml(row.name);
             }},
			 { "data": "email"},
             {"render": function ( data, type, row ) {
                 return getFullDateFromLongValue(row.createDate);
             }},
             {"render": function ( data, type, row ) {
                 return decodeHtml(row.message);
             }},
             {"render": function ( data, type, row ) {
                 return self.generateLink(row);
             }}
         ],
         "columnDefs": [
                        { "width": "18%", "targets": 0 },
                        { "width": "10%", "targets": 1 },
                        { "width": "20%", "targets": 2 },
                        { "width": "50%", "targets": 3 },
                        { "width": "2%", "targets": 4 }
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

MessageManager.prototype.deleteMessage = function(messageId) {
	var self = this;
	bootbox.confirm({
		message : jQuery.i18n.prop('common.cofirm.delete'),
		size: "small",
		callback: function (result) {
	        if (result) {
	        	$.ajax({
	        		type : "POST",
	        		contentType : "application/json",
	        		url : "deleteMessage",
	        		data : JSON.stringify(messageId),
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


MessageManager.prototype.getStatus = function(enabled){
	var str = "";
	if(enabled == true) {
		var str = '<span class="label label-success">Active</span>';
	} else {
		var str = '<span class="label label-default">Deactive</span>';
	}
	return str;
	
};

MessageManager.prototype.generateLink = function(row){
	var str ="";
	var deleteText = jQuery.i18n.prop('common.deleteBtn');
	var deleteLink = '<a href="#" onclick="deleteMessage('+row.id+')" class="btn btn-warning btn-xs blue"><i class="fa fa-warning"></i> '+deleteText+' </a>';
	str += deleteLink;
	return str;
};


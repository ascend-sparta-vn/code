function MemberManager() {
}
//init
MemberManager.prototype.init = function(){
	var self = this;
	
	$("li .active").removeClass("active");
	$("#menu2").addClass("active");
	
	self.initDataTable();
	self.initButtonClick();
		
}

//search

/**
 * @Todo: init table here
 */
MemberManager.prototype.initDataTable = function(){
	var self = this;
	var data = self.getPostSearchData();
	var table = $("#memberTable").dataTable();
	table.fnDestroy();
	var url = "/member_rest/searchListCommodity" ;
	var t = $('#memberTable').DataTable({
		"columns": [
			 { "data": "ownerName"},
			 { "data": "ownerName"},
             { "data": "ownerPhoneNumber"},
             { "data": "ownerAddress"},
             {"render": function ( data, type, row ) {
                 return convertOwnerStatus(row.ownerStatus);
             }},
             {"render": function ( data, type, row ) {
                 return self.generateAccountLink(row);
             },sClass: "text-center"}
         ],
         "columnDefs": [
                        { "width": "5%", "targets":  0,  "orderable":false},
//                        { "width": "10%", "targets": 1,  "orderable":false},
//                        { "width": "13%", "targets": 2,  "orderable":true},
                        { "width": "30%", "targets": 3,  "orderable":true},
                        { "width": "10%", "targets": 4,  "orderable":false},
                        { "width": "10%", "targets": 5,  "orderable":false},
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
         "aaSorting": [[1, 'desc']],
         "aLengthMenu": [
                         [20, 40, 50, -1],
                         [20, 40, 40, "All"]
                     ],
         "fnInitComplete": function(oSettings, json) {
			self.listOwnerTruck = json;
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


MemberManager.prototype.getPostSearchData = function() {
	var obj = {};
	obj["ownerName"] = $("#ownerName").val();
	obj["ownerPhoneNumber"] = $("#ownerPhoneNumber").val();
	obj["ownerStatus"] = $("#ownerStatus").val();
	return obj;
}

/**
 * @Todo: init button here
 */
MemberManager.prototype.initButtonClick = function() {
	var self = this;
	
	//btn search
	$("#searchMemberBtn").click(function(){
		self.reloadTableData();
	});
	
	//clearSearchMemberBtn
	$("#clearSearchMemberBtn").click(function(){
		self.clearSearchForm();
	});
	
	//backSearchMemberBtn
	$("#backSearchMemberBtn").click(function(){
		
	});
	
};


MemberManager.prototype.generateAccountLink = function(row){
	var str ="";
//	var username = row.username;
	var id = row.ownerAccountId;
	var editLink = '<a href="./detail?'+id+'">'
					+ '<button style="border-radius:50%;font-size:11px;" class="btn-u btn-u-blue" type="button"> '
					+ '<i class="fa fa-info"></i></button></a>';
	str += editLink;
	return str;
};

MemberManager.prototype.reloadTableData = function(){
	var self = this;
	var data = self.getPostSearchData();
	var url = "/member_rest/searchListCommodity";
	$("#memberTable").DataTable({
		"iDisplayStart": 0,
        "iDisplayLength": 50,
        "bPaginate": true,
        "serverSide": true,
         /* and all others settings others than default */
	    "ajax":
	        {
	            "url": url,
	            "type": "POST",
	            'data': function () {
                    return JSON.stringify(data);
                },
                "contentType": "application/json",
	        },
	    "destroy" : true,
	    "aaSorting": [[1, 'desc']],
        "aLengthMenu": [
                        [20, 40, 50, -1],
                        [20, 40, 40, "All"]
                    ],
        "fnInitComplete": function(oSettings, json) {
			self.listOwnerTruck = json;
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
        "searching" : false,
        dom: 'Bfrtip'
	});
	
//	$("#memberTable").DataTable().ajax.url(url)
//		.load(function(json){
//			self.listOwnerTruck = json;
//		},true);
};


MemberManager.prototype.clearSearchForm = function(){
	$("#ownerName").val('');
	$("#ownerPhoneNumber").val('');
	$("#ownerStatus").val('-1');
};


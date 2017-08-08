function TruckingManager1() {
    this.listProvince = [];
}
//init
TruckingManager1.prototype.init = function(){
    var self = this;
    var currentPage = $("#currentPage").val();
    if(typeof currentPage == 'undefined') {
        currentPage = 1;
    }
    var size = $("#size").val();
    if(typeof size != 'undefined') {
        $("#pageSize").val(size);
    }

    $("li .active").removeClass("active");
    $("#menu3").addClass("active");

//	self.initSelectAction();
    self.initButtonClick();
    // get param from here, else return all
//	var param = self.initParam();
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
    //self.initDataTable(data);
    self.initDataContent(data);
    self.initSelectAction(data);
}

//search

/**
 * @Todo: init search content
 */
TruckingManager1.prototype.initDataContent = function(param) {
    console.log("initDataContent");

    var self = this;
    var data = {};
    var url = '/rest_trucking/getListTrucking';
    if(param == null || param.fromProvince == null){
        data = self.getPostSearchData();
    }
    else{
        data = param;
    }


    //push data
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : url,
        data : JSON.stringify(data),
        dataType : 'json',
        success : function(response) {
//			console.log(response);
//			var a = [];
//			var listTrucking = response.listTrucking;
//			for(var i = 0; i< 12; i++) {
//				for(var j = 0 ; j < listTrucking.length; j++) {
//					a.push(listTrucking[j]);
//				}
//			}
//			response.listTrucking = a;
//			response.total = a.length;
            response.listTrucking = filterListTrucking(response.listTrucking, self.listGoodsType, "goodsType");
            response.listTrucking = filterListTrucking(response.listTrucking, self.listTruckType, "truckType");

            self.fireContentData(response.listTrucking);
            self.firePaging(response.listTrucking.length);
        },
        error : function(e) {
            showMessage(e, "error");
        },
        done : function(e) {
            console.log("DONE");
        }
    });

};

TruckingManager1.prototype.firePaging = function(total){
    $("#totalResult").html(total);
    var currentPage = Number($("#currentPage").val());
    var next = currentPage + 1;
    var previous = currentPage - 1;
    var pageSize = $("#pageSize").val();
    var numberOfPage = total / pageSize;
    if(numberOfPage < 1) numberOfPage = 1;

    var page_first = jQuery.i18n.prop('NEXT_PAGE');
    var page_last = jQuery.i18n.prop('PREVIOUS_PAGE');

    var pageContainer = $('#pagingContent');
    pageContainer.empty();
    pageContainer.append('<li><a href="./list-trucking1?page=1&size='+pageSize+'">'+ page_first +'</a></li>');
    if((numberOfPage > 1) && (previous > 0)) {
        pageContainer.append('<li><a href="./list-trucking1?page='+previous+'&size='+pageSize+'"><i class="fa fa-angle-left"></i></a></li>');
    }
    for (var i = 0; i < numberOfPage ; i++) {
        if((i+1) == currentPage) {
            pageContainer.append('<li class="active"><a href="./list-trucking1?page='+(i+1)+'&size='+pageSize+'">'+(i+1)+'</a></li>');
        } else {
            pageContainer.append('<li><a href="./list-trucking1?page='+(i+1)+'&size='+pageSize+'">'+(i+1)+'</a></li>');
        }

    }
    if((numberOfPage > 1) && (currentPage != numberOfPage)) {

        pageContainer.append('<li><a href="./list-trucking1?page='+next+'&size='+pageSize+'"><i class="fa fa-angle-right"></i></a></li>');
    }
    pageContainer.append('<li><a href="./list-trucking1?page='+(Math.floor(numberOfPage))+'&size='+pageSize+'">'+ page_last +'</a></li>');

    if(total == 0) pageContainer.empty();
}

TruckingManager1.prototype.fireContentData = function(listTrucking){
    var self = this;
    //draw list data
    $("#contentData").empty();
    for (var i=0 ; i < listTrucking.length ; i++) {
        var trucking = listTrucking[i];
        var divContainer = $('<div class="list-product-description product-description-brd margin-bottom-30"></div>');
        var row = $('<div class="row"/>');

		/*
		 * draw left column
		 */
        var leftRow = $('<div class="col-sm-4" style="border-right: 1px solid #eee; margin-top: 5px"/>');
        var leftRowChild = $('<div class="overflow-h margin-bottom-5" />')

        var left_ul = $('<ul class="list-inline overflow-h"/>');
        var left_li1 = $('<li><h4 class="title-price"><a href="shop-ui-inner.html"><code>'+trucking.truck.truckCode+'</code></a></h4></li>');
        var left_li2 = $('<li class="pull-right" style="margin-top:8px;"><span>'+ jQuery.i18n.prop('view_departure_time') +': '+convertLongDate(trucking.startDate)+'</span></li>');
        var left_li3 = $('<li><h4 class="title-price" style="font-weight:bold"><a href="shop-ui-inner.html">'+trucking.title+'</a></h4></li>');
        left_ul.append(left_li1);
        left_ul.append(left_li2);
        left_ul.append(left_li3);

        var left_div = $('<div class="margin-bottom-10"/>');
        var left_span1 = $('<span class="label label-sea"><i class="fa fa-truck"></i> '+trucking.truck.truckType.name+'</span>');
        var left_span2 = $('<span class="label label-default" style="margin-left:3px;"><i class="fa fa-dropbox"></i>	'+trucking.goodsType.name+'</span>');
        left_div.append(left_span1);
        left_div.append(left_span2);

        leftRowChild.append(left_ul);
        leftRowChild.append(left_div);
        leftRow.append(leftRowChild);
        row.append(leftRow);

		/*
		 * draw right column
		 */
        var rightRow = $('<div class="col-sm-8 product-description"/>');
        var rightRowChild = $('<div class="overflow-h margin-bottom-5"/>');

        var right_ul = $('<ul class="list-inline overflow-h">');
        right_ul.append('<li><h4 class="title-price" style="font-weight:bold"><span>'+self.convertProvinceDistrict(trucking.fromDisTrictObj)+'</span> -&gt; <span>'+self.convertProvinceDistrict(trucking.toDisTrictObj)+'</span></h4></li>');

        var right_div1 = $('<div class="margin-bottom-10">');
        right_div1.append('<sptan class="title-price margin-right-10">'+ jQuery.i18n.prop('view_price') +': </span>');
        right_div1.append('<span class="title-price line-red">'+convertPrice(trucking)+'</span>');

        var right_div2 = $('<div class="margin-bottom-10">');
        right_div2.append('<span class="title-price margin-right-10">'+ jQuery.i18n.prop('view_weight') +': </span> <span class="title-price line-red">'+convertWeight(trucking)+'</span>');

        var view_detail = jQuery.i18n.prop('view_detail');

        var right_paragraph = $('<p class="margin-bottom-20">'+ jQuery.i18n.prop('view_description') +': '+trucking.description+'</p>');
        var btn = $('<button type="button" class="btn btn-sm btn-u-sea-shop btn-primary" onclick="window.location.href=\'./detail?'+trucking.id+'\'">'+ view_detail +'</button>');

        rightRowChild.append(right_ul);
        rightRowChild.append(right_div1);
        rightRowChild.append(right_div2);
        rightRowChild.append(right_paragraph);
        rightRowChild.append(btn);
        rightRow.append(rightRowChild);
        row.append(rightRow);


        divContainer.append(row);
        $("#contentData").append(divContainer);
    }

    if (listTrucking.length == 0) {
        var notFound = 'Không tìm thấy bản ghi nào';
        $("#contentData").append("<h4>"+notFound+"</h4>");
    }

};

/**
 * @Todo: init table here
 */
TruckingManager1.prototype.initDataTable = function(param){
//	var self = this;
//	var data = {};
//	var url = '/rest_trucking/getListTrucking';
//	if(param == null || param.fromProvince == null){
//		data = self.getPostSearchData();
//	}
//	else{
//		data = param;
//	}
//	var table = $("#truckingTable").dataTable();
//	table.fnDestroy();
//	var t = $('#truckingTable').DataTable({
//		"columns": [
//			 { "data": "id"},
////			 { "data": "truck.truckCode"},
//			 {"render": function ( data, type, row ) {
//				 return convertTruckingLabel(row.truck.truckCode);
//			 }},
//             {"render": function ( data, type, row ) {
//            	 return self.convertProvinceDistrict(row.fromDisTrictObj);
//             }},
//             {"render": function ( data, type, row ) {
//            	 return self.convertProvinceDistrict(row.toDisTrictObj);
//             }},
//             { "data": "truck.truckType.name"},
//             { "data": "goodsType.name"},
//             {"render": function ( data, type, row ) {
//            	 return convertWeight(row);
//             }},
//             {"render": function ( data, type, row ) {
//            	 return convertPrice(row);
//             }},
//             {"render": function ( data, type, row ) {
//                 return getDateFromLongValue(row.startDate);
//             }},
//             {"render": function ( data, type, row ) {
//                 return getDateFromLongValue(row.expiredDate);
//             }},
//             {"render": function ( data, type, row ) {
//                 return self.generateLink(row);
//             }}
//         ],
//         "columnDefs": [
//                        { "width": "5%", "targets":  0,  "orderable":false},
////                        { "width": "5%", "targets": 1,  "orderable":false},
//                        { "width": "13%", "targets": 2,  "orderable":true},
//                        { "width": "13%", "targets": 3,  "orderable":true},
//                        { "width": "10%", "targets": 4,  "orderable":false},
//                        { "width": "10%", "targets": 5,  "orderable":false},
//                        { "width": "10%", "targets": 6,  "orderable":true},
//                        { "width": "10%", "targets": 7,  "orderable":true},
//                        { "width": "10%", "targets": 8,  "orderable":true},
//                        { "width": "4%", "targets":  9,  "orderable":false},
//                        { "width": "6%", "targets":  10,  "orderable":false}
//                      ],
//          "ajax": {
//              "url": url,
//              "type": "POST",
//              "data": function () {
//                  return JSON.stringify(data);
//              },
//              "contentType": "application/json",
//              "dataSrc": ""
//          },
//         "aaSorting": [[7, 'desc']],
//         "aLengthMenu": [
//                         [20, 40, 50, -1],
//                         [20, 40, 40, "All"]
//                     ],
//         "fnInitComplete": function(oSettings, json) {
//			self.listUser = json;
//			console.log(json);
//
//         },
//         "language" : {
//				"paginate" : {
//					"previous" : JQUERY_DATA_TABLE.LANGUAGE.PREVIOUS_PAGE,
//					"next" : JQUERY_DATA_TABLE.LANGUAGE.NEXT_PAGE,
//
//				},
//				"sZeroRecords": JQUERY_DATA_TABLE.LANGUAGE.SZERORECORDS,
//				"sInfoFiltered": "",
//				"processing":     JQUERY_DATA_TABLE.LANGUAGE.PROCESSING,
//				"search": "",
//				"sLengthMenu": "_MENU_",
//				"info": "",
//				"infoEmpty":JQUERY_DATA_TABLE.LANGUAGE.INFOEMPTY
//			},
//         "iDisplayLength": 50,
//         "searching" : false,
//         dom: 'Bfrtip'
//     });
//
//	t.on( 'order.dt search.dt', function () {
//	    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
//	        cell.innerHTML = i+1;
//	    } );
//	} ).draw();

    var self = this;
    self.initDataContent();
}


TruckingManager1.prototype.getPostSearchData = function() {
    var self = this;
    var obj = {};
    obj["toProvince"] = $("#provinceTo").val() || '-1';
    obj["fromProvince"] = $("#provinceFrom").val() || '-1';
    obj["toDistrict"] = $("#districtTo").val() || '-1';
    obj["fromDistrict"] = $("#districtFrom").val() || '-1';
    obj["truckType"] = $("#truckType").val() || '-1';
    obj["startDate"] = $("#fromDate").val() || '';
    obj["postDate"] = $("#toDate").val() || '';
    obj["goodsTypeId"] = $("#goodsType").val() || '-1';
    obj["pageSize"] = $("#pageSize").val();
    obj["currentPage"] = $("#currentPage").val();
    return obj;
}

/**
 * @Todo: init button here
 */
TruckingManager1.prototype.initButtonClick = function() {
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

    $("#resetButton").click(function(){
        $('input:checkbox').removeAttr('checked');
        self.listGoodsType = [];
        self.listTruckType = [];
        $("html, body").animate({ scrollTop: 200 }, "slow");
        self.initDataTable();
    });
};


TruckingManager1.prototype.getUserByUserName = function(username){
    var self = this;
    var obj = null;
    if (self.listUser && self.listUser.length > 0){
        $.each(self.listUser, function (i, item) {
            (item.username == username) && (obj = item);
        });
        return obj;
    }
};

TruckingManager1.prototype.initSelectAction = function(data) {
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

    $("#pageSize").change(function() {
        self.initDataTable();
    });

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


TruckingManager1.prototype.getStatus = function(enabled){
    var str = "";
    if(enabled == true) {
        var str = '<span class="label label-success">Active</span>';
    } else {
        var str = '<span class="label label-default">Deactive</span>';
    }
    return str;
};

TruckingManager1.prototype.generateLink = function(row){
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

TruckingManager1.prototype.getProvinceId = function(id){
    var self = this;
    var obj = {};
    if (self.listProvince && self.listProvince.length > 0){
        $.each(self.listProvince, function (i, item) {
            (item.id == id) && (obj = item);
        });
        return obj;
    }
};

TruckingManager1.prototype.convertProvinceDistrict = function(districtObj){
    var self = this;
    var districtName = districtObj.name || '';
    var province = self.getProvinceId(districtObj.provinceId) || '';
    return province.name + ', ' + districtName;

};

TruckingManager1.prototype.reloadTableData = function(){
    $("#truckingTable").DataTable()
        .ajax.url("/rest_trucking/getListTrucking")
        .load(function(json){

        },true);
};

TruckingManager1.prototype.clearSearchForm = function(){
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

TruckingManager1.prototype.initProvince = function(id, name) {
    var self = this;
    var obj = {};
    obj.id = id;
    obj.name = name;
    self.listProvince.push(obj);
};

TruckingManager1.prototype.filter = function(id, type) {
    var self = this;
    if(type == 'goodsType') {
        self.listGoodsType = [];
        //for het danh sach goodstype
        //lay danh sach filter
        $('input', '#collapseTwo').each(function () {
            console.log($(this));
            if($(this).prop('checked')==true) {
                self.listGoodsType.push($(this).attr("id"));
            }
        });
        self.initDataContent();
    } else if(type == 'truckType') {
        self.listTruckType = [];
        $('input', '#collapseThree').each(function () {
            if($(this).prop('checked')==true) {
                console.log($(this));
                self.listTruckType.push($(this).attr("id"));
            }
        })
        self.initDataContent();
    }
};


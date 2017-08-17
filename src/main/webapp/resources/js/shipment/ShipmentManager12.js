function ShipmentManager1() {
    this.listProvince = [];
}
//init
ShipmentManager1.prototype.init = function(){
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

//	self.initDataTable(data);
//	self.initSelectAction(data);

    self.initDataContent(data);
    self.initSelectAction(data);

}

//search

/**
 * @Todo: init table here
 */
ShipmentManager1.prototype.initDataTable = function(param){

    var self = this;
    self.initDataContent();
}

/**
 * @Todo: init search content
 */
ShipmentManager1.prototype.initDataContent = function(param) {
    console.log("initDataContent");

    var self = this;
    var data = {};
    var url = '/rest_shipment/getListShipment';
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
            response.listShipments = filterListShipment(response.listShipments, self.listGoodsType, "goodsType");
            response.listShipments = filterListShipment(response.listShipments, self.listTruckType, "truckType");

            self.fireContentData(response.listShipments);
            self.firePaging(response.listShipments.length);
        },
        error : function(e) {
            showMessage(e, "error");
        },
        done : function(e) {
            console.log("DONE");
        }
    });

};

ShipmentManager1.prototype.firePaging = function(total){
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
    pageContainer.append('<li><a href="./list?page=1&size='+pageSize+'">'+ page_first +'</a></li>');
    if((numberOfPage > 1) && (previous > 0)) {
        pageContainer.append('<li><a href="./list?page='+previous+'&size='+pageSize+'"><i class="fa fa-angle-left"></i></a></li>');
    }
    for (var i = 0; i < numberOfPage ; i++) {
        if((i+1) == currentPage) {
            pageContainer.append('<li class="active"><a href="./list?page='+(i+1)+'&size='+pageSize+'">'+(i+1)+'</a></li>');
        } else {
            pageContainer.append('<li><a href="./list?page='+(i+1)+'&size='+pageSize+'">'+(i+1)+'</a></li>');
        }

    }
    if((numberOfPage > 1) && (currentPage != numberOfPage)) {

        pageContainer.append('<li><a href="./list?page='+next+'&size='+pageSize+'"><i class="fa fa-angle-right"></i></a></li>');
    }
    pageContainer.append('<li><a href="./list?page='+(Math.floor(numberOfPage))+'&size='+pageSize+'">'+ page_last +'</a></li>');

    if(total == 0) pageContainer.empty();
}

ShipmentManager1.prototype.fireContentData = function(listShipment){
    var self = this;
    //draw list data
    $("#contentData").empty();
    for (var i=0 ; i < listShipment.length ; i++) {
        var shipment = listShipment[i];
        var divContainer = $('<div class="list-product-description product-description-brd margin-bottom-30"></div>');
        var row = $('<div class="row"/>');

        /*
         * draw left column
         */
        var leftRow = $('<div class="col-sm-4" style="border-right: 1px solid #eee; margin-top: 5px"/>');
        var leftRowChild = $('<div class="overflow-h margin-bottom-5" />')

        var left_ul = $('<ul class="list-inline overflow-h"/>');
        var left_li1 = $('<li><h4 class="title-price"><a href="shop-ui-inner.html"><code>'+shipment.code+'</code></a></h4></li>');
        var left_li2 = $('<li class="pull-right" style="margin-top:8px;"><span>'+ jQuery.i18n.prop('view_departure_time') +': '+convertLongDate(shipment.startDate)+'</span></li>');
        var left_li3 = $('<li><h4 class="title-price" style="font-weight:bold"><a href="shop-ui-inner.html">'+shipment.name+'</a></h4></li>');
        left_ul.append(left_li1);
        left_ul.append(left_li2);
        left_ul.append(left_li3);

        var left_div = $('<div class="margin-bottom-10"/>');
        var left_span1 = $('<span class="label label-sea"><i class="fa fa-truck"></i> '+shipment.dealType.name+'</span>');
        var left_span2 = $('<span class="label label-default" style="margin-left:3px;"><i class="fa fa-dropbox"></i>	'+shipment.goodsType.name+'</span>');
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
        right_ul.append('<li><h4 class="title-price" style="font-weight:bold"><span>'+self.convertProvinceDistrict(shipment.fromDisTrictObj)+'</span> -&gt; <span>'+self.convertProvinceDistrict(shipment.toDisTrictObj)+'</span></h4></li>');

        var right_div1 = $('<div class="margin-bottom-10">');
        right_div1.append('<sptan class="title-price margin-right-10">'+ jQuery.i18n.prop('view_price') +': </span>');
        right_div1.append('<span class="title-price line-red">'+convertPrice(shipment)+'</span>');

        var right_div2 = $('<div class="margin-bottom-10">');
        right_div2.append('<span class="title-price margin-right-10">'+ jQuery.i18n.prop('view_weight') +': </span> <span class="title-price line-red">'+convertWeight(shipment)+'</span>');

        var view_detail = jQuery.i18n.prop('view_detail');

        var right_paragraph = $('<p class="margin-bottom-20">'+ jQuery.i18n.prop('view_description') +': '+shipment.description+'</p>');
        var btn = $('<button type="button" class="btn btn-sm btn-u-sea-shop btn-primary" onclick="window.location.href=\'./detail?'+shipment.id+'\'">'+ view_detail +'</button>');

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

    if (listShipment.length == 0) {
        var notFound = 'Không tìm thấy bản ghi nào';
        $("#contentData").append("<h4>"+notFound+"</h4>");
    }

};


ShipmentManager1.prototype.getPostSearchData = function() {
    var obj = {};
    obj["toProvince"] = $("#provinceTo").val() || '-1';
    obj["fromProvince"] = $("#provinceFrom").val() || '-1';
    obj["toDistrict"] = $("#districtTo").val() || '-1';
    obj["fromDistrict"] = $("#districtFrom").val() || '-1';
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
ShipmentManager1.prototype.initButtonClick = function() {
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


ShipmentManager1.prototype.getUserByUserName = function(username){
    var self = this;
    var obj = null;
    if (self.listUser && self.listUser.length > 0){
        $.each(self.listUser, function (i, item) {
            (item.username == username) && (obj = item);
        });
        return obj;
    }
};

ShipmentManager1.prototype.initSelectAction = function(data) {
    //load list province
    var self = this;
//	getListProvince("#provinceTo");
//	getListProvince("#provinceFrom");
//	getListGoodsType("#goodsType");
    getListDealType("#dealType");

//	if(data != null && data.toProvince != null){
//		getListProvince("#provinceTo", data.toProvince);
//		getListDistrictByProvinceId(data.toProvince, "#districtTo");
//	}else
//		getListProvince("#provinceTo");
//
//	if(data != null && data.fromProvince != null){
//		getListProvince("#provinceFrom", data.fromProvince);
//		getListDistrictByProvinceId(data.fromProvince, "#districtFrom");
//	}else
//		getListProvince("#provinceFrom");
//

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
    $("#goodsType").change(function(){
        self.initDataTable();
    });

    $("#pageSize").change(function() {
        self.initDataTable();
    });
};

ShipmentManager1.prototype.generateLink = function(row){
    var str ="";
    var id = row.id;
    var editLink = '<a href="./detail?'+id+'" class="skin-text-color"><i class="fa fa-info-circle fa-lg" style="color: #0096F0"></i></a>'
            + '&nbsp <a href="/trucking/list-trucking?fromProvince='+row.fromDisTrictObj.provinceId+ '&toProvince='+ row.toDisTrictObj.provinceId
            + '&goodsTypeId=' + row.goodsType.id + '&startDate=' + getDateFromLongValue(row.startDate) + '" style="color: #090"><i class="fa fa-search fa-lg"></i></a>'
        ;
    str += editLink;
    return str;
};

ShipmentManager1.prototype.generateLabel = function(code){
    var str ="";
    var editLink = '<code>'+code+' </code>';
    str += editLink;
    return str;
};

ShipmentManager1.prototype.initProvince = function(id, name) {
    var self = this;
    var obj = {};
    obj.id = id;
    obj.name = name;
    self.listProvince.push(obj);
}

ShipmentManager1.prototype.clearSearchForm = function(){
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

ShipmentManager1.prototype.convertProvinceDistrict = function(districtObj){
    var self = this;
    var districtName = districtObj.name || '';
    var province = self.getProvinceId(districtObj.provinceId) || '';
    return province.name + ', ' + districtName;

};
ShipmentManager1.prototype.getProvinceId = function(id){
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

ShipmentManager1.prototype.filter = function(id, type) {
    var self = this;
    if(type == 'goodsType') {
        self.listGoodsType = [];
        //for het danh sach goodstype
        //lay danh sach filter
        $('input', '#collapseTwo').each(function () {
            //console.log($(this));
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
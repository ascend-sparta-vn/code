/**
 *
 */

function TruckingPost() {
}

//init
TruckingPost.prototype.init = function(){
    var self = this;
    // init menu active
    $("li .active").removeClass("active");
    $("#menu4").addClass("active");
    $("#menu4-sub2").addClass("active");

    // init selection
    self.initSelection();
    // reset form data
    self.resetPostFormData();
}

TruckingPost.prototype.initSelection = function(){
    var self = this;
    $("#fromProvince").change(function(){
        var frmProvince = $("#fromProvince").val();
        getListDistrictByProvinceId(frmProvince, "#fromDistrict", null, jQuery.i18n.prop('district_from_choose'));
    });

    $("#toProvince").change(function(){
        var toProvince = $("#toProvince").val();
        getListDistrictByProvinceId(toProvince, "#toDistrict", null, jQuery.i18n.prop('district_to_choose'));
    });

    // init list provice and truck_type
    getListProvince("#fromProvince", null, jQuery.i18n.prop('province_from_choose'));
    getListProvince("#toProvince", null, jQuery.i18n.prop('province_to_choose'));
    getListTruckType("#truckType");
    getListTruckType("#truckTypeModal");
    getListGoodsType("#goodsType");
    getListTruckingByOwnerId("#truckId");
    // add new truck
    $("#addTruckBtn").click(function() {
        bootbox.dialog({
            size : "medium",
            message: $("#myModal").html(),
            title: jQuery.i18n.prop('trucking.post.modalHeaderAdd'),
            className: "modal-darkorange",
            buttons: {
                success: {
                    label: jQuery.i18n.prop('common.saveBtn'),
                    className: "btn-primary",
                    callback: function () {
                        self.addNewTrucking('/rest_trucking/addNewTrucking', function(result) {
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
    // add post data
    $("#addPostBtn").click(function(){
        var post = self.getPostFormData();
        if(!self.validateFormData(post)){
            return;
        }

        var url = "/rest_trucking/addTruckingPost";
        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : url,
            data : JSON.stringify(post),
            dataType : 'json',
            success : function(response) {
                if(response && response.code == RESPONSE.CODE.SUCCESS){
                    console.log('addTruckingPost');
                    showMessage('Thêm mới thành công', 'success');
                    self.resetPostFormData();
                }else{
                    showMessage('Thêm mới thất bại', 'error');
                }
            },
            error : function(e) {
                showMessage('ERROR: /rest_trucking/addTruckingPost', 'error');
                console.log("ERROR addTruckingPost: ", e);
            },
            done : function(e) {
                console.log("DONE");
            }
        });
    });
    // clear post
    $("#clearPostBtn").click(function(){
        self.resetPostFormData();
    });
    // quick-add-truck
    $("#quick-add-truck").click(function(){
        $("#collapseExample").collapse('toggle');
    });
}

TruckingPost.prototype.addNewTrucking = function(action, callbackFunction) {
    var self = this;
    var truck = self.getTruckPostData();
    if(!self.validateNewTrucking(truck)){
        return;
    }
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : action,
        data : JSON.stringify(truck),
        dataType : 'json',
        //timeout : 30000,
        success : function(data) {
            console.log(data);
            if (data.code == RESPONSE.CODE.SUCCESS) {
                showMessage(data.msg, "success");
                getListTruckingByOwnerId("#truckId");
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

TruckingPost.prototype.getTruckPostData = function(){
    var post = {};
    post["plateNumber"] = $("#plateNumberModal",'.bootbox').val() || '';
    post["status"] = $("#statusModal",'.bootbox').val() || -1;
    post["truckTypeId"] = $("#truckTypeModal",'.bootbox').val() || -1;

    return post;
}

TruckingPost.prototype.getPostFormData = function(){
    var post = {};
    post.truckId = $("#truckId").val() || -1;
    post.plateNumberList ='';
//	post.plateNumberList =$("#plateNumberList").val();
    post.truckType =-1;
//	post.truckType =$("#truckType").val();
    post.goodsTypeId =$("#goodsType").val();
    // convert weight
    post.title = $("#title").val();
    post.weight =$("#weight").val();
    post.weightUnit =$("#weightUnit").val();
    post.fromDistrict =$("#fromDistrict").val();
    post.toDistrict =$("#toDistrict").val();
    post.fromProvince =$("#fromProvince").val();
    post.toProvince =$("#toProvince").val();
    post.fromDetailAddress =$("#fromDetailAddress").val();
    post.toDetailAddress =$("#toDetailAddress").val();
    post.startDate =$("#startDate").val();
    post.expiredDate =$("#expiredDate").val();
    post.distance =$("#roadLength").val();
    post.agency =$("#agency").val();

    // get price
    post.price =$("#price").val();
    post.priceUnit =$("#priceUnit").val();
    post.description =$("#description").val();

    return post;
}

TruckingPost.prototype.validateFormData = function(post){
    if(post == null) return false;

    if(post.truckId == null || post.truckId == '-1'){
        showMessage('Bạn chưa chọn xe hàng', 'error');
        return false;
    }

    if(post.title == null || post.title.trim() == ''){
        showMessage('Bạn chưa nhập tiêu đề', 'error');
        return false;
    }

    if(post.goodsTypeId == null || post.goodsTypeId == '-1'){
        showMessage('Loại hàng hóa không hợp lệ', 'error');
        return false;
    }
    if(post.fromProvince == null || post.fromProvince == '-1'){
        showMessage('Thành phố chở đi không hợp lệ', 'error');
        return false;
    }
    if(post.toProvince == null || post.toProvince == '-1'){
        showMessage('Thành phố chở đến không hợp lệ', 'error');
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

TruckingPost.prototype.validateNewTrucking = function(post){
    if(post == null) return false;
    if(post.truckTypeId == null || post.truckTypeId == '-1'){
        showMessage('Bạn chưa chọn loại xe khi thêm mới', 'error');
        return false;
    }
    if(post.plateNumber == null || post.plateNumber == ''){
        showMessage('Bạn chưa nhập biển số xe khi thêm mới', 'error');
        return false;
    }
    return true;
}

TruckingPost.prototype.getListDistrictByProvinceId = function(provinceId, container){
    $(container).empty();
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : "/rest/getListDistrictByProvinceId?provinceId=" + provinceId,
        dataType : 'json',
        success : function(response) {
            for(var i = 0; i < response.length; i++) {
                var district = response[i];
                if(district != null) {
                    $(container).append("<option value='" + district.id +"'>" + decodeHtml(district.name) +"</option>");
                }
            }
        },
        error : function(e) {
            console.log("ERROR: ", e);
        },
        done : function(e) {
            console.log("DONE");
        }
    });
}

TruckingPost.prototype.resetPostFormData = function(){
    $("#plateNumberList").val('');
    $("#truckType").val('-1');
    $("#goodsType").val('-1');
    $("#weight").val('');
    $("#weightUnit").val('-1');
    $("#fromProvince").val('-1');
    $("#toProvince").val('-1');
    $("#fromDistrict").val('-1');
    $("#toDistrict").val('-1');
    $("#fromDetailAddress").val('');
    $("#toDetailAddress").val('');
    $("#startDate").val('');
    $("#expiredDate").val('');
    $("#roadLength").val('');
    $("#agency").val('-1');
    $("#price").val('');
    $("#priceUnit").val('-1');
    $("#description").val('');
}



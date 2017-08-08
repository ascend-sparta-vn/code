function DeviceManager(a) {
	(!a) || (a={});
	this.heProfile = '';
	this.kieuCua = '';
	this.loaiCua = '';
	this.soCanh = '0';
	this.heMo = '';
	this.banle = '';
	this.hesoAnToan='';
	this.chieuRong=0;
	this.chieuDai=0;
}



//init
DeviceManager.prototype.init = function(){
	var self = this;
	self.initDataTable();
	self.initButtonClick();
	self.initSelectAction();
}

//search
DeviceManager.prototype.fireSelectAction = function(filterKey, value){
	var self = this;
	if (filterKey == 'heProfile') {
		self.heProfile = value;
	} else if (filterKey == 'kieuCua') {
		self.kieuCua = value;
	} else if (filterKey == 'loaiCua') {
		self.loaiCua = value;
	} else if (filterKey == 'soCanh') {
		self.soCanh = value;
	} else if (filterKey == 'heMo') {
		self.heMo = value;
	} else if (filterKey == 'banle') {
		self.banle = value;
	} else if (filterKey == 'hesoAnToan') {
		self.hesoAnToan = value;
	} else if (filterKey == 'chieuRong') {
		self.chieuRong = value;
	} else if (filterKey == 'chieuDai') {
		self.chieuDai = value;
	}
	self.initDataTable();
	
	
}

/**
 * @Todo: init table here
 */
DeviceManager.prototype.initDataTable = function(){
	var self = this;
	var data = self.getPostData();
	var table = $("#mau-cua-cuon-table").dataTable();
	table.fnDestroy();
	var url = "/rest/getDanhSachCua" ;
	var t = $('#mau-cua-cuon-table').DataTable({
         "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
         "columns": [
			 {
			    "className":      'details-control',
			    "orderable":      false,
			    "data":           "idCua",
			    "defaultContent": ''
			    	
			 },
			 { "data": "kyHieu"},
             { "data": "heProfile"},
             { "data": "cuaTruotQuay"},
             { "data": "loaiCua"},
             { "data": "soCanh"},
             { "data": "heMo"},
             { "data": "loaiBanLe"},
             { "data": "heSoAnToan"},
             /*{ "data": "chieuRong"},
             { "data": "chieuDai"}*/
         ],
         "columnDefs": [
                        { "width": "5%", "targets": 0 },
                        { "width": "10%", "targets": 1 },
                        { "width": "10%", "targets": 2 },
                        { "width": "10%", "targets": 3 },
                        { "width": "10%", "targets": 4 },
                        { "width": "10%", "targets": 5 },
                        { "width": "15%", "targets": 6 },
                        { "width": "15%", "targets": 7 },
                        { "width": "10%", "targets": 8 },
                        /*{ "width": "10%", "targets": 9 }*/
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
         "aaSorting": [[1, 'asc']],
         "aLengthMenu": [
                         [5, 15, 20, -1],
                         [5, 15, 20, "All"]
                     ],
         "fnInitComplete": function(oSettings, json) {
			self.cuaList = json;
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
				"info": JQUERY_DATA_TABLE.LANGUAGE.INFO,
				"infoEmpty":JQUERY_DATA_TABLE.LANGUAGE.INFOEMPTY
			},
         "iDisplayLength": 5,
         "oTableTools": {
             "aButtons": [
                 "copy",
                 "print",
                 {
                     "sExtends": "collection",
                     "sButtonText": "Save <i class=\"fa fa-angle-down\"></i>",
                     "aButtons": ["csv", "xls", "pdf"]
                 }
             ],
             "sSwfPath": "resources/css/swf/copy_csv_xls_pdf.swf"
         },
     });
	
	self.table = t;
	
}


/**
 * @Todo: init button here
 */
DeviceManager.prototype.initButtonClick = function() {
	var self = this;
	// Add event listener for opening and closing details
    $('#mau-cua-cuon-table tbody').on('click', 'td.details-control', function () {
        var idCua = $(this).html();
        var tr = $(this).closest('tr');
        var row = self.table.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
        	var child = self.formatExpandData(idCua);
        	if(child != '') {
        		row.child(self.formatExpandData(idCua)).show();
        	} else {
        		row.child("Chưa có dữ liệu phụ kiện").show();
        	}
            tr.addClass('shown');
        }
    } );
}

DeviceManager.prototype.formatExpandData = function(idCua) {	
	var self = this;
	var cua = self.getCuaById(idCua);
	var sOut="";
	var chieuRong = $("#chieuRong").val();
	var chieuDai = $("#chieuDai").val();
	var tayNam = $("#tayNam").val();
    
    var dsPhuKien = $.ajax({
        type: 'POST',
        url: "/rest/getDanhSachPhuKien?idCua=" +idCua +"&chieuRong="+chieuRong+"&chieuDai="+chieuDai+"&tayNam="+tayNam,
        dataType: "json",
        async: false,
        success: function(data){
        	dsPhuKien= data;
        }
    }).responseText;
    dsPhuKien = JSON.parse(dsPhuKien);
    
	// table danh sach thanh phu kien:
	var tableThanhDaDiem = self.initInnerTable("Danh Sách Thanh Đa Điểm", dsPhuKien.thanhDaDiemList);
	
	var tableThanhNgang = self.initInnerTable("Danh Sách Thanh Chiều Ngang (chiều rộng)", dsPhuKien.thanhNgangList);
	
	var tableThanhDoc = self.initInnerTable("Danh Sách Thanh Chiều Dọc (chiều cao)", dsPhuKien.thanhDocList);
	
	var tableKlemon = self.initInnerTable("Danh Sách Klemon", dsPhuKien.klemonList);
	
	var tableBanle = self.initInnerTable("Danh Sách Bản Lề", dsPhuKien.banLeList);
	
	//var tablePkThem = self.initInnerTable("Danh Sách Phụ Kiện Thêm Khác", dsPhuKien.pkThemList);
	
	var tablePkBatBuoc = self.initInnerTable("Danh Sách Phụ Kiện Khác", dsPhuKien.pkBatBuocList);
	
	
	var image = '<img style="width:250px;height:300px;" src="'+cua.anhDaiDien+'"/>'
	var avartar = 	'<div class="col-lg-3"><div class="row" style="margin: 10px 0px 0px 0px;">'+image+'</div>'
				  	+ '<div class="row" style="margin: 10px 0px 0px 0px;">'
				  	+ '<a href="/edit-device?idCua='+cua.idCua+'" style="width:40px;" class="btn btn-primary" title="Sửa"><i class="fa fa-edit"></i></a>'
				  	+ '<a href="javascript:void(0)" onclick="deleteCua('+cua.idCua+')" style="width:40px; margin-left:10px;" class="btn btn-danger"  title="Xóa"> <i class="fa fa-times"></i></a>'
				  	+ '<a href="/copy-device?idCua='+cua.idCua+'&clone=true" style="width:40px; margin-left:10px;" class="btn btn-palegreen"  title="Copy"><i class="fa fa-copy"></i></a>'
				  	+ '</div>'
				  	+ '</div>';
	var button = '<div class="row center"><a href="javascript:void(0);" id="saveDeviceId" class="btn btn-primary">Sửa</a><a href="javascript:void(0);" id="saveDeviceId" class="btn btn-danger">Xóa</a></div>'
	
	sOut+= '<div class="row"> ';
	sOut+= avartar;
	sOut+= '<div class="col-lg-9">';
	
	if(dsPhuKien.thanhDaDiemList.length > 0) { sOut+= tableThanhDaDiem; }
	if(dsPhuKien.thanhDocList.length > 0) {sOut+= tableThanhDoc;}
	if(dsPhuKien.thanhNgangList.length > 0) {sOut+= tableThanhNgang;}
	if(dsPhuKien.klemonList.length > 0) {sOut+= tableKlemon;}
	if(dsPhuKien.banLeList.length > 0) {sOut+= tableBanle;}
	//if(dsPhuKien.pkThemList.length > 0) {sOut+= tablePkThem;}
	if(dsPhuKien.pkBatBuocList.length > 0) {sOut+= tablePkBatBuoc;}
	
	if( ($("#chieuRong").val() != "") && ($("chieuDai").val() != "") && ($("#tayNam").val()!= "")) {
		sOut+= "<br/>Tổng số tiền là : " + dsPhuKien.tongSoTien;
	}
	
	sOut+= "</div></div>";
	
	return sOut;
};

DeviceManager.prototype.initInnerTable = function (tableName, phuKienList){
	if(typeof phuKienList == 'undefined'){
		return "";
	}
	var sOut = '<table style="margin-top:10px;margin-bottom:5px;">'
	sOut += '<tr><td rowspan="12" style="padding:0 5px 0 0;"/></td><td><b>'+tableName+'</b></td></tr>';
    sOut += '<tr colspan="2">';
	sOut +=	'<td>';	
	sOut += 	'<table class="table table-bordered table-striped table-condensed flip-content detail-device">';				
	sOut += '<thead class="flip-content bordered-palegreen">';
	sOut += '<tr> ';
	sOut += '<th class="detail-device">Mã</th>';
	sOut += '<th class="detail-device">Ký Hiệu</th>';
	sOut += '<th class="detail-device">Note</th>';
	sOut += '<th class="detail-device">Số lượng</th>';
	sOut += '<th class="detail-device">Giá order (€)</th>';
	sOut += '<th class="detail-device">Giá về Việt Nam (VNĐ)</th>';
	sOut += '<th class="detail-device">Tổng giá vốn thành phần</th>';
	sOut += '</tr></thead>';
	
	// get data:
	var data =' <tbody>';
	for(var i = 0; i< phuKienList.length; i++){
    	var phukien = phuKienList[i];
    	data += 			'<tr class="detail-device">';
    	data += 			'<td class="detail-device white-background">'+phukien.codePhuKien+'</td>'
    	data += 			'<td class="detail-device white-background">'+phukien.tenPhuKien+'</td>'
    	data += 			'<td class="detail-device white-background">'+phukien.mieuTa+'</td>'
    	data += 			'<td class="detail-device white-background">'+phukien.quantity+'</td>'
    	data += 			'<td class="detail-device white-background">'+phukien.giaOrder+'</td>'
    	data += 			'<td class="detail-device white-background">'+phukien.giaVeVietNam+'</td>'
    	data += 			'<td class="detail-device white-background">'+phukien.tongGiaThanhPhan+'</td>'
    	data += '			</tr>';
    }
	
	sOut += data ;
	sOut += 		'</tbody></table>';
	sOut +=	'</td>';
	sOut += '</tr>';
	sOut += '</table>';
	return sOut;
};


DeviceManager.prototype.getPostData = function() {
	var self = this;
	var obj = {};
	obj["heProfile"] = self.heProfile;
	obj["kieuCua"] = self.kieuCua;
	obj["loaiCua"] = self.loaiCua;
	obj["soCanh"] = self.soCanh;
	obj["heMo"] = self.heMo;
	obj["banle"] = self.banle;
	obj["hesoAnToan"] = self.hesoAnToan;
	obj["chieuRong"] = self.chieuRong;
	obj["chieuDai"] = self.chieuDai;
	return obj;
}

DeviceManager.prototype.getCuaById = function(id){
	var self = this;
	var obj = null;
	if (self.cuaList && self.cuaList.length > 0){
		$.each(self.cuaList, function (i, item) {
			(item.idCua == id) && (obj = item);
		});
		return obj;
	}
};

DeviceManager.prototype.initSelectAction = function() {
	var self = this;
	$("#tayNam").change(function(){
		self.triggerUserInput();
	});
	
	$('#chieuDai').on('change', function(){
		self.triggerUserInput();
    });
	
	$('#chieuRong').on('change', function(){
		self.triggerUserInput();
    });
};

DeviceManager.prototype.triggerUserInput = function(){
	var self = this;
	var chieuRong = $("#chieuRong").val();
	var chieuDai = $("#chieuDai").val();
	var tayNam = $("#tayNam").val();
	self.initDataTable();
	//gen lai table phu kien here
};

DeviceManager.prototype.deleteCua = function(idCua){
	var self = this;
	var url = "/rest/deleteCua?idCua="+idCua;		
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : url,
		dataType : 'json',
		success : function(response) {
			console.log(response);
			self.initDataTable();
			showMessage("Xóa cửa thành công", "success");
			
		},
		error : function(e) {
			console.log("ERROR: ", e);
			showMessage("Xóa cửa thất bại", "error");
		},
		done : function(e) {
			console.log("DONE");
		}
	});
};







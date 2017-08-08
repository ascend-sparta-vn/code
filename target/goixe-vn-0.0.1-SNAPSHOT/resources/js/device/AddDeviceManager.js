
var COLUMN_THANH_INDEX = {
		CODE : 1, 
		ARTICLE : 2, 
		NOTE : 3, 
		GIA_ORDER : 4,
		GIA_VE_VN : 5
};

var COLUMN_PHUKIEN_INDEX = {
		CODE : 1, 
		ARTICLE : 2, 
		NOTE : 3,
		SO_LUONG : 4, 
		CHIEU_TAY_NAM : 5, 
		GIA_ORDER : 6,
		GIA_VE_VN : 7
};

function AddDeviceManager() {
	this.base64 = "";
}

//init
AddDeviceManager.prototype.init = function(){
	var self = this;
	self.initTableThanh("table-thanh-da-diem", "addThanhDaDiem_PhuKienBtn");
	self.initTableThanh("table-thanh-chieu-doc", "addThanhChieuDoc_PhuKienBtn");
	self.initTableThanh("table-thanh-chieu-ngang", "addThanhChieuNgang_PhuKienBtn");
	self.initTableThanh("table-klemon", "addKlemon_PhuKienBtn");
	
	self.initTablePhuKien("table-ban-le-concept", "addBanLeConcept_PhuKienBtn");
	//self.initTablePhuKien("table-phu-kien-optional", "addPhuKienOptional_PhuKienBtn");
	self.initTablePhuKien("table-phu-kien-required", "addPhuKienRequired_PhuKienBtn");
	
	self.initButtonClick();
	self.initSelectAction();
	
	//init for edit action
	var idCua = getParameterByName("idCua");
	var clone = getParameterByName("clone");
	
	if( idCua != "") {
		self.fillData(idCua);
		self.idCua = idCua;
		if(clone == "true") {
			self.mode = "add";
		} else {
			self.mode = "edit";
		}
	} else {
		self.mode = "add";
		self.idCua = 0;
	}
	
}

/**
 * @Todo: init initTableThanhDaDiem here
 */
AddDeviceManager.prototype.initTableThanh = function(tableId, buttonId){
	var self = this;
	//Datatable Initiating
    var oTable = $('#' + tableId).dataTable({
    	"searching" : false,
    	"paging" : false,
    	"iDisplayLength": 8,
    	"sorting" : false,
        "language": {
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
        "aoColumns": [
            null,
            null,
            null,
            null,
            null,
            { "bSortable": false }
        ]
    });
    

    var isEditing = null;

    //Add New Row
    $('#'+buttonId).click(function(e) {
        e.preventDefault();
        var aiNew = oTable.fnAddData([
            '', '', '', '', '',
            '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-edit"></i> Lưu</a> <a href="#" class="btn btn-warning btn-xs cancel" data-mode="new"><i class="fa fa-times"></i> Hủy</a>'
        ]);
        var nRow = oTable.fnGetNodes(aiNew[0]);
        self.editAddedRowThanh(oTable, nRow);
        isEditing = nRow;
    });

    //Delete an Existing Row
    $('#' + tableId).on("click", 'a.delete', function(e) {
        var nRow = $(this).parents('tr')[0];
        oTable.fnDeleteRow(nRow);
    });

    //Cancel Editing or Adding a Row
    $('#' + tableId).on("click", 'a.cancel', function(e) {
        e.preventDefault();
        if ($(this).attr("data-mode") == "new") {
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
            isEditing = null;
        } else {
        	self.restoreRow(oTable, isEditing);
            isEditing = null;
        }
    });

    //Edit A Row
    $('#' + tableId).on("click", 'a.edit', function(e) {
        e.preventDefault();

        var nRow = $(this).parents('tr')[0];

        if (isEditing !== null && isEditing != nRow) {
        	//self.serestoreRow(oTable, isEditing);
            self.editRowThanh(oTable, nRow);
            isEditing = nRow;
        } else {
            self.editRowThanh(oTable, nRow);
            isEditing = nRow;
        }
    });

    //Save an Editing Row
    $('#' + tableId).on("click", 'a.save', function(e) {
        e.preventDefault();
        if (this.innerHTML.indexOf("Lưu") >= 0) {
            self.saveRowThanh(oTable, isEditing);
            isEditing = null;
            //Some Code to Highlight Updated Row
        }
    });
    
    $('#' + tableId).on('keyup', 'input.giaOrder' ,function(){
        var nRow = $(this).parents('tr')[0];
        var giaOrder = $(this).val();
        var giaVeVietNam = giaOrder * 25000 * 1.5;
        //update the value of giaVeVietNam
        var $giaVn = nRow.childNodes[4].childNodes[0];
        $giaVn.setAttribute("value", giaVeVietNam);
     });
};


AddDeviceManager.prototype.initTablePhuKien = function(tableId, buttonId) {
	var self = this;
	//Datatable Initiating
    var oTable = $('#' + tableId).dataTable({
    	"searching" : false,
    	"paging" : false,
    	"iDisplayLength": 8,
    	"sorting" : false,
        "language": {
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
        "aoColumns": [
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            { "bSortable": false }
        ],
        "columnDefs": [
                       { "width": "15%", "targets": 0 },
                       { "width": "15%", "targets": 1 },
                       { "width": "15%", "targets": 2 },
                       { "width": "10%", "targets": 3 },
                       { "width": "10%", "targets": 4 },
                       { "width": "10%", "targets": 5 },
                       { "width": "10%", "targets": 6 },
                       { "width": "15%", "targets": 7 }
       ],
    });
    
  //Add New Row
    $('#'+buttonId).click(function(e) {
        e.preventDefault();
        var aiNew = oTable.fnAddData([
            '', '', '', '', '','', '',
            '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-edit"></i> Lưu</a> <a href="#" class="btn btn-warning btn-xs cancel" data-mode="new"><i class="fa fa-times"></i> Hủy</a>'
        ]);
        var nRow = oTable.fnGetNodes(aiNew[0]);
        self.editAddedRowPhuKien(oTable, nRow);
        isEditing = nRow;
    });
    
  //Delete an Existing Row
    $('#' + tableId).on("click", 'a.delete', function(e) {
        var nRow = $(this).parents('tr')[0];
        oTable.fnDeleteRow(nRow);
    });
    
  //Cancel Editing or Adding a Row
    $('#' + tableId).on("click", 'a.cancel', function(e) {
        e.preventDefault();
        if ($(this).attr("data-mode") == "new") {
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
            isEditing = null;
        } else {
        	self.restoreRow(oTable, isEditing);
            isEditing = null;
        }
    });
    
  //Edit A Row
    $('#' + tableId).on("click", 'a.edit', function(e) {
        e.preventDefault();

        var nRow = $(this).parents('tr')[0];

        if (isEditing !== null && isEditing != nRow) {
        	//self.serestoreRow(oTable, isEditing);
            self.editRowPhuKien(oTable, nRow);
            isEditing = nRow;
        } else {
            self.editRowPhuKien(oTable, nRow);
            isEditing = nRow;
        }
    });

    //Save an Editing Row
    $('#' + tableId).on("click", 'a.save', function(e) {
        e.preventDefault();
        if (this.innerHTML.indexOf("Lưu") >= 0) {
            self.saveRowPhuKien(oTable, isEditing);
            isEditing = null;
            //Some Code to Highlight Updated Row
        }
    });
    
    $('#' + tableId).on('keyup', 'input.giaOrder' ,function(){
        var nRow = $(this).parents('tr')[0];
        var giaOrder = $(this).val();
        var giaVeVietNam = giaOrder * 25000 * 1.5;
        //update the value of giaVeVietNam
        var $giaVn = nRow.childNodes[6].childNodes[0];
        $giaVn.setAttribute("value", giaVeVietNam);
     });
};

/**
 * @Todo: init button here
 */
AddDeviceManager.prototype.initButtonClick = function() {
	var self = this;
	$("#saveDeviceId").click(function(event) {
		event.preventDefault();
		bootbox.confirm({
			message :"Bạn có chắc chắn muốn cập nhật?",
			size: "small",
			callback: function (result) {
		        if (result) {
		        	var data = self.getPostData();
		    		var url = "/rest/addCua";		
		    		$.ajax({
		    			type : "POST",
		    			contentType : "application/json",
		    			url : url,
		    			data : JSON.stringify(data),
		    			dataType : 'json',
		    			//timeout : 30000,
		    			success : function(data) {
		    				console.log(data);
		    				showMessage("Cập nhật cửa thành công", "success");
		    			},
		    			error : function(e) {
		    				console.log("ERROR: ", e);
		    				showMessage("Cập nhật cửa thất bại", "error");
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
		
	});
};

/**
 * @Todo: get Post data
 */
AddDeviceManager.prototype.getPostData = function() {
	var self = this;
	
	var cua = {}
	cua["kyHieu"] = $("#kyHieu").val();
	cua["heProfile"] = $("#heProfile").val();
	cua["cuaTruotQuay"] = $("#cuaTruotQuay").val();
	cua["loaiCua"] = $("#loaiCua").val();
	cua["heMo"] = $("#heMo").val();
	cua["soCanh"] = $("#soCanh").val();
	cua["loaiBanLe"] = $("#loaiBanLe").val();
	cua["heSoAnToan"] = $("#heSoAnToan").val();
	cua["anhDaiDien"] = self.base64;
	
	var listPk = [];
	//get phu kien thanh da diem
	var listPkThanhDaDiem = self.getListPhuKienThanh("table-thanh-da-diem", $("#addThanhDaDiem_PhuKienSelectBox").val(), CATEGORY.THANH_DA_DIEM);
	var listPkThanhNoiChieuDoc = self.getListPhuKienThanh("table-thanh-chieu-doc", $("#addThanhChieuDoc_PhuKienSelectBox").val(),CATEGORY.THANH_CHIEU_CAO );
	var listPkThanhNoiChieuNgang = self.getListPhuKienThanh("table-thanh-chieu-ngang", $("#addThanhChieuNgang_PhuKienSelectBox").val(), CATEGORY.THANH_CHIEU_RONG);
	var listPkThanhKlemon = self.getListPhuKienThanh("table-klemon", $("#addKlemon_PhuKienSelectBox").val(), CATEGORY.KLEMON);
	
	//get phu kien ban le & phukienkhac
	var listPkBanLe = self.getListPhuKien("table-ban-le-concept", CATEGORY.BAN_LE);
	var listPkRequired = self.getListPhuKien("table-phu-kien-required", CATEGORY.PHU_KIEN_BAT_BUOC);
	var listPkOptional = self.getListPhuKien("table-phu-kien-optional", CATEGORY.PHU_KIEN_PHU);
	
	//get phu kien Vau
	var listVau = self.getListVau();
	
	listPk = pushArray(listPk, listPkThanhDaDiem);
	listPk = pushArray(listPk, listPkThanhNoiChieuDoc);
	listPk = pushArray(listPk, listPkThanhNoiChieuNgang);
	listPk = pushArray(listPk, listPkThanhKlemon);
	listPk = pushArray(listPk, listPkBanLe);
	listPk = pushArray(listPk, listPkRequired);
	listPk = pushArray(listPk, listPkOptional);
	listPk = pushArray(listPk, listVau);
	
	var obj = {};
	obj["listPk"] = listPk;
	obj["cua"] = cua;
	obj["idCua"] = self.idCua;
	obj["mode"] = self.mode;
	return obj;
};


AddDeviceManager.prototype.getListPhuKienThanh = function(tableId, quantity, category) {
	var self = this;
	var listPhuKien = [];
	$('#' + tableId + ' > tbody > tr').each(function(){
		var phuKien = {};
		var count = 0;
	    $(this).children('td').each(function(){
	    		var input = $(this);
	    		if(input.html() == JQUERY_DATA_TABLE.LANGUAGE.SZERORECORDS) {
	    			return listPhuKien;
	    		}
	    		count++;
	    		if(count == COLUMN_THANH_INDEX.CODE) { phuKien.codePhuKien = input.html(); }
	    		if(count == COLUMN_THANH_INDEX.ARTICLE)  {
	    			phuKien.tenPhuKien = input.html(); 
	    			phuKien.soVau = self.getSoVau(phuKien.tenPhuKien);
	    		}
	    		if(count == COLUMN_THANH_INDEX.NOTE) {
	    			phuKien.mieuTa = input.html(); 
	    			phuKien.kichThuocToiThieu = self.getKichThuoc(phuKien.mieuTa, "toi_thieu");
	    			phuKien.kichThuocToiDa = self.getKichThuoc(phuKien.mieuTa, "toi_da");
	    		}
	    		if(count == COLUMN_THANH_INDEX.GIA_ORDER) { phuKien.giaOrder = input.html(); }
	    		if(count == COLUMN_THANH_INDEX.GIA_VE_VN) { phuKien.giaVeVietNam = input.html(); }
	    		
	    })
	    if(count > 0) {
	    	phuKien.quantity = quantity;
    		phuKien.category = category;
    		
	    	listPhuKien.push(phuKien);
	    }
	})
	return listPhuKien;
};

AddDeviceManager.prototype.getListPhuKien = function(tableId, category) {
	var self = this;
	var listPhuKien = [];
	$('#' + tableId + ' > tbody > tr').each(function(){
		var phuKien = {};
		var count = 0;
	    $(this).children('td').each(function(){
	    		var input = $(this);
	    		if(input.html() == JQUERY_DATA_TABLE.LANGUAGE.SZERORECORDS) {
	    			return listPhuKien;
	    		}
	    		count++;
	    		if(count == COLUMN_PHUKIEN_INDEX.CODE) { phuKien.codePhuKien = input.html(); }
	    		if(count == COLUMN_PHUKIEN_INDEX.ARTICLE) {
	    			phuKien.tenPhuKien = input.html(); 
	    			phuKien.soVau = self.getSoVau(phuKien.tenPhuKien);
	    		}
	    		if(count == COLUMN_PHUKIEN_INDEX.NOTE) {
	    			phuKien.mieuTa = input.html();
	    			phuKien.kichThuocToiThieu = self.getKichThuoc(phuKien.mieuTa, "toi_thieu");
	    			phuKien.kichThuocToiDa = self.getKichThuoc(phuKien.mieuTa, "toi_da");
	    			phuKien.os = self.getOsString(phuKien.mieuTa);
	    		}
	    		if(count == COLUMN_PHUKIEN_INDEX.SO_LUONG) { phuKien.quantity = input.html(); }
	    		if(count == COLUMN_PHUKIEN_INDEX.CHIEU_TAY_NAM) {
	    			if(input.html() == 'RS') { phuKien.huongPhuKien = 'R'; }
	    			if(input.html() == 'LS') { phuKien.huongPhuKien = 'L'; }
	    			if(input.html() == '') { phuKien.huongPhuKien = null }
	    		}
	    		if(count == COLUMN_PHUKIEN_INDEX.GIA_ORDER) { phuKien.giaOrder = input.html(); }
	    		if(count == COLUMN_PHUKIEN_INDEX.GIA_VE_VN) { phuKien.giaVeVietNam = input.html(); }
	    		
	    })
	    if(count > 0) {
    		phuKien.category = category;
	    	listPhuKien.push(phuKien);
	    }
	})
	return listPhuKien;
};

AddDeviceManager.prototype.getListVau = function() {
	var self = this;
	var listPhuKien = [];
	var phuKien = {};
	
	phuKien.codePhuKien = $("#vauCode").val();
	phuKien.tenPhuKien = $("#vauArticle").val();
	phuKien.mieuTa = $("#vauNote").val();
	phuKien.giaOrder = $("#vauGiaOrder").val();
	phuKien.giaVeVietNam = $("#vauGiaVeVietNam").val();
	phuKien.category = CATEGORY.PHU_KIEN_VAU;
	phuKien.soVau = "0";	
	
	listPhuKien.push(phuKien);
	
	return listPhuKien;
};

/*
 * convert note - > kich thuoc
 * vd: FFH 1075 - 1325 -> 1075 & 1325
 */
AddDeviceManager.prototype.getKichThuoc = function(note, type) {
	try {
		if (isContain(note, 'FFH') || isContain(note, 'FFB') || isContain(note, 'ffh') || isContain(note, 'ffb')) {
			note = note.trim();
			var dataRange = note.substring(4, note.length);
			
			if(isContain(dataRange, " - ")) dataRange.replace(" - ", "-");
			
			var range = dataRange.split("-");
			if (type == 'toi_thieu') {
				return range[0].trim();
			} else if (type == 'toi_da') {
				return range[1].trim();
			} else {
				return null;
			}
		} else {
			return null;
		}
	} catch (e) {
		alert ("Kích thước đầu vào không hợp lệ, : " + note);
		console.log(e);
		return null;
	}
	
};

/*
 * convert note - > os type
 * vd: FFH 1075 - 1325 -> 1075 & 1325
 */
AddDeviceManager.prototype.getOsString = function(note) {
	try {
		if (		isContain(note, '(') 
				&& 	isContain(note, ')') 
				&& (isContain(note, 'OS') || isContain(note, 'os'))) {
			note = note.trim();
			var start_index = note.indexOf('(');
			var end_index = note.indexOf(')');
			var osString = note.substring(start_index + 1, end_index);
			return osString;
		} else {
			return "";
		}
	} catch (e) {
		console.log(e);
		return null;
	}
};

/*
 * input:  GAKA.1325-1.D35 ; MK.250-1 
 * 
 * vd: FFH 1075 - 1325 -> 1075 & 1325
 */
AddDeviceManager.prototype.getSoVau = function(article) {
	try {
		if (isContain(article, '-')) {
			article = article.trim();
			var start_index = article.indexOf('-');
			var lastStr = article.substring(start_index +1, article.length);
			if(isContain(lastStr, "WS") || isContain(lastStr, "ws")) return 0;
			//lastStr can be: 1 || 1.D35
			if(isContain(lastStr, ".")) {
				var soVau = substringBeforeFirst(lastStr, ".");
				return soVau;
			} else {
				var soVau = lastStr;
				return soVau;
			}
			
		} else {
			return 0;
		}
	} catch (e) {
		console.log(e);
		return 0;
	}
};


/**
 * @Todo: init select box here
 */
AddDeviceManager.prototype.initSelectAction = function() {
	var self = this;
    
    $("#anhDaiDien").on('change',function(){
    	var selectedFile = document.querySelector('#anhDaiDien').files[0];
    	if(typeof selectedFile != 'undefined') {
    		selectedFile.convertToBase64(function(base64){
    			self.base64 = base64;
    		}) 
    	} else {
    		self.base64 = "";
    	}
    	
      });
    
    $("#vauGiaOrder").on('keyup', function(){
        var nRow = $(this).parents('tr')[0];
        var giaOrder = $(this).val();
        var giaVeVietNam = giaOrder * 25000 * 1.5;
        //update the value of giaVeVietNam
        $("#vauGiaVeVietNam").val(giaVeVietNam);
     });
};

AddDeviceManager.prototype.restoreRow = function(oTable, nRow) {
    var aData = oTable.fnGetData(nRow);
    var jqTds = $('>td', nRow);

    for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
        oTable.fnUpdate(aData[i], nRow, i, false);
    }

    oTable.fnDraw();
};

AddDeviceManager.prototype.editRowThanh = function(oTable, nRow) {
    var aData = oTable.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    jqTds[0].innerHTML = '<input type="text" style="width:100px;" class="input-small" value="' + aData[0] + '">';
    jqTds[1].innerHTML = '<input type="text" style="width:150px;" class="input-small" value="' + aData[1] + '">';
    jqTds[2].innerHTML = '<input type="text" style="width:180px;" class="input-small" value="' + aData[2] + '">';
    /*jqTds[3].innerHTML = '<input type="number" style="width:120px;" class="input-small" value="' + aData[3] + '">';*/
    jqTds[3].innerHTML = '<input type="number" style="width:120px;" class="giaOrder input-small" value="' + aData[3] + '">';
    jqTds[4].innerHTML = '<input type="number" style="width:150px;" class="giaVeVietNam input-small" value="' + aData[4] + '">';
    /*jqTds[5].innerHTML = '<input type="number" style="width:150px;" class="input-small" value="' + aData[5] + '">';*/
    jqTds[5].innerHTML = '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-save"></i> Lưu</a> <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> Hủy</a>';
};

AddDeviceManager.prototype.editAddedRowThanh = function(oTable, nRow) {
    var aData = oTable.fnGetData(nRow);
    var jqTds = $('>td', nRow);
	jqTds[0].innerHTML = '<input type="text" class="input-small" value="' + aData[0] + '">';
    jqTds[1].innerHTML = '<input type="text" style="width:100%" class="input-small" value="' + aData[1] + '">';
    jqTds[2].innerHTML = '<input type="text" style="width:100%;" class="input-small" value="' + aData[2] + '">';
    jqTds[3].innerHTML = '<input type="number" style="width:100%;" class="giaOrder input-small" value="' + aData[3] + '">';
    jqTds[4].innerHTML = '<input type="number" style="width:100%;" class="giaVeVietNam input-small" value="' + aData[4] + '">';
    jqTds[5].innerHTML = aData[5];
};

AddDeviceManager.prototype.saveRowThanh = function(oTable, nRow, rowValue) {
    var jqInputs = $('input', nRow);
    if(typeof rowValue == 'undefined') {
    	oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
        oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
        oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
        oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
        oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
        oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Sửa</a> <a href="javascript:void(0)" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Xóa</a>', nRow, 5, false);
        oTable.fnDraw();
    } else {
    	oTable.fnUpdate(rowValue.codePhuKien, nRow, 0, false);
        oTable.fnUpdate(rowValue.tenPhuKien, nRow, 1, false);
        oTable.fnUpdate(rowValue.mieuTa, nRow, 2, false);
        oTable.fnUpdate(rowValue.giaOrder, nRow, 3, false);
        oTable.fnUpdate(rowValue.giaVeVietNam, nRow, 4, false);
        oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Sửa</a> <a href="javascript:void(0)" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Xóa</a>', nRow, 5, false);
        oTable.fnDraw();
    }
    
};

AddDeviceManager.prototype.cancelEditRowThanh = function(oTable, nRow) {
    var jqInputs = $('input', nRow);
    oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
    oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
    oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
    oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
    oTable.fnUpdate(jqInputs[4].value, nRow, 4, false);
    oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Sửa</a> <a href="javascript:void(0)" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Xóa</a>', nRow, 5, false);
    oTable.fnDraw();
};

AddDeviceManager.prototype.editAddedRowPhuKien = function(oTable, nRow) {
    var aData = oTable.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    jqTds[0].innerHTML = '<input type="text" class="input-small" value="' + aData[0] + '">'; //code
    jqTds[1].innerHTML = '<input type="text" style="width:100%" class="input-small" value="' + aData[1] + '">'; //article
    jqTds[2].innerHTML = '<input type="text" style="width:100%;" class="input-small" value="' + aData[2] + '">'; // note
    
    var selectStr =  '<select class="input-small" style="width:100%">';
    	selectStr += '<option value="1">1</option>';
    	selectStr += '<option value="2">2</option>';
    	selectStr += '<option value="3">3</option>';
    	selectStr += '<option value="4">4</option>';
    	selectStr += '<option value="5">5</option>';
    	selectStr += '<option value="6">6</option>';
    	selectStr += '<option value="7">7</option>';
    	selectStr += '<option value="8">8</option>';
    	selectStr += '<option value="9">9</option>';
    	selectStr += '</select>';
    jqTds[3].innerHTML = selectStr;
    
    var selectStr1 =  '<select class="input-small"> style="width:100%"';
	selectStr1 += '<option value="">None</option>';
	selectStr1 += '<option value="R">Phải (RS)</option>';
	selectStr1 += '<option value="L">Trái (LS)</option>';
	selectStr1 += '</select>';
	jqTds[4].innerHTML = selectStr1;
	
    jqTds[5].innerHTML = '<input type="number" style="width:100%;" class="giaOrder input-small" value="' + aData[5] + '">';
    jqTds[6].innerHTML = '<input type="number" style="width:100%;" class="giaVeVietNam input-small" value="' + aData[6] + '">';
    jqTds[7].innerHTML = aData[7];
};

AddDeviceManager.prototype.editRowPhuKien = function(oTable, nRow) {
    var aData = oTable.fnGetData(nRow);
    var jqTds = $('>td', nRow);
    jqTds[0].innerHTML = '<input type="text" style="width:100%;" class="input-small" value="' + aData[0] + '">';
    jqTds[1].innerHTML = '<input type="text" style="width:100%;" class="input-small" value="' + aData[1] + '">';
    jqTds[2].innerHTML = '<input type="text" style="width:100%;" class="input-small" value="' + aData[2] + '">';
    
    var selectStr =  '<select class="input-small" style="width:100%;">';
    for(var i = 1; i < 10; i++) {
    	if(i == aData[3]) {
    		selectStr += '<option value="'+i+'" selected="selected">'+i+'</option>';
    	} else {
    		selectStr += '<option value="'+i+'">'+i+'</option>';
    	}
    }
	selectStr += '</select>';
	jqTds[3].innerHTML = selectStr;
	
	var selectStr1 =  '<select class="input-small"> style="width:100%;"';
	if(aData[4] == ''){
		selectStr1 += '<option value="" selected="selected">None</option>';
		selectStr1 += '<option value="R">Phải (RS)</option>';
		selectStr1 += '<option value="L">Trái (LS)</option>';
	} else if(aData[4] == 'RS') {
		selectStr1 += '<option value="">None</option>';
		selectStr1 += '<option value="R" selected="selected">Phải (RS)</option>';
		selectStr1 += '<option value="L">Trái (LS)</option>';
	} else {
		selectStr1 += '<option value="">None</option>';
		selectStr1 += '<option value="R">Phải (RS)</option>';
		selectStr1 += '<option value="L" selected="selected">Trái (LS)</option>';
	}
	
	selectStr1 += '</select>';
	jqTds[4].innerHTML = selectStr1;
    
    
    jqTds[5].innerHTML = '<input type="number" style="width:100%;" class="giaOrder input-small" value="' + aData[3] + '">';
    jqTds[6].innerHTML = '<input type="number" style="width:100%;" class="giaVeVietNam input-small" value="' + aData[4] + '">';
    jqTds[7].innerHTML = '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-save"></i> Lưu</a> <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> Hủy</a>';
    
};

AddDeviceManager.prototype.saveRowPhuKien = function(oTable, nRow, rowValue) {
	if(typeof rowValue == 'undefined') {
		var jqInputs = $('input', nRow);
	    var jqSelects = $('select', nRow);
	    oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
	    oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
	    oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
	    oTable.fnUpdate(jqSelects[0].value, nRow, 3, false);
	    oTable.fnUpdate(jqSelects[1].value, nRow, 4, false);
	    oTable.fnUpdate(jqInputs[3].value, nRow, 5, false);
	    oTable.fnUpdate(jqInputs[4].value, nRow, 6, false);
	    oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Sửa</a> <a href="javascript:void(0)" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Xóa</a>', nRow, 7, false);
	    oTable.fnDraw();
	} else {
		oTable.fnUpdate(rowValue.codePhuKien, nRow, 0, false);
	    oTable.fnUpdate(rowValue.tenPhuKien, nRow, 1, false);
	    oTable.fnUpdate(rowValue.mieuTa, nRow, 2, false);
	    oTable.fnUpdate(rowValue.quantity, nRow, 3, false);
	    if(rowValue.huongPhuKien == null) { oTable.fnUpdate("", nRow, 4, false); }
	    else { oTable.fnUpdate(rowValue.huongPhuKien, nRow, 4, false); }
	    
	    oTable.fnUpdate(rowValue.giaOrder, nRow, 5, false);
	    oTable.fnUpdate(rowValue.giaVeVietNam, nRow, 6, false);
	    oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Sửa</a> <a href="javascript:void(0)" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Xóa</a>', nRow, 7, false);
	    oTable.fnDraw();
	}
    
};

AddDeviceManager.prototype.fillData = function(idCua) {
	var self = this;
	var url = "/rest/getCuaById?idCua="+idCua;		
	$.ajax({
		type : "GET",
		contentType : "application/json",
		url : url,
		dataType : 'json',
		//timeout : 30000,
		success : function(response) {
			console.log(response);
			self.fireDataObject(response.cua, response.danhSachPhuKien);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
};

AddDeviceManager.prototype.fireDataObject = function(cua, danhSachPhuKien) {
	var self = this;
	$("#kyHieu").val(cua.kyHieu);
	self.base64 = cua.anhDaiDien;
	$("#heProfile").val(cua.heProfile);
	$("#cuaTruotQuay").val(cua.cuaTruotQuay);
	$("#heMo").val(cua.heMo);
	$("#soCanh").val(cua.soCanh);
	$("#loaiBanLe").val(cua.loaiBanLe);
	$("#heSoAnToan").val(cua.heSoAnToan);
	$("#loaiCua").val(cua.loaiCua);
	
	console.log(danhSachPhuKien);
	//fill thanh da diem
	self.fireTableDataThanh("table-thanh-da-diem", "addThanhDaDiem_PhuKienSelectBox", danhSachPhuKien.thanhDaDiemList);
	
	//fill thanh noi chieu ngang
	self.fireTableDataThanh("table-thanh-chieu-ngang", "addThanhChieuNgang_PhuKienSelectBox", danhSachPhuKien.thanhNgangList);
	
	//fill thanh noi chieu doc
	self.fireTableDataThanh("table-thanh-chieu-doc", "addThanhChieuDoc_PhuKienSelectBox", danhSachPhuKien.thanhDocList);
	
	//fill kalemon
	self.fireTableDataThanh("table-klemon", "addKlemon_PhuKienSelectBox", danhSachPhuKien.klemonList);
	
	//fill ban-le concept
	self.fireTableDataPhuKien("table-ban-le-concept", danhSachPhuKien.banLeList);
	
	//fill cac phu kien khac
	self.fireTableDataPhuKien("table-phu-kien-required", danhSachPhuKien.pkBatBuocList);
	
	//fill vau
	var vau = danhSachPhuKien.vauList[0];
	$("#vauCode").val(vau.codePhuKien);
	$("#vauArticle").val(vau.tenPhuKien);
	$("#vauNote").val(vau.mieuTa);
	$("#vauGiaOrder").val(vau.giaOrder);
	$("#vauGiaVeVietNam").val(vau.giaVeVietNam);
	
};

AddDeviceManager.prototype.fireTableDataThanh = function(idTable, selectId, listPk) {
	var self = this;
	var oTable = $('#'+idTable).dataTable();
	for( var i = 0 ; i < listPk.length ; i ++ ) {
		var aiNew = oTable.fnAddData([
		                              '', '', '', '', '',
		                              '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-edit"></i> Lưu</a> <a href="#" class="btn btn-warning btn-xs cancel" data-mode="new"><i class="fa fa-times"></i> Hủy</a>'
		 ]);
		var nRow = oTable.fnGetNodes(aiNew[0]);
		var item = listPk[i];
		$("#"+selectId).val(item.quantity);
		self.saveRowThanh(oTable, nRow, item);
	}
};

AddDeviceManager.prototype.fireTableDataPhuKien = function(idTable, listPk) {
	var self = this;
	var oTable = $('#'+idTable).dataTable();
	for( var i = 0 ; i < listPk.length ; i ++ ) {
		var aiNew = oTable.fnAddData([
		                              '', '', '', '', '','', '',
		                              '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-edit"></i> Lưu</a> <a href="#" class="btn btn-warning btn-xs cancel" data-mode="new"><i class="fa fa-times"></i> Hủy</a>'
		 ]);
		var nRow = oTable.fnGetNodes(aiNew[0]);
		var item = listPk[i];
		self.saveRowPhuKien(oTable, nRow, item);
	}
};







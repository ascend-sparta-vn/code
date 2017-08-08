window.CONSTANTS || ( CONSTANTS = {});
CONSTANTS.pathToLang = "../js/lang/";
CONSTANTS.DEFAULT_LANGUAGE = 'vi';
var ENCODING_UTF8 = "UTF-8";


/*
 * constant for jquery data table 
 */
JQUERY_DATA_TABLE={};
JQUERY_DATA_TABLE.LANGUAGE = {
	PREVIOUS_PAGE : "Trang trước",				
	NEXT_PAGE:"Trang sau",				
	SZERORECORDS: "Không có dữ liệu được tìm thấy",
	PROCESSING: "Đang xử lý...",
	SEARCH: "Tìm kiếm ",
	LENGTHMENU: "Hiển thị _MENU_ bản ghi trên trang",
	INFO: "Hiển thị bản ghi _START_ tới bản ghi _END_ của _TOTAL_ bản ghi ",
	INFOEMPTY: ""
};

CSRF_TOKEN={};
CSRF_TOKEN.TOKEN = {
	KEY : "csrf_token"				
};


CRUD={};
CRUD.STATUS = {
	SUCCESS: 0,
	FAIL: 3
};

CRUD.MODE = {
		ADD: 'add',
		UPDATE: 'update',
		VIEW: 'view',
		COPY: 'copy'
};

var MAP_CFG = {
		LAT_DEFAULT : 21.036485,
		LNG_DEFAULT : 105.789611,
		ZOOM_DEFAULT : 13,
		ZOOM_IN : 15
}

var RESPONSE={};
RESPONSE.CODE={
		SUCCESS : '0',
		FAIL:'-1'
}

var TRANSACTION={};
TRANSACTION.TYPE={
		SHIPMENT : 2,
		TRUCKING : 1
}

ROLE_MODE={
		APPROVE: 1,
		NO_APPROVE: 0,
		EDIT:1,
		NO_EDIT:0
};

DATA_STATUS={
		APPROVE: 1,
		NO_APPROVE: 0,
};

var REALTIME = {
		TRUCKING_LOCATION : 30000
}

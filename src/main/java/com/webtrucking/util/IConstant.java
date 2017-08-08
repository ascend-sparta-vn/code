package com.webtrucking.util;

public class IConstant {

	// server
	public static interface LOGIN_STATUS {
		public static final String ANONYMOUS_USER = "anonymousUser";
		public static final String SITE_KEY ="6Ldv6AsUAAAAAKjJ_3XCBSwJorDE8GMPM_FMDLsD";
		public static final String SECRET_KEY ="6Ldv6AsUAAAAAJ9srz_lcpCQnIbbyQscfq4UQ9J1";
		public static final int USER_STATUS_ACTIVE = 1;
		public static final int USER_STATUS_UNACTIVE = 0;
	}
	
	public static interface ACCOUNT {
		public static final int ACTIVE = 1;
		public static final int INACTIVE = 0;
		public static final int SHIPMENT_OWNER = 1;
		public static final int VEHICLE_OWNER = 2;
	}
	
	public static interface RESPONSE_STATUS {
		public static final String SUCCESS = "SUCCESS";
		public static final String FAIL = "FAIL";
	}
	
	public static interface ROLE {
		public static final String ROLE_ADMIN = "ROLE_ADMIN";
		public static final String ROLE_CLIENT = "ROLE_CLIENT";
		public static final String ROLE_SHIPMENT_OWNER = "ROLE_SHIPMENT_OWNER";
		public static final String ROLE_VEHICLE_OWNER = "ROLE_VEHICLE_OWNER";
	}

	public static interface RESP_CODE {
		String SUCCESS = "0";
		String FAIL = "-1";
	}
	
	public static interface CFG_VALUE {
		Integer TRUCK_CODE = 1000;
	}
	
	public static interface STATUS {
		public static final int TRUCK_ACTIVE = 1;
		public static final int TRUCK_UNACTIVE = 0;
		
		public static final int SHIPMENT_ACTIVE = 1;
		public static final int SHIPMENT_UNACTIVE = 0;
	}
	
	public static interface LANGUAGE {
		String ENGLISH = "2";
		String VIETNAM = "1";
	}
	
	public static interface TRANSACTION_TYPE {
		Integer SHIPMENT = 2;
		Integer TRUCKING = 1;
	}
	
	public static interface TRANSACTION_TYPE_NAME {
		String SHIPMENT = "Yêu cầu về hàng";
		String TRUCKING = "Yêu cầu về xe";
	}
	
	public static interface ORDER_TYPE {
		public static final String RECEIVE = "Yêu cầu nhận";
		public static final String SEND = "Yêu cầu gửi";
	}
	
	public static interface MESSAGE {
		String ERROR ="ERROR";
		String SUCCESS ="SUCCESS";
		String USER_EXISTED = "Username đã tồn tại";
	}
	
	public static interface MODE {
		public static final int APPROVE = 1;
		public static final int NO_APPROVE = 0;
		public static final int EDIT = 1;
		public static final int NO_EDIT = 0;
	}
	
	public static interface EMAIL_PREFIX {
		public static final String OWNER = "OWN_";
		public static final String SHIPMENT = "SHP_";
		public static final String TRUCKING = "TRK_";
		public static final String ORDER = "ORD_";
	}
	
	public static interface WEIGHT_UNIT {
		public static final String TAN = " Tấn";
		public static final String KHOI = " Khối";
		public static final String KHOI_KM = " Khối/Km";
		public static final String CHUYEN = " Chuyến";
	}
	
	public static interface PRICE_UNIT {
		public static final String TAN = "Triệu/Tấn";
		public static final String KHOI = "Triệu/Khối";
		public static final String Kg = "Triệu/Kg";
	}
	
	public static interface INCLUDE_FEE {
		public static final String INCLUDE = " Đã bao gồm";
		public static final String NOT_INCLUDE = " Chưa bao gồm";
	}
	
	public static interface GOODS_TYPE {
		public static final String HANG_DIEN_MAY = "Hàng điện máy";
		public static final String NONG_SAN = "Nông sản";
		public static final String PHU_TUNG = "Phụ tùng máy móc";
		public static final String SAT_CUON = "Sắt cuộn";
		public static final String THUY_HAI_SAN = "Thủy hải sản";
		public static final String VLXD = "Vật liệu xây dựng";
		public static final String XE_2_BANH = "Xe 2 bánh";
		public static final String XE_OTO = "Xe oto";
	}
	
	public static interface STATISTIC_TYPE {
		public static final int NOI_DI = 1;
		public static final int NOI_DEN = 2;
		public static final int LOAI_HANG_HOA = 3;
		public static final int KHOI_LUONG_HANG = 4;
	}
	
}

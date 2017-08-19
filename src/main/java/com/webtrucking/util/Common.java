package com.webtrucking.util;

import com.webtrucking.entity.District;
import com.webtrucking.entity.Province;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.util.ArrayList;
import java.util.List;

public class Common {

	public static boolean isValidEmailAddress(String email) {
		   boolean result = true;
		   try {
		      InternetAddress emailAddr = new InternetAddress(email);
		      emailAddr.validate();
		   } catch (AddressException ex) {
		      result = false;
		   }
		   return result;
	}
	
	public static String convertWeighUnit(Integer unit){
		if(unit == null) return "N/A";
		String unitStr = "";
		switch (unit.intValue()) {
		case 1:
			unitStr = IConstant.WEIGHT_UNIT.TAN;
			break;
		case 2:
			unitStr = IConstant.WEIGHT_UNIT.KHOI;
			break;
		case 3:
			unitStr = IConstant.WEIGHT_UNIT.KHOI_KM;
			break;
		case 4:
			unitStr = IConstant.WEIGHT_UNIT.CHUYEN;
			break;
		default:
			unitStr = "N/A";
			break;
		}
		
		return unitStr;
	}
	
	public static String convertPriceUnit(Integer unit){
		if(unit == null) return "N/A";
		String unitStr = "";
		switch (unit.intValue()) {
		case 1:
			unitStr = IConstant.WEIGHT_UNIT.TAN;
			break;
		case 2:
			unitStr = IConstant.WEIGHT_UNIT.KHOI;
			break;
		case 3:
			unitStr = IConstant.WEIGHT_UNIT.KHOI_KM;
			break;
		default:
			unitStr = "N/A";
			break;
		}
		
		return unitStr;
	}
	
	public static String convertIncludeFee(Integer code){
		if(code == null) return "N/A";
		String codeStr = "";
		switch (code.intValue()) {
		case 0:
			codeStr = IConstant.INCLUDE_FEE.NOT_INCLUDE;
			break;
		case 1:
			codeStr = IConstant.INCLUDE_FEE.INCLUDE;
			break;
		default:
			codeStr = "N/A";
			break;
		}
		
		return codeStr;
	}
	
	public static String convertOrderType(Integer type){
		if(type == null) return "N/A";
		String typeStr = "";
		switch (type.intValue()) {
		case 1:
			typeStr = IConstant.ORDER_TYPE.RECEIVE;
			break;
		case 2:
			typeStr = IConstant.ORDER_TYPE.SEND;
			break;
		default:
			typeStr = "N/A";
			break;
		}
		
		return typeStr;
	}
	
	public static String convertTransactionType(Integer type){
		if(type == null) return "N/A";
		String typeStr = "";
		switch (type.intValue()) {
		case 1:
			typeStr = IConstant.TRANSACTION_TYPE_NAME.TRUCKING;
			break;
		case 2:
			typeStr = IConstant.TRANSACTION_TYPE_NAME.SHIPMENT;
			break;
		default:
			typeStr = "N/A";
			break;
		}
		
		return typeStr;
	}
	
	public static String convertGoodsType(Integer type){
		if(type == null) return "N/A";
		String typeStr = "";
		switch (type.intValue()) {
		case 1:
			typeStr = IConstant.GOODS_TYPE.HANG_DIEN_MAY;
			break;
		case 2:
			typeStr = IConstant.GOODS_TYPE.NONG_SAN;
			break;
		case 3:
			typeStr = IConstant.GOODS_TYPE.PHU_TUNG;
			break;
		case 4:
			typeStr = IConstant.GOODS_TYPE.SAT_CUON;
			break;
		case 5:
			typeStr = IConstant.GOODS_TYPE.THUY_HAI_SAN;
			break;
		case 6:
			typeStr = IConstant.GOODS_TYPE.VLXD;
			break;
		case 7:
			typeStr = IConstant.GOODS_TYPE.XE_2_BANH;
			break;
		case 8:
			typeStr = IConstant.GOODS_TYPE.XE_OTO;
			break;
		default:
			typeStr = "N/A";
			break;
		}
		
		return typeStr;
	}
	
	public static Province getProvinceById(Integer provinceId){
		if(provinceId == null || provinceId == -1) return null;
		Province province = null;
		List<Province> listProvince = CacheUtil.listProvinceCache.get("listProvince");
		for(Province p : listProvince){
			if(p.getId().intValue() == provinceId.intValue()){
				province = p;
				return province;
			}
				
		}
		return province;
	}
	
	public static Province getProvinceByDistrictId(Integer districtId){
		if(districtId == null || districtId == -1) return null;
		Province province = null;
		List<District> listDistrict = CacheUtil.listDistrictCache.get("listDistrict");
		for(District p : listDistrict){
			if(p.getId().intValue() == districtId.intValue()){
				province = getProvinceById(p.getProvinceId().intValue());
				return province;
			}
			
		}
		return province;
	}
	
	public static District getDistrictById(Integer districtId){
		if(districtId == null || districtId == -1) return null;
		District district = null;
		List<District> listDistrict = CacheUtil.listDistrictCache.get("listDistrict");
		for(District p : listDistrict){
			if(p.getId().intValue() == districtId.intValue()){
				district = p;
				return district;
			}
			
		}
		return district;
	}
	
	public static String getMd5(String input) {
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		String text = md5.encodePassword(input, "");
		return text;
	}

	/**
	 * Compute the hash value to check for "real person" submission.
	 * 
	 * @param  value  the entered value
	 * @return  its hash value
	 */
	public static String rpHash(String value) {
		int hash = 5381;
		value = value.toUpperCase();
		for(int i = 0; i < value.length(); i++) {
			hash = ((hash << 5) + hash) + value.charAt(i);
		}
		return String.valueOf(hash);
	}

	public static <E> List<E> toList(Iterable<E> iterable) {
		if(iterable == null || iterable instanceof List) {
			return (List<E>) iterable;
		}
		ArrayList<E> list = new ArrayList<E>();
		if(iterable != null) {
			for(E e: iterable) {
				list.add(e);
			}
		}
		return list;
	}

	public static String getReturnPage(Authentication authen) {
		String username = "";
		if(authen != null) {
			username = authen.getName();
			switch (username) {
				case "admin":
					return "forward:/order/list";
				case "customer":
					return "forward:/product/list";
				case "provider":
					return "provider_product.list";
				case "transporter":
					return "forward:/shipment/list";
				default:
					return "account.login";
			}
		}

		return "hompage";
	}
	
}

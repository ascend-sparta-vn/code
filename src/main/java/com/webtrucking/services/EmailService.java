package com.webtrucking.services;

import java.io.StringWriter;
import java.text.SimpleDateFormat;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.webtrucking.dao.TruckDAO;
import com.webtrucking.entity.District;
import com.webtrucking.entity.OrdersShipment;
import com.webtrucking.entity.OrdersTrucking;
import com.webtrucking.entity.Province;
import com.webtrucking.entity.Shipment;
import com.webtrucking.entity.Truck;
import com.webtrucking.entity.TruckInfoDetail;
import com.webtrucking.util.Common;
import com.webtrucking.util.DateUtils;
import com.webtrucking.util.IConstant;

@Service
public class EmailService {

	static Logger log = LogManager.getLogger(EmailService.class);
	private SimpleDateFormat sdf = new SimpleDateFormat(DateUtils.ddMMyyyyHHmmss_FULL_SLASH);
	private JavaMailSender javaMailSender;

	@Autowired
	private VelocityEngine velocityEngine;
	
	@Autowired
	private TruckDAO truckDAO;

	@Autowired
	public EmailService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Async
	public void createAccountNotifyMail(String urlActive, String username) throws MailException, InterruptedException, MessagingException {
		log.info("Sending email...");

		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("username", username);
		velocityContext.put("urlActive", urlActive);
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("create-account.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(username);
		mimeMessageHelper.setSubject("Goixe.vn - Thông báo tạo tài khoản");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");

	}
	
	@Async
	public void createOrderTruckingNotifyEmail(String urlOrderDetail, OrdersTrucking order, String email) throws MailException, InterruptedException, MessagingException {
		log.info("Sending email...");
		
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("urlOrderDetail", urlOrderDetail);
		velocityContext.put("partner_id", IConstant.EMAIL_PREFIX.OWNER + order.getPartnerId());
		velocityContext.put("event_id", order.getTruckInfo().getTruck().getTruckCode());
//		velocityContext.put("event_id", IConstant.EMAIL_PREFIX.TRUCKING + order.getEventId());
		velocityContext.put("quantity", order.getQuantity() + Common.convertWeighUnit(order.getUnit()));
		velocityContext.put("expected_price", order.getExpectedPrice());
		velocityContext.put("vat_fee", Common.convertIncludeFee(order.getVatFee()));
		velocityContext.put("porter_fee", Common.convertIncludeFee(order.getPorterFee()));
		velocityContext.put("shift_fee", order.getShiftFee());
		velocityContext.put("description", order.getDescription());
		velocityContext.put("order_type", Common.convertOrderType(order.getOrderType()));
		velocityContext.put("transaction_type", Common.convertTransactionType(order.getTransactionType()));
		velocityContext.put("created_date", sdf.format(order.getCreatedDate()));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("create-order-trucking.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(email);
		mimeMessageHelper.setSubject("[ORD_" + order.getId() + "] Goixe.vn - Thông báo tạo yêu cầu về xe");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
		
	}
	
	@Async
	public void createOwnerOrderTruckingNotifyEmail(String urlOrderDetail, OrdersTrucking order, String email) throws MailException, InterruptedException, MessagingException {
		log.info("Sending email...");
		
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("urlOrderDetail", urlOrderDetail);
		velocityContext.put("partner_id", IConstant.EMAIL_PREFIX.OWNER + order.getOwnerId());
		velocityContext.put("event_id", order.getTruckInfo().getTruck().getTruckCode());
//		velocityContext.put("event_id", IConstant.EMAIL_PREFIX.TRUCKING + order.getEventId());
		velocityContext.put("quantity", order.getQuantity() + Common.convertWeighUnit(order.getUnit()));
		velocityContext.put("expected_price", order.getExpectedPrice());
		velocityContext.put("vat_fee", Common.convertIncludeFee(order.getVatFee()));
		velocityContext.put("porter_fee", Common.convertIncludeFee(order.getPorterFee()));
		velocityContext.put("shift_fee", order.getShiftFee());
		velocityContext.put("description", order.getDescription());
		velocityContext.put("order_type", Common.convertOrderType(order.getOrderType()));
		velocityContext.put("transaction_type", Common.convertTransactionType(order.getTransactionType()));
		velocityContext.put("created_date", sdf.format(order.getCreatedDate()));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("owner-order-trucking.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(email);
		mimeMessageHelper.setSubject("[ORD_" + order.getId() + "] Goixe.vn - Thông báo nhận yêu cầu về xe");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
		
	}
	
	
	@Async
	public void createTruckingPostNotifyEmail(String urlTruckingDetail, TruckInfoDetail truckInfo) throws MailException, InterruptedException, MessagingException {
		log.info("Sending email...");
		Truck truck = truckDAO.findOne(truckInfo.getTruckId());
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("urlTruckingDetail", urlTruckingDetail);
		if(truck != null)
			velocityContext.put("trucking_code", truck.getPlateNumber());
		velocityContext.put("trucking_type", Common.convertGoodsType(truckInfo.getGoodsTypeId()));
		velocityContext.put("goods_type", Common.convertGoodsType(truckInfo.getGoodsTypeId()));
		velocityContext.put("trucking_weight", truckInfo.getWeight());
		velocityContext.put("trucking_unit", Common.convertWeighUnit(truckInfo.getWeightUnit()));
		
		Province fromProvince = Common.getProvinceByDistrictId(truckInfo.getFromDistrict());
		velocityContext.put("trucking_province_from", (fromProvince == null) ? "N/A" : fromProvince.getName());
		District fromDistrict = Common.getDistrictById(truckInfo.getFromDistrict());
		velocityContext.put("trucking_district_from", (fromDistrict == null) ? "N/A" : fromDistrict.getName());
		Province toProvince = Common.getProvinceByDistrictId(truckInfo.getToDistrict());
		velocityContext.put("trucking_provice_to", (toProvince == null) ? "N/A" : toProvince.getName());
		District toDistrict = Common.getDistrictById(truckInfo.getToDistrict());
		velocityContext.put("trucking_district_to", (toDistrict == null) ? "N/A" : toDistrict.getName());
		velocityContext.put("address_from", truckInfo.getFromDetailAddress());
		velocityContext.put("address_to", truckInfo.getToDetailAddress());
		velocityContext.put("created_date", sdf.format(truckInfo.getCreatedDate()));
		velocityContext.put("expired_date", sdf.format(truckInfo.getExpiredDate()));
		velocityContext.put("length", truckInfo.getDistance());
		velocityContext.put("price", truckInfo.getPrice());
		velocityContext.put("unit", Common.convertPriceUnit(truckInfo.getPriceUnit()));
		velocityContext.put("description", truckInfo.getDescription());
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("post-trucking.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo("trungnq2@elcom.com.vn");
		mimeMessageHelper.setSubject("[TRK_" + truckInfo.getId() + "] Goixe.vn - Thông báo tạo mới xe chở hàng");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
		
	}
	
	@Async
	public void createOrderShipmentNotifyEmail(String urlOrderDetail, OrdersShipment order, String email) throws MailException, InterruptedException, MessagingException {
		log.info("Sending email...");
		
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("urlOrderDetail", urlOrderDetail);
		velocityContext.put("partner_id", IConstant.EMAIL_PREFIX.OWNER + order.getPartnerId());
		velocityContext.put("event_id", IConstant.EMAIL_PREFIX.SHIPMENT + order.getEventId());
		velocityContext.put("quantity", order.getQuantity() + Common.convertWeighUnit(order.getUnit()));
		velocityContext.put("expected_price", order.getExpectedPrice());
		velocityContext.put("vat_fee", Common.convertIncludeFee(order.getVatFee()));
		velocityContext.put("porter_fee", Common.convertIncludeFee(order.getPorterFee()));
		velocityContext.put("shift_fee", order.getShiftFee());
		velocityContext.put("description", order.getDescription());
//		velocityContext.put("order_type", Common.convertOrderType(order.getOrderType()));
		velocityContext.put("created_date", sdf.format(order.getCreatedDate()));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("create-order-shipment.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(email);
		mimeMessageHelper.setSubject("[ORD_" + order.getId() + "] Goixe.vn - Thông báo tạo yêu cầu về hàng");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
		
	}
	@Async
	public void createOwnerOrderShipmentNotifyEmail(String urlOrderDetail, OrdersShipment order, String email) throws MailException, InterruptedException, MessagingException {
		log.info("Sending email...");
		
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("urlOrderDetail", urlOrderDetail);
		velocityContext.put("partner_id", IConstant.EMAIL_PREFIX.OWNER + order.getOwnerId());
		velocityContext.put("event_id", IConstant.EMAIL_PREFIX.SHIPMENT + order.getEventId());
		velocityContext.put("quantity", order.getQuantity() + Common.convertWeighUnit(order.getUnit()));
		velocityContext.put("expected_price", order.getExpectedPrice());
		velocityContext.put("vat_fee", Common.convertIncludeFee(order.getVatFee()));
		velocityContext.put("porter_fee", Common.convertIncludeFee(order.getPorterFee()));
		velocityContext.put("shift_fee", order.getShiftFee());
		velocityContext.put("description", order.getDescription());
//		velocityContext.put("order_type", Common.convertOrderType(order.getOrderType()));
		velocityContext.put("created_date", sdf.format(order.getCreatedDate()));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("owner-order-shipment.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(email);
		mimeMessageHelper.setSubject("[ORD_" + order.getId() + "] Goixe.vn - Thông báo nhận yêu cầu về hàng");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
		
	}
	@Async
	public void createShipmentPostNotifyEmail(String urlShipmentDetail, Shipment shipment) throws MailException, InterruptedException, MessagingException {
		log.info("Sending email...");
		
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("urlShipmentDetail", urlShipmentDetail);
		velocityContext.put("shipment_name", shipment.getName());
		velocityContext.put("shipment_type", Common.convertGoodsType(shipment.getGoodsTypeId()));
		velocityContext.put("shipment_weight", shipment.getWeight());
		velocityContext.put("shipment_unit", Common.convertWeighUnit(shipment.getWeightUnit()));
		
		Province fromProvince = Common.getProvinceByDistrictId(shipment.getFromDistrict());
		velocityContext.put("shipment_province_from", (fromProvince == null) ? "N/A" : fromProvince.getName());
		District fromDistrict = Common.getDistrictById(shipment.getFromDistrict());
		velocityContext.put("shipment_district_from", (fromDistrict == null) ? "N/A" : fromDistrict.getName());
		Province toProvince = Common.getProvinceByDistrictId(shipment.getToDistrict());
		velocityContext.put("shipment_provice_to", (toProvince == null) ? "N/A" : toProvince.getName());
		District toDistrict = Common.getDistrictById(shipment.getToDistrict());
		velocityContext.put("shipment_district_to", (toDistrict == null) ? "N/A" : toDistrict.getName());
		velocityContext.put("address_from", shipment.getFromDetailAddress());
		velocityContext.put("address_to", shipment.getToDetailAddress());
		velocityContext.put("created_date", sdf.format(shipment.getCreatedDate()));
		velocityContext.put("expired_date", sdf.format(shipment.getExpiredDate()));
		velocityContext.put("length", shipment.getDistance());
		velocityContext.put("price", shipment.getPrice());
		velocityContext.put("unit", Common.convertPriceUnit(shipment.getPriceUnit()));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("post-shipment.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo("trungnq2@elcom.com.vn");
		mimeMessageHelper.setSubject("[SHP_" + shipment.getId() + "] Goixe.vn - Thông báo tạo mới hàng");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
		
	}

	@Async
	public void changePassNotification(String username) {
		log.info("Sending email...");
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("username", username);
		velocityContext.put("time", DateUtils.getCurrentDateTime(DateUtils.ddMMyyyyHHmmss_FULL_SLASH));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("change-pass.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper;
		try {
			mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
			mimeMessageHelper.setTo(username);
			mimeMessageHelper.setSubject("Goixe.vn - Thông báo thay đổi mật khẩu");
			mimeMessageHelper.setText(stringWriter.toString(), true);
			javaMailSender.send(mimeMessage);
			log.info("Email Sent!");
		} catch (MessagingException e) {
			log.error("", e);
		}
	}

	public void sendForgotPassNotify(String email, String link) throws MessagingException {
		log.info("Sending email...");
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("username", email);
		velocityContext.put("link", link);
		velocityContext.put("time", DateUtils.getCurrentDateTime(DateUtils.ddMMyyyyHHmmss_FULL_SLASH));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("request-change-pass.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper;
		mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(email);
		mimeMessageHelper.setSubject("Goixe.vn - Yêu cầu cấp lại mật khẩu");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
	}

	public void sendResetPass(String email, String password) throws MessagingException {
		log.info("Sending email...");
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("username", email);
		velocityContext.put("password", password);
		velocityContext.put("time", DateUtils.getCurrentDateTime(DateUtils.ddMMyyyyHHmmss_FULL_SLASH));
		
		StringWriter stringWriter = new StringWriter();
		velocityEngine.mergeTemplate("new-pass.vm", "UTF-8", velocityContext, stringWriter);
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper;
		mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
		mimeMessageHelper.setTo(email);
		mimeMessageHelper.setSubject("Goixe.vn - Mật khẩu mới");
		mimeMessageHelper.setText(stringWriter.toString(), true);
		javaMailSender.send(mimeMessage);
		log.info("Email Sent!");
	}
}
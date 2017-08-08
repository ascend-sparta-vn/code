package com.webtrucking.util;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
 

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Service;

public class VerifyUtils {
 
   public static final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
 
   public static boolean verify( String gRecaptchaResponse, String siteUrl, String secretKey) {
       if (gRecaptchaResponse == null || gRecaptchaResponse.length() == 0) {
           return false;
       }
 
       try {
           URL verifyUrl = new URL(siteUrl);
 
           // Mở kết nối (Connection) tới URL trên.
           HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();
 
           // Thêm các thông tin Header vào Request chuẩn bị gửi tới server.
           // Add Request Header
           conn.setRequestMethod("POST");
           conn.setRequestProperty("User-Agent", "Mozilla/5.0");
           conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
 
           // Dữ liệu sẽ gửi tới server.
           String postParams = "secret=" + secretKey + "&response=" + gRecaptchaResponse;
 
           // Send Request
           conn.setDoOutput(true);
 
           // Lấy luồng đầu ra của kết nối tới server.
           // Ghi dữ liệu vào luồng này, có nghĩa là gửi thông tin đến Server.
           OutputStream outStream = conn.getOutputStream();
           outStream.write(postParams.getBytes());
 
           outStream.flush();
           outStream.close();
 
           // Mã trả lời trả về từ Server.
           int responseCode = conn.getResponseCode();
           System.out.println("responseCode=" + responseCode);
 
           // Lấy InputStream từ Connection để đọc dữ liệu gửi về từ Server.
           InputStream is = conn.getInputStream();
 
           JsonReader jsonReader = Json.createReader(is);
           JsonObject jsonObject = jsonReader.readObject();
           jsonReader.close();
 
           // ==> {"success": true}
           System.out.println("Response: " + jsonObject);
 
           boolean success = jsonObject.getBoolean("success");
           return success;
       } catch (Exception e) {
           e.printStackTrace();
           return false;
       }
   }
}

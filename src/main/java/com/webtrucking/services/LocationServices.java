package com.webtrucking.services;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.webtrucking.entity.LocationTrackingObject;
import com.webtrucking.util.DateUtils;

@Service
public class LocationServices {
	static Logger log = LogManager.getLogger(LocationServices.class);
	
	@Autowired
	Environment env;
	
	public LocationTrackingObject getCurrentLocation(String bienSo) {
		LocationTrackingObject obj = new LocationTrackingObject();
        Socket smtpSocket = null;  
        DataOutputStream os = null;
        DataInputStream is = null;
        String ip = env.getProperty("location.api.ip");
        int port = Integer.parseInt(env.getProperty("location.api.port"));
        String requestCode = env.getProperty("location.api.request.code");
        String responseCode = env.getProperty("location.api.response.code");
        String key = env.getProperty("location.api.key");
        
        try {
            smtpSocket = new Socket(ip, port);
            smtpSocket.setSoTimeout(10000);
            os = new DataOutputStream(smtpSocket.getOutputStream());
            is = new DataInputStream(smtpSocket.getInputStream());
        } catch (UnknownHostException e) {
        	log.error("Don't know about host: " + ip);
        } catch (IOException e) {
        	log.error("Couldn't get I/O for the connection to:" + ip);
        }
	    if (smtpSocket != null && os != null && is != null) {
	    try {
	        os.writeBytes(requestCode + "|" + key + "|" + bienSo + "\r\n");
            String responseLine;
            StringBuffer result = new StringBuffer();
            while ((responseLine = is.readLine()) != null) {
            	log.info("Server: " + responseLine);
            	result.append(responseLine);
            	if(result.toString().contains("#DGPS")) break;
            		
                if (responseLine.indexOf("Ok") != -1) {
                  break;
                }
            }
	        os.close();
            is.close();
            smtpSocket.close();   
            
            if(StringUtils.isNotEmpty(result.toString())) {
            	String temp = result.toString();
            	log.info(temp);
            	String[] resultArr = temp.split("\\|");
            	if(resultArr[0].equalsIgnoreCase(responseCode)) {
                	obj.setPlateNumber(resultArr[1]);
                	obj.setGpsfix(Integer.parseInt(resultArr[2]));
                	obj.setLat(Double.parseDouble(resultArr[3]));
                	obj.setLng(Double.parseDouble(resultArr[4]));
                	obj.setUpdatedTime(DateUtils.getDateFromString(resultArr[5], "yyyy-MM-dd HH:mm:ss"));
                	return obj;
                }
            }
            
            
	        } catch (UnknownHostException e) {
	            log.error("Trying to connect to unknown host: " + e);
	        } catch (IOException e) {
	            System.err.println("IOException:  " + e);
	        }
     	}
		return null;
	}
	
}

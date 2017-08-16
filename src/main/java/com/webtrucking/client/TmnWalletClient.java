package com.webtrucking.client;

import com.webtrucking.client.constant.ApiIDs;
import com.webtrucking.dao.ApiConfigurationDAO;
import com.webtrucking.entity.ApiConfiguration;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.JsonValue;
import javax.json.stream.JsonParser;
import java.io.StringReader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

/**
 * Created by ngocthanh on 8/12/17.
 */
@Component
public class TmnWalletClient implements BeanPostProcessor
{
    private Logger log = LogManager.getLogger(TmnWalletClient.class);

    @Autowired
    private ApiConfigurationDAO apiConfigurationDAO;

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {

        return bean;
    }

    public TmnWalletClient() {
        log.info("~~~~~~~~~~~~~ 1");
    }

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

    private Map<Integer, ApiConfiguration> apiConfigurations = new HashMap<>();
    private Map<Integer, String> apiUrls = new HashMap<>();
    public void init() {
        if (apiUrls != null && !apiUrls.isEmpty()) return;
        log.info("~~~~~~~~~~~~~ 2");
        if (apiUrls.isEmpty()) {
            Iterable<ApiConfiguration> apis = apiConfigurationDAO.findAll();
            for (ApiConfiguration api :
                    apis) {
                apiConfigurations.put(api.getApiID(), api);
                apiUrls.put(api.getApiID(), api.getUrl());
            }
        }
        log.info("all configurations: {}", apiConfigurations);
    }
    public Map getOtp(String mobile) {
        init();
        Map<String, Object> headerMap = new HashMap<>();
        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_OTP.getId()).getMethod());
        String endpoint = String.format(apiConfigurations.get(ApiIDs.GET_OTP.getId()).getUrl(), mobile);
        return callApi(endpoint, method, headerMap, null);
    }

    public Map confirmOtp(String otpCode, String otpRef, String mobileNo) {
        init();
        Map<String, Object> headerMap = new HashMap<>();

        Map<String, Object> requestMap = new HashMap<>();
        requestMap.put("otp_code", otpCode);
        requestMap.put("otp_reference", otpRef);
        requestMap.put("mobile_number", mobileNo);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.CONFIRM_OTP.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.CONFIRM_OTP.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    public Map createProfile(String token, Map requestMap) {
        init();
        Map<String, Object> headerMap = new HashMap<>();
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.CREATE_PROFILE.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.CREATE_PROFILE.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    public Map signIn(String username, String password) {

        Map<String, Object> headerMap = new HashMap<>();

        Map<String, Object> requestMap = new HashMap<>();
        String encryptedPassword = toSHA1(password.getBytes());
        requestMap.put("username", username);
        requestMap.put("password", encryptedPassword);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.SIGN_IN.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.SIGN_IN.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map signOut(String token) {

        Map<String, Object> headerMap = new HashMap<>();
        headerMap.put("Content-Type", MediaType.APPLICATION_JSON_UTF8);
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.SIGN_OUT.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.SIGN_OUT.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    public Map getUserProfiles(String token, String deviceOS, String appVersion) {

        Map<String, Object> headerMap = new HashMap<>();
        headerMap.put("Content-Type", MediaType.APPLICATION_JSON_UTF8);
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_USER_PROFILE.getId()).getMethod());
        String endpoint = String.format(apiConfigurations.get(ApiIDs.GET_USER_PROFILE.getId()).getUrl(), deviceOS, appVersion);
        return callApi(endpoint, method, headerMap, null);
    }
//
//    public Map getUserProfiles(String token, String deviceOS, String appVersion) {
//
//        Map<String, Object> headerMap = new HashMap<>();
//        headerMap.put("Content-Type", MediaType.APPLICATION_JSON_UTF8);
//        headerMap.put("token", token);
//
//        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.CONFIRM_OTP.getId()).getMethod());
//        String endpoint = String.format(apiConfigurations.get(ApiIDs.CONFIRM_OTP.getId()).getUrl(), deviceOS, appVersion);
//        return callApi(endpoint, method, headerMap, null);
//    }

    private Map callApi(String endpoint, HttpMethod method, Map<String, Object> headerMap, Map<String, Object> requestMap) {

        HttpHeaders httpHeaders = new HttpHeaders();
        if (headerMap != null) {
            for (Entry<String, Object> headerEntry : headerMap.entrySet()) {
                httpHeaders.set(headerEntry.getKey(), headerEntry.getValue().toString());
            }
        }
        httpHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
        HttpEntity<?> requestEntity = new HttpEntity<>(requestMap, httpHeaders);
        log.info("Sending data to tmn wallet portal with endpoint {}", endpoint);
        log.info("Sending data to tmn wallet portal with request {}", requestEntity);
        ResponseEntity<String> responseEntity = restTemplate().exchange(endpoint,
                method, requestEntity, new ParameterizedTypeReference<String>() {
                });
        log.info("response data: {}", responseEntity.getBody());
        String result = responseEntity.getBody();
        JsonObject jsonResult = jsonFromString(result);
        Set<String> iterator = jsonResult.keySet();
        Map<String, Object> response = new HashMap<>();
        for (String key: iterator) {
            response.put(key, jsonResult.get(key));
        }
        log.info("Received data from tmn wallet portal with response {}", responseEntity.getBody());
        return response;
    }

    private static JsonObject jsonFromString(String jsonObjectStr) {

        JsonReader jsonReader = Json.createReader(new StringReader(jsonObjectStr));
        JsonObject object = jsonReader.readObject();
        jsonReader.close();

        return object;
    }

    private static Map<String, Object> mapFromJsonString(String jsonObjectStr) {

        JsonReader jsonReader = Json.createReader(new StringReader(jsonObjectStr));
        JsonObject jsonResult = jsonReader.readObject();
        jsonReader.close();
        Set<String> iterator = jsonResult.keySet();
        Map<String, Object> response = new HashMap<>();
        for (String key: iterator) {
            response.put(key, jsonResult.get(key));
        }
        return response;
    }

    public static String toSHA1(byte[] convertme) {
        final char[] HEX_CHARS = "0123456789ABCDEF".toCharArray();
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-1");
        }
        catch(NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte[] buf = md.digest(convertme);
        char[] chars = new char[2 * buf.length];
        for (int i = 0; i < buf.length; ++i) {
            chars[2 * i] = HEX_CHARS[(buf[i] & 0xF0) >>> 4];
            chars[2 * i + 1] = HEX_CHARS[buf[i] & 0x0F];
        }
        return new String(chars);
    }
}

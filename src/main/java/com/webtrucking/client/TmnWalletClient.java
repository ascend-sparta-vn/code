package com.webtrucking.client;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.Gson;
import com.webtrucking.client.constant.ApiIDs;
import com.webtrucking.dao.ApiConfigurationDAO;
import com.webtrucking.dto.GeneralResponse;
import com.webtrucking.entity.ApiConfiguration;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
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
        Map<String, String> headerMap = new HashMap<>();
        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_OTP.getId()).getMethod());
        String endpoint = String.format(apiConfigurations.get(ApiIDs.GET_OTP.getId()).getUrl(), mobile);
        return callApi(endpoint, method, headerMap, null);
    }

    public Map confirmOtp(String otpCode, String otpRef, String mobileNo) {
        init();
        Map<String, String> headerMap = new HashMap<>();

        Map<String, String> requestMap = new HashMap<>();
        requestMap.put("otp_code", otpCode);
        requestMap.put("otp_reference", otpRef);
        requestMap.put("mobile_number", mobileNo);
        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.CONFIRM_OTP.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.CONFIRM_OTP.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map createProfile(String token, Map requestMap) {
        init();
        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.CREATE_PROFILE.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.CREATE_PROFILE.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map signIn(String username, String password) {
        init();
        Map<String, String> headerMap = new HashMap<>();

        Map<String, String> requestMap = new HashMap<>();
        String encryptedPassword = CommonUtil.toSHA1(password.getBytes());
        requestMap.put("username", username);
        requestMap.put("password", encryptedPassword);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.SIGN_IN.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.SIGN_IN.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map signOut(String token) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.SIGN_OUT.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.SIGN_OUT.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    public Map getUserProfiles(String token, String deviceOS, String appVersion) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_USER_PROFILE.getId()).getMethod());
        String endpoint = String.format(apiConfigurations.get(ApiIDs.GET_USER_PROFILE.getId()).getUrl(), deviceOS, appVersion);
        return callApi(endpoint, method, headerMap, null);
    }

    public Map getUserBalance(String token, String deviceOS, String appVersion) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_USER_BALANCE.getId()).getMethod());
        String endpoint = String.format(apiConfigurations.get(ApiIDs.GET_USER_BALANCE.getId()).getUrl(), deviceOS, appVersion);
        return callApi(endpoint, method, headerMap, null);
    }

    public Map toup(String mobileNo, String amount) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        Map<String, String> requestMap = new HashMap<>();
        requestMap.put("mobile_number", mobileNo);
        requestMap.put("amount", amount);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.TOPUP_MONEY_TO_WALLET.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.TOPUP_MONEY_TO_WALLET.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map draftTransaction(String token, String mobileNo, String amount) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);
        Map<String, String> requestMap = new HashMap<>();
        requestMap.put("mobileNumber", mobileNo);
        requestMap.put("amount", amount);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.DRAFT_TRANS.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.DRAFT_TRANS.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map sendOtpTransfer(String token, String draftTransId, String personalMessage) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);
        headerMap.put("draft-transaction-id", draftTransId);
        Map<String, String> requestMap = new HashMap<>();
        requestMap.put("personalMessage", personalMessage);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.OTP_TRANSFER.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.OTP_TRANSFER.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map confirmOtpTransfer(String token, String draftTransId, String mobileNo, String otpRefCode, String otpString) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);
        headerMap.put("draft-transaction-id", draftTransId);
        Map<String, String> requestMap = new HashMap<>();
        requestMap.put("mobile_number", mobileNo);
        requestMap.put("otp_ref_code", otpRefCode);
        requestMap.put("otp_string", otpString);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.CONFIRM_OTP_TRANSFER.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.CONFIRM_OTP_TRANSFER.getId()).getUrl();
        return callApi(endpoint, method, headerMap, requestMap);
    }

    public Map getTransferStatus(String token, String draftTransId) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);
        headerMap.put("draft-transaction-id", draftTransId);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_TRANSFER_STATUS.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.GET_TRANSFER_STATUS.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    public Map getTransferDetails(String token, String draftTransId) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);
        headerMap.put("draft-transaction-id", draftTransId);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_TRANSFER_DETAILS.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.GET_TRANSFER_DETAILS.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    public Map payAtRetail(String token) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.PAY_BARCODE_AT_RETAIL.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.PAY_BARCODE_AT_RETAIL.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    public Map listAllTransactions(String token) {
        init();

        Map<String, String> headerMap = new HashMap<>();
        headerMap.put("token", token);

        HttpMethod method = HttpMethod.resolve(apiConfigurations.get(ApiIDs.GET_ALL_PAYMENT_HISTORY.getId()).getMethod());
        String endpoint = apiConfigurations.get(ApiIDs.GET_ALL_PAYMENT_HISTORY.getId()).getUrl();
        return callApi(endpoint, method, headerMap, null);
    }

    private Map callApi(String endpoint, HttpMethod method, Map<String, String> headerMap, Map<String, String> requestMap) {

        HttpHeaders httpHeaders = new HttpHeaders();
        if (headerMap != null) {
            for (Entry<String, String> headerEntry : headerMap.entrySet()) {
                httpHeaders.set(headerEntry.getKey(), headerEntry.getValue().toString());
            }
        }
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        String requestBody = CommonUtil.mapToJsonString(requestMap);
        HttpEntity<?> requestEntity = new HttpEntity<>(requestBody, httpHeaders);
        log.info("Sending data to tmn wallet portal with endpoint {}", endpoint);
        log.info("Sending data to tmn wallet portal with request {}, method {}", requestEntity, method);
        ResponseEntity<String> responseEntity = restTemplate().exchange(endpoint,
                method, requestEntity, new ParameterizedTypeReference<String>() {
                });
        log.info("response data: {}", responseEntity.getBody());
        String result = responseEntity.getBody();
        log.info("result: {}", result);
        JsonObject jsonResult = CommonUtil.jsonFromString(String.valueOf(result.toString()));
        log.info("jsonResult: {}", jsonResult);
        String data = String.valueOf(jsonResult.get("data"));
        log.info("data: {}", data);
        JsonObject dataJson = CommonUtil.jsonFromString(data);
        log.info("dataJson: {}", dataJson);
        Set<String> iterator = dataJson.keySet();
        log.info("iterator: {}", iterator);
        Map<String, String> response = new HashMap<>();
        for (String key: iterator) {
            response.put(key, dataJson.get(key).toString().replaceAll("\"",""));
            log.info("key {} value {}", key, dataJson.get(key));
        }
        log.info("Received data from tmn wallet portal with response {}", responseEntity.getBody());
        return response;
    }
}
package com.webtrucking.client;

import com.webtrucking.client.config.TmnWalletConfiguration;
import com.webtrucking.client.domain.base.TmnPortalResponse;
import com.webtrucking.dto.GeneralResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 * Created by ngocthanh on 8/12/17.
 */
@Component
public class TmnWalletClient {
    private Logger log = Logger.getLogger(TmnWalletClient.class);

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private TmnWalletConfiguration configuration;

    public GeneralResponse<TmnPortalResponse> getRegisterOtp(Integer agentId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);

//        httpHeaders.set(HttpHeaderConstant.CORRELATION_ID_HEADER, ThreadContext.get(LoggerConstant.CORRELATION_ID_LOG_KEY_NAME));
//        httpHeaders.set(HttpHeaderConstant.X_IP_ADDRESS_HEADER, ThreadContext.get(LoggerConstant.IP_ADDRESS_LOG_KEY_NAME));
//        httpHeaders.set(PayloadConstant.USER_ID_KEY, agentId.toString());

        String endpoint = configuration.getGetOtpHost();
        HttpEntity<?> requestEntity = new HttpEntity<>(httpHeaders);

        log.info("Sending data to tmn wallet portal with endpoint {}", endpoint);
        log.info("Sending data to tmn wallet portal with request {}", requestEntity);
        ResponseEntity<GeneralResponse<TmnPortalResponse>> responseEntity = restTemplate.exchange(endpoint,
                HttpMethod.GET, requestEntity, new ParameterizedTypeReference<GeneralResponse<TmnPortalResponse>>() {
                });
        log.info("Received data from tmn wallet portal with response {}", responseEntity.getBody());
        return responseEntity.getBody();
    }

}

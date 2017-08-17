package com.webtrucking.controller.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

public class WalletTokenDTO {

    @JsonProperty("token")
    private String token;
//    @JsonProperty("otp_result")
//    private String otpResult;

    public WalletTokenDTO(){

    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

}

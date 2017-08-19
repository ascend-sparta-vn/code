package com.webtrucking.controller.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

public class WalletOtpDTO {

    @JsonProperty("mobile_number")
    private String mobileNumber;
    @JsonProperty("otp_reference")
    private String otpReference;
    @JsonProperty("otp_code")
    private String otpCode;

    public WalletOtpDTO(){
    }

    public WalletOtpDTO(String number, String otpReference, String otpCode) {
        this.mobileNumber = number;
        this.otpReference = otpReference;
        this.otpCode = otpCode;
    }

    public String getOtpCode() {
        return otpCode;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getOtpReference() {
        return otpReference;
    }

    public void setOtpReference(String otpReference) {
        this.otpReference = otpReference;
    }
}

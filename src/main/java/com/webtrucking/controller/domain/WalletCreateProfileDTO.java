package com.webtrucking.controller.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Map;

public class WalletCreateProfileDTO {

    @JsonProperty("mobile_number")
    private String mobileNumber;

    @JsonProperty("email")
    private String email;

    @JsonProperty("thai_id")
    private String thaiId;

    @JsonProperty("password")
    private String password;

    @JsonProperty("first_name")
    private String firstName;

    @JsonProperty("last_name")
    private String lastName;

    @JsonProperty("address")
    private String address;

    @JsonProperty("postal_code")
    private String postalCode;

    @JsonProperty("occupation")
    private String occupation;

    @JsonProperty("channel_id")
    private String channelId;

    @JsonProperty("error_message")
    private String errorMessage;

    public WalletCreateProfileDTO(){
    }

    public WalletCreateProfileDTO(String mobileNumber, String email, String thaiId, String password, String firstName, String lastName, String address, String postalCode, String occupation, String channelId) {
        this.mobileNumber = mobileNumber;
        this.email = email;
        this.thaiId = thaiId;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.postalCode = postalCode;
        this.occupation = occupation;
        this.channelId = channelId;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setThaiId(String thaiId) {
        this.thaiId = thaiId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public void setChannelId(String channelId) {
        this.channelId = channelId;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getThaiId() {
        return thaiId;
    }

    public String getPassword() {
        return password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getAddress() {
        return address;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public String getOccupation() {
        return occupation;
    }

    public String getChannelId() {
        return channelId;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    @Override
    public String toString() {
        return "WalletCreateProfileDTO{" +
                "mobileNumber='" + mobileNumber + '\'' +
                ", email='" + email + '\'' +
                ", thaiId='" + thaiId + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", address='" + address + '\'' +
                ", postalCode='" + postalCode + '\'' +
                ", occupation='" + occupation + '\'' +
                ", channelId='" + channelId + '\'' +
                '}';
    }
}

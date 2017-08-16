package com.webtrucking.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class GeneralResponse<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    @JsonProperty("status_code")
    private String statusCode;

    @JsonProperty("status_message")
    private String statusMessage;

    @JsonProperty("data")
    private T data;

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getStatusMessage() {
        return statusMessage;
    }

    public void setStatusMessage(String statusMessage) {
        this.statusMessage = statusMessage;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "GeneralResponse{" +
                "statusCode=" + statusCode +
                "statusMessage=" + statusMessage +
                ", data=" + data +
                '}';
    }
}

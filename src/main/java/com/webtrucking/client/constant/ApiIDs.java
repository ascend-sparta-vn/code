package com.webtrucking.client.constant;

import org.apache.commons.lang.StringUtils;

public enum ApiIDs {
    GET_OTP(1), CONFIRM_OTP(2), CREATE_PROFILE(3), SIGN_IN(4), SIGN_OUT(5), GET_USER_PROFILE(6),
    GET_USER_BALANCE(7), TOPUP_MONEY_TO_WALLET(8), DRAFT_TRANS(9), OTP_TRANSFER(10), CONFIRM_OTP_TRANSFER(11),
    GET_TRANSFER_STATUS(12), GET_TRANSFER_DETAILS(13), PAY_BARCODE_AT_RETAIL(14), GET_ALL_PAYMENT_HISTORY(15);

    private int id;

    private ApiIDs(int id) {
        this.id = id;
    }

    public String getName() {
        return name().toLowerCase();
    }

    public int getId() {
        return this.id;
    }

    @Override
    public String toString() {
        return new StringBuilder("ApiIds{")
                .append("id=").append(id)
                .append(", name='").append(getName()).append("'")
                .append("}").toString();
    }

    public boolean equals(String name) {
        if (StringUtils.isBlank(name)) {
            name = StringUtils.EMPTY;
        }

        return this.getName().equals(name);
    }

    public boolean equals(Integer id) {
        return this.id == id;
    }

    public boolean equals(int id) {
        return this.id == id;
    }
}

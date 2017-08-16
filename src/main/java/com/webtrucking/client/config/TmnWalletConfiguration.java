package com.webtrucking.client.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * Created by ngocthanh on 8/12/17.
 */
@Configuration
public class TmnWalletConfiguration {
    // Group 1. Create wallet
    // Get OTP host
    @Value("get.otp.host")
    public String getOtpHost;

    // Confirm OTP host
    @Value("confirm.otp.host")
    public String confirmOtpHost;

    // Create wallet host
    @Value("create.wallet.host")
    public String createWalletHost;

    // Group 2. Access Account
    // Sign-in wallet account host
    @Value("sign.in.wallet.host")
    public String signInHost;

    // Sign-out wallet account host
    @Value("sign.out.wallet.host")
    public String signOutHost;

    // Group 3. Access user profiles
    // Get user profiles host
    @Value("get.user.profiles.host")
    public String getUserProfilesHost;

    // Get user balance host
    @Value("get.user.balance.host")
    public String getUserBalanceHost;

    // Group 4. Processing money
    // Topup host
    @Value("topup.host")
    public String topupHost;

    // Transfer money host
    @Value("transfer.money.host")
    public String transferMoneyHost;

    // Draft transaction transfer host
    @Value("draft.transaction.transfer.host")
    public String draftTransactionTransferHost;

    // Send OTP transfer host
    @Value("otp.transfer.host")
    public String otpTransferHost;

    // Confirm OTP transfer host
    @Value("confirm.otp.transfer.host")
    public String confirmOtpTransferHost;

    // Get status of transger host
    @Value("transfer.status.host")
    public String transferStatusHost;

    // Get details of transfer host
    @Value("transfer.details.host")
    public String transferDetaislHost;

    // Group 5. Pay barcode at retail shop
    // Pay barcode host
    @Value("barcode.pay.transaction.host")
    public String barcodePayHost;

    // Get history of transactions
    @Value("transaction.history.host")
    public String transactionHistoryHost;

    public String getGetOtpHost() {
        return getOtpHost;
    }

    public void setGetOtpHost(String getOtpHost) {
        this.getOtpHost = getOtpHost;
    }

    public String getConfirmOtpHost() {
        return confirmOtpHost;
    }

    public void setConfirmOtpHost(String confirmOtpHost) {
        this.confirmOtpHost = confirmOtpHost;
    }

    public String getCreateWalletHost() {
        return createWalletHost;
    }

    public void setCreateWalletHost(String createWalletHost) {
        this.createWalletHost = createWalletHost;
    }

    public String getSignInHost() {
        return signInHost;
    }

    public void setSignInHost(String signInHost) {
        this.signInHost = signInHost;
    }

    public String getSignOutHost() {
        return signOutHost;
    }

    public void setSignOutHost(String signOutHost) {
        this.signOutHost = signOutHost;
    }

    public String getGetUserProfilesHost() {
        return getUserProfilesHost;
    }

    public void setGetUserProfilesHost(String getUserProfilesHost) {
        this.getUserProfilesHost = getUserProfilesHost;
    }

    public String getGetUserBalanceHost() {
        return getUserBalanceHost;
    }

    public void setGetUserBalanceHost(String getUserBalanceHost) {
        this.getUserBalanceHost = getUserBalanceHost;
    }

    public String getTopupHost() {
        return topupHost;
    }

    public void setTopupHost(String topupHost) {
        this.topupHost = topupHost;
    }

    public String getTransferMoneyHost() {
        return transferMoneyHost;
    }

    public void setTransferMoneyHost(String transferMoneyHost) {
        this.transferMoneyHost = transferMoneyHost;
    }

    public String getDraftTransactionTransferHost() {
        return draftTransactionTransferHost;
    }

    public void setDraftTransactionTransferHost(String draftTransactionTransferHost) {
        this.draftTransactionTransferHost = draftTransactionTransferHost;
    }

    public String getOtpTransferHost() {
        return otpTransferHost;
    }

    public void setOtpTransferHost(String otpTransferHost) {
        this.otpTransferHost = otpTransferHost;
    }

    public String getConfirmOtpTransferHost() {
        return confirmOtpTransferHost;
    }

    public void setConfirmOtpTransferHost(String confirmOtpTransferHost) {
        this.confirmOtpTransferHost = confirmOtpTransferHost;
    }

    public String getTransferStatusHost() {
        return transferStatusHost;
    }

    public void setTransferStatusHost(String transferStatusHost) {
        this.transferStatusHost = transferStatusHost;
    }

    public String getTransferDetaislHost() {
        return transferDetaislHost;
    }

    public void setTransferDetaislHost(String transferDetaislHost) {
        this.transferDetaislHost = transferDetaislHost;
    }

    public String getBarcodePayHost() {
        return barcodePayHost;
    }

    public void setBarcodePayHost(String barcodePayHost) {
        this.barcodePayHost = barcodePayHost;
    }

    public String getTransactionHistoryHost() {
        return transactionHistoryHost;
    }

    public void setTransactionHistoryHost(String transactionHistoryHost) {
        this.transactionHistoryHost = transactionHistoryHost;
    }
}

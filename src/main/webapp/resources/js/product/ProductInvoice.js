function ProductInvoice(){
    this.listProduct = [];
}

ProductInvoice.prototype.init = function () {
    var self = this;
    
    $('#btn-confifm').click(()=>{
        function handleConfirm(resp){
            if (resp.transfer_status == "CONFIRMED") {
                showMessage("Successful", "success");
            } else {
                showMessage("Payment fail", "error");
            }
        }
        self.confirmOTPTransaction(self.confirmRequest, handleConfirm);
    });
}

ProductInvoice.prototype.getTransactionOtp = function (access_token) {
    const ONMART_WALLET_NUMBER = "0983561001";
    var self = this;
    
    function createDraftTransaction(request, hookdata){
        $.ajax({
			type : "POST",
			contentType : "application/json",
			url : '/wallet/draft_transaction',
			data : JSON.stringify(request),
			dataType : 'json',
			success : function(data) {
                console.log("createDraftTransaction resp", data);
                                
                var req = {
                    personal_message: "Customer#2 process payment",
                    draft_transaction_id : data.draft_transaction_id,
                    token: hookdata.token
                };
                
                var hook = hookdata;
                hook.transaction_id = data.draft_transaction_id;
                
                sendOTPForTransaction(req, hook);
			},
			error : function(e) {
                console.log(e);
			}
		});
    };
    
    function sendOTPForTransaction(request, hookdata){
        $.ajax({
			type : "POST",
			contentType : "application/json",
			url : '/wallet/get_otp_transfer',
			data : JSON.stringify(request),
			dataType : 'json',
			success : function(data) {
                console.log("sendOTPForTransaction resp", data);
                $('.wl_otp').val(data.otp_ref_code);

                var req = {
                    token: hookdata.token,
                    transaction_id: data.draft_transaction_id,
                    mobile_number: data.mobile_number,
                    otp_ref_code: data.otp_ref_code,
                    otp_string: "123456" // HARD CODE
                };
                
                self.confirmRequest = {
                    token: hookdata.token,
                    transaction_id: data.draft_transaction_id,
                    mobile_number: data.mobile_number,
                    otp_ref_code: data.otp_ref_code,
                    otp_string: "123456" // HARD CODE
                }
                
                console.log(self.confirmRequest);
			},
			error : function(e) {
                console.log(e);
			}
		});
    };
    
    var req = {
        amount: amount,
        mobile_number : ONMART_WALLET_NUMBER,
        token: access_token
    };
    createDraftTransaction(req, {
        mobile_number : ONMART_WALLET_NUMBER,
        token: access_token},
        sendOTPForTransaction
    );
}

ProductInvoice.prototype.confirmOTPTransaction = function(request, handleConfirm){
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : '/wallet/confirm_otp_transfer',
        data : JSON.stringify(request),
        dataType : 'json',
        success : function(data) {
            handleConfirm(data);
        },
        error : function(e) {
            console.log(e);
        }
    });
};

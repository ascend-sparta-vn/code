/**
 * 
 */

const VND = '&#x20ab;';

function ProductList(){
    this.listProduct = [];
}

ProductList.prototype.init = function () {
    var self = this;
    
//    $('#next').click(() => {
//       // this.processPayment(); 
//        console.log("process payment");
//    });
    
    this.processPayment();
}

ProductList.prototype.processPayment = function () {
    console.log("Process payment");
    const ONMART_WALLET_NUMBER = "0855555555";
    
    function loginWallet(request, createDraftTransaction){
        $.ajax({
			type : "POST",
			contentType : "application/json",
			url : '/wallet/sign_in',
			data : JSON.stringify(request),
			dataType : 'json',
			success : function(data) {
                console.log("Loginwallet resp", data);
                
                var req = {
                    amount: $('.total_cost').html(),
                    mobile_number : ONMART_WALLET_NUMBER,
                    token: data.access_token
                };
                var hookdata = {
                    access_token: data.access_token,
                    mobile_number: request.username
                }
                
                createDraftTransaction(req, hookdata, sendOTPForTransaction);
			},
			error : function(e) {
                console.log(e);
			}
		});
    };
    
    function createDraftTransaction(request, hookdata, sendOTPForTransaction){
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
                    token: hookdata.access_token
                };
                
                var hook = hookdata;
                hook.transaction_id = data.draft_transaction_id;
                
                sendOTPForTransaction(req, hook, confirmOTPTransaction);
			},
			error : function(e) {
                console.log(e);
			}
		});
    };
    
    function sendOTPForTransaction(request, hookdata, confirmOTPTransaction){
        $.ajax({
			type : "POST",
			contentType : "application/json",
			url : '/wallet/get_otp_transfer',
			data : JSON.stringify(request),
			dataType : 'json',
			success : function(data) {
                console.log("sendOTPForTransaction resp", data);
                
                var req = {
                    token: hookdata.access_token,
                    transaction_id: data.draft_transaction_id,
                    mobile_number: data.mobile_number,
                    otp_ref_code: data.otp_ref_code,
                    otp_string: "123456" // HARD CODE
                };
                confirmOTPTransaction(req, hookdata, handleResult);
			},
			error : function(e) {
                console.log(e);
			}
		});
    };
    
    function confirmOTPTransaction(request, hookdata, handleResult){
        $.ajax({
			type : "POST",
			contentType : "application/json",
			url : '/wallet/confirm_otp_transfer',
			data : JSON.stringify(request),
			dataType : 'json',
			success : function(data) {
                console.log("confirmOTPTransaction resp", data);
                handleResult(data);
			},
			error : function(e) {
                console.log(e);
			}
		});
    };
    
    function handleResult(data){
        console.log(data);
    }
    
    // Step 1: login api
    // Step 2: Draft transaction
    // Step 3: Send OTP for transfer api
    // Step 4: confirm OTP transaction

    var walletAuthenInfo = {
        username: $('.wl_mobilenumber').val(),
        password: $('.wl_password').val()
    }
    loginWallet(walletAuthenInfo, createDraftTransaction);    
}

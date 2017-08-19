const VND = '&#x20ab;';
const WALLET_CREATE_MODE_START = 0;
const WALLET_CREATE_MODE_WAIT_OTP = 1;
const WALLET_CREATE_MODE_WAIT_PROFILE = 2;

function ProductList(){
    this.listProduct = [];
}

ProductList.prototype.init = function () {
    var self = this;
    
    // this.processPayment();
    this.createMode = WALLET_CREATE_MODE_START;
}

ProductList.prototype.createWalletProfile = function(){    
    function toggleInputs(disable) {
        if (disable) {
            $('.wl_firstname').attr('disabled','disabled');
            $('.wl_lastname').attr('disabled','disabled');
            $('.wl_email').attr('disabled','disabled');
            $('.wl_mobile').attr('disabled','disabled');
            $('.wl_occupation').attr('disabled','disabled');
            $('.wl_postalcode').attr('disabled','disabled');
            $('.wl_password').attr('disabled','disabled');
            $('.wl_citizenid').attr('disabled','disabled');
            $('.wl_address').attr('disabled','disabled');
        } else {
            $('.wl_firstname').removeAttr('disabled');
            $('.wl_lastname').removeAttr('disabled');
            $('.wl_email').removeAttr('disabled');
            $('.wl_mobile').removeAttr('disabled');
            $('.wl_occupation').removeAttr('disabled');
            $('.wl_postalcode').removeAttr('disabled');
            $('.wl_password').removeAttr('disabled');
            $('.wl_citizenid').removeAttr('disabled');
            $('.wl_address').removeAttr('disabled');
        }
    }
    
    function confirmOtp(obj, successFunc){
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: '/wallet/confirm_otp',
            dataType: 'text',
            data: JSON.stringify(obj),
            success: (response) => {
                console.log(response);
                successFunc(response);
            },
            error: (error) => {
                console.log(error);
            },
            done: () => {
                console.log("Done");
            }
        });
    }
    
    toggleInputs(false);
    
    if (this.createMode == WALLET_CREATE_MODE_START) {
        const mobile_number = $('.wl_mobile').val();
        const URL = `/wallet/get_otp/${mobile_number}`;
        
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: URL,
            dataType: 'text',
            success: (response) => {
                var resp = JSON.parse(response);
                
                this.otp_reference = resp.otp_reference;
                this.mobile_number = resp.mobile_number;
                this.otp_code = "123456";
                
                $('.wl_otp').val(resp.otp_reference);
            },
            error: (error) => {
                console.log(error);
            },
            done: () => {
                console.log("Done");
            }
        });
        
        $('.btn-create-wallet').html('Confirm OTP');
        toggleInputs(true);
        this.createMode = WALLET_CREATE_MODE_WAIT_OTP;
    } else if (this.createMode == WALLET_CREATE_MODE_WAIT_OTP) {
        const URL = '/wallet/create_wallet';

        var request = {
            first_name: $('.wl_firstname').val(),
            last_name: $('.wl_lastname').val(),
            email: $('.wl_email').val(),
            mobile_number: $('.wl_mobile').val(),
            occupation: $('.wl_occupation').val(),
            postal_code: $('.wl_postalcode').val(),
            password: $('.wl_password').val(),
            thai_id: $('.wl_citizenid').val(),
            address: $('.wl_address').val(),
            otp: $('.wl_otp').val()
        };
        
        confirmOtp({
            mobile_number: this.mobile_number,
            otp_reference: this.otp_reference
        }, (response) => {
            var token = JSON.parse(response);
            
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: URL,
                headers: token,
                dataType: 'json',
                data : JSON.stringify(request),
                success: (resp) => {
                    $('.btn-close').trigger('click');
                    $('.modal-backdrop').hide();
                    
                    showMessage('You have successfully created new wallet', "success");
                    this.createMode = WALLET_CREATE_MODE_START;
                },
                error: () => {
                    toggleInputs(false);
                    this.createMode = WALLET_CREATE_MODE_START;
                },
                done: () => {
                    toggleInputs(false);
                    this.createMode = WALLET_CREATE_MODE_START;
                }
            });
        });
    }
}

ProductList.prototype.logInAscendWallet = function(){
    var walletAuthenInfo = {
        username: $('.wl_mobilenumber').val(),
        password: $('.wl_password').val()
    }
    
    $.ajax({
        type : "POST",
        contentType : "application/json",
        url : '/wallet/sign_in',
        data : JSON.stringify(walletAuthenInfo),
        dataType : 'json',
        success : function(data) {
            console.log("Loginwallet resp", data);

//            var req = {
//                amount: $('.total_cost').html(),
//                mobile_number : ONMART_WALLET_NUMBER,
//                token: data.access_token
//            };
//            var hookdata = {
//                access_token: data.access_token,
//                mobile_number: request.username
//            }
//
//            createDraftTransaction(req, hookdata, sendOTPForTransaction);
            showMessage(data.access_token, "success");
        },
        error : function(e) {
            showMessage("Can't login your Ascend wallet", "error");
        }
    });
}

ProductList.prototype.verifyWallet = function(me) {
    me.logInAscendWallet();
}

ProductList.prototype.processPayment = function () {
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

const WALLET_CREATE_MODE_START = 0;
const WALLET_CREATE_MODE_WAIT_OTP = 1;
const WALLET_CREATE_MODE_WAIT_PROFILE = 2;

function AccountManager() {
	this.walletList = [
        { thai_id: "3231744035655", first_name: "Ascend", last_name: "Hackathon", postal_code: "10400", mobile_number: "0050000001", device_os: "android", password: "Welcome1234", email: "ascender@gmail.com", address: "89 AIA Dindang, Bangkok", occupation: "developer"},
        { thai_id: "3231744035657", first_name: "Tulu", last_name: "Tran", postal_code: "10400", mobile_number: "0050000001", device_os: "android", password: "Welcome1234", email: "ascender@gmail.com", "address": "89 AIA Dindang, Bangkok", occupation: "developer"}
    ];

}

AccountManager.prototype.init = function(){
	var self = this;
	self.initButtonClick();
	self.initViewMode();

    self.displayPaymentMethod();
    self.displayWallets();
    
    this.createMode = WALLET_CREATE_MODE_START;
}

/*
 * disable all input field and save button when in view mode
 */
AccountManager.prototype.initViewMode = function(){
	var viewMode = $("#viewMode").val();
	if(viewMode == "true") {
		$('input').prop("disabled", true);
		$('select').prop('disabled', true);
		$('textarea').prop('disabled', true);
		$('.form-group button').hide();
	}
};

AccountManager.prototype.displayWallets = function(){
    var walletListZone = $('#wallet_list');
    
    var left = '', right = '';
    walletListZone.empty();
    
    for (index in this.walletList){
        var wallet = this.walletList[index];
        
        var walletDom = `<div class="col-sm-6 sm-margin-bottom-10">
                        <div class="profile-blog">
                            <img class="rounded-x" src="/resources/img/icons/ascend.png" alt="">
                            <div class="name-location">
                                <a href="#"><strong>${wallet.first_name + ' ' + wallet.last_name}</strong></a>
                                <span><i class="fa fa-map-marker"></i>${wallet.address}</span>
                            </div>
                            <div class="clearfix"></div>
                            
                            <ul class="list-inline share-list">
                                <li><i class="fa fa-phone"></i><span>${wallet.mobile_number}</span></li>
                                <li><i class="fa fa-envelope"></i><span>${wallet.email}</span></li>
                            </ul>
                        </div>
                    </div>`;
        if (index % 2 == 1) {
            right = walletDom;
            var row = `<div class="row margin-bottom-20">${left}${right}</div><hr>`
            walletListZone.append(row);
            
            left = '';
            right = '';
        } else {
            left = walletDom;
        }
    }
    
    if (left.length) {
        var row = `<div class="row margin-bottom-20">${left}</div><hr>`
        walletListZone.append(row);
        
        left = '';
    }
}

AccountManager.prototype.initButtonClick = function(){
	var self = this;
	$("#profile-menu-1").addClass("active");
	$("#btn-register").click(function() {
		var error = self.validate();
		if(error != "") {
			showMessage(error, "error");
			return;
		}
		
		//validate account
		showProgressAnimation();
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : '/member_rest/check-account-exist?userName=' + $("#email").val(),
			success : function(data) {
				if(data > 0) {
					$("html, body").animate({ scrollTop: 0 }, "fast");
					showMessage($("#account-exists").val(), "error");
				} else {
					$("#register-form").submit();
				}
			},
			error : function(e) {
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		hideProgressAnimation();
	});
	
	$("#btn-update-account").click(function() {
		var error = self.validate(true);
		if(error != "") {
			showMessage(error, "error");
			return;
		}
		
		//push data
		var data = self.getFormData();
		var url = '/account/update-account';
		showProgressAnimation();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : url,
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(data) {
				if( data.code == RESPONSE.CODE.SUCCESS ) {
    				showMessage(data.msg, "success");
    				self.initDataTable();
    			} else {
    				showMessage(data.msg, "error");
    			}
			},
			error : function(e) {
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		hideProgressAnimation();
	});
	
	$("#btn-reenter").click(function() {
		$("html, body").animate({ scrollTop: 0 }, "fast");
		self.refreshForm();
	});
	
	$("#btn-comeback").click(function() {
		window.history.back();
	});

    $('.payment_method').change(() => {
        this.displayPaymentMethod();
    });
}

AccountManager.prototype.displayPaymentMethod = function(){
    if ($('.ascend_wallet').is(':checked'))
        $('#payment_by_visa_master').hide();
    else
        $('#payment_by_visa_master').show();
    
    if ($('.visa_card').is(':checked') || $('.master_card').is(':checked'))
        $('#payment_by_ascend_wallet').hide();
    else
        $('#payment_by_ascend_wallet').show();    
}

AccountManager.prototype.refreshForm = function(){
	$("input").val('');
}

AccountManager.prototype.initWalletCreateZone = function(){
    
}

AccountManager.prototype.createWalletProfile = function(){    
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
                //console.log(response);
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
                    this.walletList.push(resp);
                    
                    toggleInputs(false);
                    this.displayWallets();
                    
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

AccountManager.prototype.validate = function(updateFlag){
	var self = this;
	var error = "";
	var email = $("#email").val();
	var password = $("#password").val();
	var repassword = $("#repassword").val();
	var name = $("#last-name").val();
	var mobileNumber = $("#mobile-number").val();
	var address = $("#address").val();
	if(!self.validateEmail(email)){
		error = $("#message-email").val();
		return error;
	}
	
	if(updateFlag) {
	} else {
		if(password.trim() == '') {
			error = $("#message-password").val();
			return error;
		}
		
		if(repassword.trim() == '') {
			error = $("#message-repassword").val();
			return error;
		}
		
		if(repassword != password) {
			error = $("#message-correctpassword").val();
			return error;
		}
		
		if(!$("#check-agree").is(':checked')) {
			error = $("#account-agree").val();
			return error;
		}
		
		if ($("#defaultReal").val() == ""){
			error = $("#message-capcha").val();
			return error;
		}
	}
	
	
	if(name.trim() == '') {
		error = $("#message-name").val();
		return error;
	}
	
	if(!self.validateMobileNumber(mobileNumber)) {
		error = $("#message-tel").val();
		return error;
	}
	
	if(address.trim() == '') {
		error = $("#message-address").val();
		return error;
	}
	
	return "";
	
}

AccountManager.prototype.validateEmail = function(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

AccountManager.prototype.validateMobileNumber = function(val) {
	//return /^\d{10}$/.test(val);
	if (val == '' || val.trim() == '') {
		return false;
	}
	return true;
}

AccountManager.prototype.getFormData = function(val) {
	var self = this;
	var obj = {};
	obj.password = $("#password").val();
	obj.memberSex = $("#memberSex").val();
	obj.firstname=$("#firstname").val();
	obj.lastName = $("#last-name").val(); 
	obj.mobileNumber = $("#mobile-number").val();
	obj.address = $("#address").val();
	obj.province = $("#province").val();
	obj.goodType = $("#goodType").val();
	obj.weighPerMonth = $("#weighPerMonth").val();
	obj.description = $("#description").val();
	obj.companyName = $("#company-name").val();
	obj.companyAddress = $("#company-address").val();
	obj.startYear = $("#start-year").val();
	obj.totalEmployee = $("#total-employee").val();
	obj.companyIso = $("#company-iso").val();
	obj.companyRole = $("#company-role").val();
	obj.directorName = $("#director-name").val();
	obj.taxCode = $("#tax-code").val();
	obj.companyPhoneNumber = $("#company-phone-number").val();
	obj.companyFax = $("#company-fax").val();
	obj.paperNumber = $("#paper-number").val();
	obj.accountBankName = $("#account-bank-name").val();
	obj.accountBankNumber = $("#account-bank-number").val();
	obj.bankingName = $("#banking-name").val();
	obj.memberType = $("#password").val();
	
	return obj;
}




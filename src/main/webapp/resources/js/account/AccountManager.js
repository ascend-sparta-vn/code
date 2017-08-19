const WALLET_CREATE_MODE_START = 0;
const WALLET_CREATE_MODE_WAIT_OTP = 1;
const WALLET_CREATE_MODE_WAIT_PROFILE = 2;

function AccountManager() {
	this.walletList = [
    ];
}

AccountManager.prototype.init = function(){
	var self = this;
	self.initButtonClick();
	self.initViewMode();

    self.displayPaymentMethod();
    self.displayWallets();
    
    this.createMode = WALLET_CREATE_MODE_START;
    
    this.initTempInputs();
}

AccountManager.prototype.initWallet = function(mobileNumber, email, thaiId, firstName, lastName, password, address, postalCode, occupation){
    this.walletList.push({
        mobile_number: mobileNumber,
        email: email,
        thai_id: thaiId,
        first_name: firstName,
        last_name: lastName,
        password: password,
        address: address,
        postal_code: postalCode,
        occupation: occupation
    });
}

AccountManager.prototype.initTempInputs = function(){
    $('.wl_firstname').val('');
    $('.wl_lastname').val('');
    $('.wl_email').val('ascendian??@ascend.com');
    $('.wl_mobile').val('');
    $('.wl_occupation').val('IT dev');
    $('.wl_postalcode').val('10000');
    $('.wl_password').val('Welcome1234');
    $('.wl_citizenid').val('3231744035655');
    $('.wl_address').val('165 Thai Ha street, Hanoi');
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
    
    function handleErrors(message){
        $('.btn-close').trigger('click');
        $('.modal-backdrop').hide();

        toggleInputs(false);
        this.createMode = WALLET_CREATE_MODE_START;
        showMessage(message, "error");
    }

    
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
                this.otp_code = '123456';
                
                $('.wl_otp').val(resp.otp_reference);
            },
            error: (error) => {
                handleErrors("Can't create OTP for this number " + mobile_number);
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
            otp_reference: this.otp_reference,
            otp_code: this.otp_code
        }, (response) => {
            var token = JSON.parse(response);
            
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: URL,
                headers: {token: token.token},
                dataType: 'json',
                data : JSON.stringify(request),
                success: (resp) => {
                    var wallet = {
                        thai_id: resp.thai_id,
                        first_name: resp.first_name,
                        last_name: resp.last_name,
                        postal_code: resp.postal_code,
                        mobile_number: resp.mobile_number,
                        password: resp.password,
                        email: resp.email,
                        address: resp.address,
                        occupation: resp.occupation
                    };
                    
                    this.walletList.push(wallet);
                    
                    toggleInputs(false);
                    this.displayWallets();
                    
                    $('.btn-close').trigger('click');
                    $('.modal-backdrop').hide();
                    
                    showMessage('You have successfully created new wallet', "success");
                    this.createMode = WALLET_CREATE_MODE_START;
                },
                error: () => {
                    handleErrors("Register wallet error");
                }
            });
        });
    }
}
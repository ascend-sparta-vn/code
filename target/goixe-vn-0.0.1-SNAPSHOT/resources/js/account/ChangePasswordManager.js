function ChangePasswordManager() {
	
}
ChangePasswordManager.prototype.init = function(){
	var self = this;
	self.initButtonClick();
}

ChangePasswordManager.prototype.initButtonClick = function(){
	var self = this;
	
	$("#btn-update-pass").click(function() {
		var error = self.validate();
		if(error != "") {
			showMessage(error, "error");
			return;
		}
		
		//push data
		var data = self.getFormData();
		var url = '/account/change-pass';
		showProgressAnimation();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : url,
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(data) {
				if( data.code == RESPONSE.CODE.SUCCESS) {
					showMessage(data.msg, "success");
					$("input").val("");
				} else {
					showMessage(data.msg, "error");
				}
			},
			error : function(e) {
				showMessage(e, "error");
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		hideProgressAnimation();
	});
	
}

ChangePasswordManager.prototype.validate = function(){
	var self = this;
	var error = "";
	var password = $("#password").val();
	var newPassword = $("#newPassword").val();
	var repassword = $("#repassword").val();
	
	if ((password.length < 6) || (newPassword.length < 6)) {
		return "Mật khẩu phải chứa ít nhất 6 ký tự";
	}
	
	if(newPassword != repassword) {
		return "Mật khẩu mới không trùng khớp";
	}
	
	
	return "";
	
}

ChangePasswordManager.prototype.validateEmail = function(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

ChangePasswordManager.prototype.validateMobileNumber = function(val) {
	return /^\d{10}$/.test(val);
}

ChangePasswordManager.prototype.getFormData = function(val) {
	var self = this;
	var obj = {};
	obj.password = $("#password").val();
	obj.newPassword = $("#newPassword").val();
	return obj;
}



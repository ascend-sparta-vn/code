var ContactForm = function () {

    return {
        
        //Contact Form
        initContactForm: function () {
	        // Validation
	        $("#sky-form3").validate({
	            // Rules for form validation
	            rules:
	            {
	                name:
	                {
	                    required: true
	                },
	                email:
	                {
	                    required: true,
	                    email: true
	                },
	                message:
	                {
	                    required: true,
	                    minlength: 10
	                },
	                captcha:
	                {
	                    required: true,
	                    remote: 'assets/plugins/sky-forms-pro/skyforms/captcha/process.php'
	                }
	            },
	                                
	            // Messages for form validation
	            messages:
	            {
	                name:
	                {
	                    required: jQuery.i18n.prop('contactUs.name.require'),
	                },
	                email:
	                {
	                    required: jQuery.i18n.prop('contactUs.email.require'),
	                    email: jQuery.i18n.prop('contactUs.email.invalid')
	                },
	                message:
	                {
	                    required: jQuery.i18n.prop('contactUs.message.require')
	                },
	                captcha:
	                {
	                    required: 'Please enter characters',
	                    remote: 'Correct captcha is required'
	                }
	            },
	                                
	            // Ajax form submition                  
	            submitHandler: function(form)
	            {
	                $(form).ajaxSubmit(
	                {
	                    beforeSend: function()
	                    {
	                        $('#sky-form3 button[type="submit"]').attr('disabled', true);
	                    },
	                    success: function()
	                    {
	                        $("#sky-form3").addClass('submited');
	                    }
	                });
	            },
	            
	            // Do not change code below
	            errorPlacement: function(error, element)
	            {
	                error.insertAfter(element.parent());
	            }
	        });
        }

    };
    
}();
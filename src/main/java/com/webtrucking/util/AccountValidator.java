package com.webtrucking.util;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.webtrucking.json.entity.AccountInfo;

@Component
public class AccountValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz == AccountInfo.class;
	}

	@Override
	public void validate(Object target, Errors errors) {
		AccountInfo accountInfo = (AccountInfo) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.customerForm.name");
	}
}

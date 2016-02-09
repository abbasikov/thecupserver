package com.macys.utils;

import org.apache.commons.lang3.StringUtils;

import com.macys.exceptions.ErrorCodeEnum;
import com.macys.exceptions.ServiceException;

public class ServiceUtils {

	public static void verifyNotBlank(String value, String fieldName) throws ServiceException {
		
		if(StringUtils.isBlank(value)) {
			throw new ServiceException(fieldName + " must not be blank", ErrorCodeEnum.BLANK_FIELD);
		}
		
	}
	
	public static void verifyUserName(String value) throws ServiceException{
		if(StringUtils.isBlank(value)) {
			throw new ServiceException("Username must not be blank", ErrorCodeEnum.BLANK_FIELD);
		}
		
		if(StringUtils.containsWhitespace(value)){
			throw new ServiceException("Username cannot contains whitespace.", ErrorCodeEnum.INVALID_USERNAME);
		}
	}
	
	

}
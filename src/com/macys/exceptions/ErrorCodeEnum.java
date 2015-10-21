package com.macys.exceptions;


public enum ErrorCodeEnum {
	
	EMAIL_ALREADY_EXISTS		(1000,"EMAIL_ALREADY_EXISTS"),
	BLANK_FIELD					(1001,"BLANK_FIELD"),
	USER_NOT_FOUND				(1002,"USER_NOT_FOUND"),
	INVALID_CREDENTIALS			(1003,"INVALID_CREDENTIALS"),
	INTERNAL_SERVER_ERROR		(1004,"INTERNAL_SERVER_ERROR"),
	INVALID_BUSINESS_OBJECT_TYPE(1005,"INVALID_BUSINESS_OBJECT_TYPE"),
	MISSING_ANNOTATION			(1006,"MISSING_ANNOTATION"),
	INVALID_REQUEST				(1007,"INVALID_REQUEST"),
	LENGTH_NOT_EQUAL			(1008,"LENGTH_NOT_EQUAL"),
	BUSINESS_OBJECT_NOT_FOUND	(1009,"BUSINESS_OBJECT_NOT_FOUND"),
	INVALID_PATH_KEY			(1010,"INVALID_PATH_KEY"),
	SAME_FILES_NAME				(1011,"SAME_FILES_NAME"), 
	INVALID_MESSAGE_STATUS		(1012,"INVALID_MESSAGE_STATUS"),
	INVALID_MESSAGE_TYPE		(1013,"INVALID_MESSAGE_TYPE"),
	INVALID_BUSINESS_OBJECT_ID	(1014, "INVALID_BUSINESS_OBJECT_ID"),
	USERNAME_ALREADY_EXISTS		(1015, "USERNAME_ALREADY_EXISTS"),
	LABNAME_ALREADY_EXISTS		(1016, "LABNAME_ALREADY_EXISTS"),
	RELEASE_NOT_FOUND			(1017, "RELEASE_NOT_FOUND"),
	LAB_NOT_FOUND				(1017, "LAB_NOT_FOUND"),
	RELEASE_CUP_NOT_FOUND		(1017, "RELEASE_CUP_NOT_FOUND");
	

	private Integer code;
	private String message;

	private ErrorCodeEnum(Integer code,String codeMsg) {
		this.code = code;
		this.message = codeMsg;
	}
	
	public Integer getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	
	
}

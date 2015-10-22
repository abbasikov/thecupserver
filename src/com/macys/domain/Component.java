package com.macys.domain;

import com.macys.domain.business.BusinessObject;

public interface Component extends BusinessObject{

	public abstract void setIsChecked(String isChecked);

	public abstract String getIsChecked();

	public abstract void setDescription(String description);

	public abstract String getDescription();

}

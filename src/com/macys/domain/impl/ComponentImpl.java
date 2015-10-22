package com.macys.domain.impl;

import org.apache.commons.lang3.StringUtils;

import com.macys.dao.database.DBObject;
import com.macys.domain.Component;
import com.macys.domain.business.BusinessObjectImpl;
import com.macys.domain.business.common.BusinessObjectTypeEnum;
import com.macys.domain.business.common.annotations.PersistentBusinessObject;
import com.macys.domain.business.common.annotations.PersistentMetadata;
import com.macys.utils.AppUtils;
import com.macys.valuesobjects.BaseDTO;
import com.macys.valuesobjects.ComponentVo;

@PersistentBusinessObject(type=BusinessObjectTypeEnum.COMPONENT)
public class ComponentImpl extends BusinessObjectImpl implements Component{

	public ComponentImpl(DBObject dbObject) {
		super(dbObject);
		// TODO Auto-generated constructor stub
	}
	
	@PersistentMetadata
	private String description;
	
	@PersistentMetadata
	private String isChecked;

	@Override
	public String getDescription() {
		return description;
	}

	@Override
	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String getIsChecked() {
		return isChecked;
	}

	@Override
	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}
	
	@Override
	public BaseDTO createDTO() {
		ComponentVo vo 		= new ComponentVo();
		vo.name 			= this.getName();
		vo.type 			= this.getType();
		vo.uuid 			= this.getUuid();
		vo.createdOnISO8601	= AppUtils.getDateISO8601(this.getCreatedOn());
		vo.createdBy		= this.getCreatedBy();
		
		vo.description		= this.description;
		vo.isChecked		= StringUtils.isBlank(this.isChecked) ? "false" : this.isChecked ;
		
		return vo;
	}
		
}

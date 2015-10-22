package com.macys.valuesobjects;

public class ComponentVo extends BaseDTO{

	public String description;
	
	public String isChecked;
	
	@Override
	public boolean equals(Object obj) {
		if(obj==null)
			return false;
		
		if(obj instanceof ComponentVo){
			ComponentVo that = (ComponentVo)obj;
			if(this == that)
				return true;
			
			if(this.uuid.equals(that.uuid) )
				return true;
			else
				return false;
		}
		else
			return false;
		
		
	}
	
}

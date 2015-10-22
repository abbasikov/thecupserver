package com.macys.valuesobjects.containers;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import com.macys.valuesobjects.ComponentVo;

public class ComponentContainerVo extends BaseContainerVo{

	@JsonProperty("data")
	@JsonSerialize(include=Inclusion.NON_NULL)
	public ComponentVo data;
	
	@JsonProperty("dataList")
	@JsonSerialize(include=Inclusion.NON_NULL)
	public List<ComponentVo> dataList;
}

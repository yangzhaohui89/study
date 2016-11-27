package com.tf.tadmin.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 
 *
 *
 * @date 2015年10月21日
 *
 * @author mo.xf
 *
 */
public class Role extends BaseEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6464776536646326295L;

	private String name ;
	
	private Integer status ;
	
	private String remark ;
	
	private List<Integer> resource ;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<Integer> getResource() {
		return resource;
	}

	public void setResource(List<Integer> resource) {
		this.resource = resource;
	}
}

package com.tf.tadmin.entity;

import java.util.List;

import com.tf.tadmin.utils.MD5Utils;

/**
 * 
 *
 *
 * @date 2015年10月21日
 *
 * @author mo.xf
 *
 */
public class Admin extends BaseEntity{
	private String name ;
	
	/**
	 * 昵称
	 */
	private String nickname ;
	
	private String password ;
	
	/**
	 * 部门ID，预留
	 */
	private Integer deptId ; 
	
	private String tel ;
	
	private String email ;
	
	/**
	 * 状态：1启用，2停用
	 */
	private Integer status ;
	
	private String remark ;
	
	private List<Integer> roles ;
	
	@Override
	public String toString() {
		return String.format("name=%s,nickname=%s,deptId=%s,tel=%s,email=%s,status=%s,remark=%s",name , nickname ,deptId , tel , email , status , remark) ;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		if(password.length() == 32){
			this.password = password;
		}else{
			this.password = MD5Utils.encoderByMd5With32Bit(password) ;
		}
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public List<Integer> getRoles() {
		return roles;
	}

	public void setRoles(List<Integer> roles) {
		this.roles = roles;
	}
}
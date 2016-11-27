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
public class SessionUser implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7872581604453257086L;
	
	private Integer id ;

	private String name ;
	
	private List<Role> roles ;
	
	private String menu ;
	
	public long loginTime ;
	
	public SessionUser(){}
	
	public SessionUser(int id,String name , List<Role> roles ,String menu){
		this.id = id ;
		this.name = name ;
		this.roles = roles ;
		this.menu = menu ;
		loginTime = System.currentTimeMillis() ;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(long loginTime) {
		this.loginTime = loginTime;
	}
	
	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("SessionUser:[name=%s ,loginTime=%s]", name , loginTime);
	}
}

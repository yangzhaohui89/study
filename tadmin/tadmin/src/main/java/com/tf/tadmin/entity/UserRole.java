package com.tf.tadmin.entity;

/**
 * 
 * 用户角色
 *
 * @date 2015年12月28日
 *
 * @author mo.xf
 *
 */
public class UserRole extends BaseEntity{
	private Integer userId ;
	
	private Integer roleId ;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof UserRole){
			try{
				UserRole userRole = (UserRole)obj ;
				if(userRole.getUserId() == this.userId && userRole.getRoleId() == this.roleId){
					return true ;
				}
			}catch(Exception e){}
		}

		return false ;
	}
}

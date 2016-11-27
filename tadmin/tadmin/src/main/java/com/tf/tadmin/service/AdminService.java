package com.tf.tadmin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.mapper.AdminMapper;
import com.tf.tadmin.mapper.RoleMapper;

/**
 * 
 *
 *
 * @date 2015年10月21日
 *
 * @author mo.xf
 *
 */
@Service
public class AdminService extends BaseService{
	@Resource
	private AdminMapper adminMapper ;
	
	@Resource
	private RoleMapper roleMapper ;
	
	public List<Admin> list(Integer s , String q){
		Map<String , Object> param = this.param() ;
		param.put("status", s) ;
		param.put("q" , q);
		
		return this.adminMapper.queryList(param) ;
	}
	
	public int add(Admin admin){
		return this.adminMapper.insert(admin) ;
	}
	
	public int update(Admin admin){
		return this.adminMapper.update(admin) ;
	}
	
	public int del(int id){
		this.roleMapper.userRoleDeleteForUser(id) ;
		return this.adminMapper.delete(id) ;
	}
	
	public Admin get(int id){
		return this.adminMapper.queryById(id) ;
	}
	
	public Admin get(String login){
		return this.adminMapper.queryByLogin(login) ;
	}
}

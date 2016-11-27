package com.tf.tadmin.mapper;


import org.apache.ibatis.annotations.Param;

import com.tf.tadmin.entity.Admin;


public interface AdminMapper extends BaseMapper<Admin,Integer>{
	//public List<Admin> queryList(Map<String,Object> map) ;
	
//	public int count(Map<String,Object> map) ;
//	
//	public Admin queryById(@Param("id") int id) ;
//	
	public Admin queryByLogin(@Param("login")String login) ;
//	
//	public int insert(Admin admin) ;
//	
//	public int update(Admin admin);
//	
//	public int delete(@Param("id") int id ) ;
}

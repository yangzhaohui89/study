package com.tf.tadmin.mapper;

import com.tf.tadmin.entity.Log;

/**
 * 
 * 日志管理
 * 
 * @author mo.xf
 *
 */
public interface LogMapper extends BaseMapper<Log, Integer>{
	
	public int delLogForDate(String date) ;
	
//	public List<Log> queryList(Map<String,Object> map) ;
//	
//	public int count(Map<String,Object> map) ;
//	
//	
//	public int insert(Log log) ;
}

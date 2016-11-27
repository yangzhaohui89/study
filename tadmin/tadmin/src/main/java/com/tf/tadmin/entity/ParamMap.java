package com.tf.tadmin.entity;

import java.util.HashMap;

/**
 * 
 * @author MoXiaoFeng
 *
 */
public class ParamMap extends HashMap<String, Object> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static ParamMap create(){
		return new ParamMap() ;
	}
}

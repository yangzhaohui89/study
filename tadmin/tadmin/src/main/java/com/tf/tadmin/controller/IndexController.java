package com.tf.tadmin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
@Controller
public class IndexController {
	private static final Logger log = LoggerFactory.getLogger(IndexController.class) ;
	
	@RequestMapping(value = "/" , method = {RequestMethod.GET , RequestMethod.POST})
	public String redirect(){
		return "redirect:admin";
	}
	
	@RequestMapping(value = "/index" , method = {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView index(){
		log.info("request /index");
		ModelAndView mav = new ModelAndView() ;
		mav.setViewName("index");
		return mav ;
	}
	
	public static void main(String[] args) {
		System.out.println(MD5Utils.encoderByMd5With32Bit("123456"));
	}
}

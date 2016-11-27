package com.tf.tadmin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tf.tadmin.entity.Log;
import com.tf.tadmin.entity.Pager;
import com.tf.tadmin.service.LogService;
import com.tf.tadmin.utils.Constants;

/**
 * 
 *
 *
 * @date 2016年1月3日
 *
 * @author mo.xf
 *
 */
@Controller
@RequestMapping(value = "/log")
public class LogController extends BaseController {
	
	@Resource
	private LogService logService ;
	
	@RequestMapping(value = "/index")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView() ;
		this.setAdminView(mav, "log/log-index");
		return mav ;
	}
	@RequestMapping(value = "/list")
	public @ResponseBody Pager<Log> list(@RequestParam(required=true) Integer page,@RequestParam(required=false) String minDate,@RequestParam(required=false) String maxDate){
		int start = (page - 1)*Constants.PAGE_SIZE ;
		Pager<Log> pager = this.logService.queryList(start, minDate, maxDate) ;
		return pager; 
	}

}

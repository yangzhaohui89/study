package com.tf.tadmin.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tf.tadmin.entity.Admin;
import com.tf.tadmin.entity.Message;
import com.tf.tadmin.entity.SessionUser;
import com.tf.tadmin.service.AdminService;
import com.tf.tadmin.service.RoleService;
import com.tf.tadmin.shiro.NoPermissionException;
import com.tf.tadmin.shiro.ShiroUtils;
import com.tf.tadmin.utils.Constants;
import com.tf.tadmin.utils.MD5Utils;

/**
 * 
 *
 *
 * @date 2015年12月28日
 *
 * @author mo.xf
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController{
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminController.class) ;
	
	@Resource
	private AdminService adminService ;
	
	@javax.annotation.Resource
	private RoleService roleService ;
	
	/**
	 * 打开后台首页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "" ,method = {RequestMethod.GET})
	public ModelAndView admin(HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView() ;
		SessionUser sessionUser = ShiroUtils.getSessionUser() ;
		mav.addObject("menu", sessionUser.getMenu()) ;
		this.setAdminView(mav, "admin");
		return mav ;
	}
	
	/**
	 * 初始化菜单
	 * @return
	 */
//	private String initMenu(){
//		SessionUser sessionUser = ShiroUtils.getSessionUser() ;
//		StringBuffer sb = new StringBuffer() ;
//		List<Menu> list = null ;
//		//如果是超级管理员
//		if(ShiroUtils.isSupperManager()){
//			list = menuService.queryList() ;
//		}else{
//			list = menuService.queryListByUser(sessionUser.getId()) ;
//		}
//		
//		Map<String,List<Menu>> map = new HashMap<String,List<Menu>>() ;
//		
//		List<Menu> parents = new ArrayList<Menu>() ;
//
//		Iterator<Menu> it = list.iterator() ;
//		
//		while(it.hasNext()){
//			Menu m = it.next() ;
//			if(StringUtils.isEmpty(m.getPid())){
//				List<Menu> l = new ArrayList<>() ;
//				map.put(m.getId(), l) ;
//				parents.add(m) ;
//				it.remove(); 
//			}
//		}
//		
//		for(Menu m : list){
//			List<Menu> l = map.get(m.getPid()) ;
//			if(l != null){
//				l.add(m) ;
//			}
//		}
//		String li = "<li><a _href=\"%s\" href=\"javascript:;\">%s</a></li>";
//		String dl = "<dl><dt><i class=\"%s\"></i> %s<i class=\"Hui-iconfont menu_dropdown-arrow\">&#xe6d5;</i></dt> <dd><ul>%s</ul></dl>";
//		for(Menu parent : parents){
//			StringBuffer temp = new StringBuffer() ;
//			List<Menu> childer =  map.get(parent.getId()) ;
//			if(childer.size() > 0){
//				for(Menu m :childer){
//					temp.append(String.format(li, m.getUrl() , m.getName())) ;
//				}
//				sb.append(String.format(dl, parent.getIconCls() , parent.getName() , temp.toString())) ;
//			}
//		}
//		return sb.toString() ;
//	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/login" , method = {RequestMethod.GET , RequestMethod.POST})
	public void login(HttpServletRequest request , HttpServletResponse response) throws Exception{
		if("GET".equals(request.getMethod())){
			request.getRequestDispatcher("/WEB-INF/views/admin/admin-login.jsp").forward(request, response);
			return ;
		}else{
			boolean r = true ;
			String uname = request.getParameter("uname") ;
			String password = request.getParameter("password") ;
			
			LOGGER.info("Login Info:uname={},password={}" , uname , password);
			String msg = "";
			if(StringUtils.hasText(uname) && StringUtils.hasText(password)){
//				Admin admin =  adminService.get(uname) ;
//				if(admin != null ){
//					if(MD5Utils.encoderByMd5With32Bit(password).equals(admin.getPassword())){
//						SessionUser sessionUser = new SessionUser() ;
//						sessionUser.setName(admin.getName());
//						sessionUser.setLoginTime(System.currentTimeMillis());
//						request.getSession().setAttribute("sessionUser", sessionUser);
//						this.write("{\"r\":true}", response);
//						return ;
//					}
//				}else{
//					msg = "登录名或密码不正确!";
//				}
				
				Subject subject = SecurityUtils.getSubject();
				UsernamePasswordToken token = new UsernamePasswordToken(uname, password.toCharArray());
		        token.setRememberMe(true);
		        try {
		        	subject.login(token);
		        }catch(LockedAccountException e){
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "用户已经被锁定,请联系管理员!";
		        	r = false ;
		        }catch(IncorrectCredentialsException e){
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "登录名或密码不正确!";
		        	r = false ;
		        }catch (NoPermissionException e) {
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "用户没有权限登录,请联系管理员授权!";
		        	r = false ;
				}catch (Exception e) {
		        	LOGGER.info("{} login exception:{}" , uname , e);
		        	msg = "登录名或密码不正确!";
		        	r = false ;
		        }
			}else{
				msg = "登录名或密码不能为空!";
				r = false ;
			}

            //this.write("{\"r\":false,\"m\":\""+msg+"\"}", response);
			this.write(String.format("{\"r\":%s,\"m\":\"%s\"}", r , msg), response);
		}
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/logout" ,method = {RequestMethod.POST})
	public @ResponseBody Message logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return new Message() ;
	}
	
	@RequestMapping(value = "/index" ,method = {RequestMethod.GET})
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView() ;
		this.setAdminView(mav, "admin-index");
		return mav ;
	}
	
	@RequestMapping(value = "/edit" ,method = {RequestMethod.GET})
	public ModelAndView edit(@RequestParam(required = false) Integer id){
		ModelAndView mav = new ModelAndView() ;
		if(id != null){
			mav.addObject("admin", this.adminService.get(id));
		}
		mav.addObject("roles", this.roleService.list(null, 1)) ;
		this.setAdminView(mav, "admin-edit");
		return mav ;
	}
	
	/**
	 * 
	 * 保存
	 * 
	 * @param admin
	 * @return
	 */
	@RequestMapping(value = "/save" ,method = {RequestMethod.GET , RequestMethod.POST})
	public @ResponseBody Message save(Admin admin){
		boolean isModify = false ;
		Integer id = admin.getId()  ;
		if(id != null ){
			isModify = true ;
		}
		
		if(!this.adminService.uniquenessCheck(Constants.T_ADMIN, "name", admin.getName(), id, isModify)){
			return new Message(false, "用户名已经存在!") ;
		}
		if(!this.adminService.uniquenessCheck(Constants.T_ADMIN, "tel", admin.getTel(), id, isModify) ){
			return new Message(false, "手机号码已经存在!") ;
		}
		if(!this.adminService.uniquenessCheck(Constants.T_ADMIN, "email", admin.getEmail(), id, isModify) ){
			return new Message(false, "邮箱已经存在!") ;
		}
		
		int result = 0 ;
		if(isModify){
			result = this.adminService.update(admin) ;
		}else{
			result = this.adminService.add(admin) ;
		}
		this.roleService.saveAllRole(admin.getRoles(), admin.getId());
		return new Message(result) ;
	}
	
	@RequestMapping(value = "/del/{id}" , method = {RequestMethod.POST})
	public @ResponseBody Message del(@PathVariable Integer id){
		Admin admin = adminService.get(id) ;
		if(admin== null){
			return new Message(false) ;
		}else if("admin".equals(admin.getName())){
			return new Message(false,"超级管理员不能删除") ;
		}else if(ShiroUtils.getSessionUser().getName().equals(admin.getName())){
			return new Message(false,"亲，自己把自己干掉不行吧!") ;
		}
		int result = this.adminService.del(id) ;
		return new Message(result) ;
	}
	
	@RequestMapping(value = "/delall" , method = {RequestMethod.POST})
	public @ResponseBody Message delAll(@RequestParam(value ="id[]" , required = false) Integer[] ids){
		//this.adminService.del(id) ;
		if(ids != null){
			for(Integer id :ids){
				this.adminService.del(id) ;
			}
		}
		
		return new Message() ;
	}
	
	@RequestMapping(value = "/list" ,method = {RequestMethod.GET})
	public @ResponseBody List<Admin> list(@RequestParam(required = false , value = "s") Integer s ,@RequestParam(required = false , value = "q") String q){
		return this.adminService.list(s,q) ;
	}
	
	@RequestMapping(value = "/main" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("javaVersion", System.getProperty("java.version")) ;
		String classPath = System.getProperty("java.class.path") ;
		mav.addObject("classPath",classPath.replaceAll(";", ";<br>")) ;
//		mav.addAllObjects(System.getenv()) ;
		mav.addObject("env", System.getenv()) ;
		this.setAdminView(mav, "main");
		return mav;
	}
	
}

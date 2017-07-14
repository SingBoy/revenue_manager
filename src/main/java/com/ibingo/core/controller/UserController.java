package com.ibingo.core.controller;


import com.ibingo.common.controller.BaseController;
import com.ibingo.common.pagination.model.PaginationList;
import com.ibingo.common.pagination.model.SimplePaginatedList;
import com.ibingo.common.utils.ConstantConfig;
import com.ibingo.common.utils.MD5Util;
import com.ibingo.core.model.User;
import com.ibingo.core.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;


	@RequestMapping(value = "/businesslist")
	public String businesslist(HttpSession session, User userQuery, ModelMap modelMap) {
		User user = new User();
		user = (User) session.getAttribute(ConstantConfig.USER);
		PaginationList<User> pageDataList = null;
		//当用户权限为1（超级管理员）时，查看所有商务人员列表
		if (user != null && user.getUserRole().equals(ConstantConfig.MANAGER_SUPER)) {
			userQuery.setUserRole(ConstantConfig.MANAGER_BUSINESS);
			pageDataList = userService.list(userQuery);
		} else {
			//当登陆用户权限为广告主或渠道时，只能查看自己的信息
			List<User> listUser = new ArrayList<User>();
			listUser.add(user);
			pageDataList = new SimplePaginatedList<User>(listUser, 0);
		}
		modelMap.addAttribute(ConstantConfig.PAGE_DATA_LIST, pageDataList);
		modelMap.addAttribute(ConstantConfig.QUERYBEAN, user);
		return "pager/business/list";
	}

	@RequestMapping(value = "/customerlist")
	public String customerlist(HttpSession session, User userQuery, ModelMap modelMap) {
		User user = new User();
		user = (User) session.getAttribute(ConstantConfig.USER);
		PaginationList<User> pageDataList = null;
		//当用户权限为1（超级管理员）时，查看所有客户人员列表
		if (user != null && user.getUserRole().equals(ConstantConfig.MANAGER_SUPER)) {
			userQuery.setUserRole(ConstantConfig.MANAGER_CUSTOMER);
			pageDataList = userService.list(userQuery);
		} else {
			//当登陆用户权限为广告主或渠道时，只能查看自己的信息
			List<User> listUser = new ArrayList<User>();
			listUser.add(user);
			pageDataList = new SimplePaginatedList<User>(listUser, 0);
		}
		modelMap.addAttribute(ConstantConfig.PAGE_DATA_LIST, pageDataList);
		modelMap.addAttribute(ConstantConfig.QUERYBEAN, user);
		return "pager/customer/list";
	}

	@RequestMapping(value = "/doCustomerSave/")
	public String doCustomerSave(ModelMap modelMap, User queryBean) {
			modelMap.addAttribute(ConstantConfig.QUERYBEAN, queryBean);
			return "pager/customer/from";
	}

	@RequestMapping(value = "/doCustomerUpdate/{id}")
	public String doCustomerUpdate(@PathVariable Integer id, ModelMap modelMap, User queryBean) {
		if (id == null) {
			modelMap.addAttribute(ConstantConfig.QUERYBEAN, queryBean);
			return "pager/customer/from";
		} else {
			User user = userService.get(id);
			modelMap.put(ConstantConfig.USERS, user);
			modelMap.addAttribute(ConstantConfig.QUERYBEAN, queryBean);
			return "pager/customer/from";
		}
	}


	@RequestMapping(value = "/doBusinessSave")
	public String doBusinessSave(ModelMap modelMap, User queryBean) {
			modelMap.addAttribute(ConstantConfig.QUERYBEAN, queryBean);
			return "pager/business/from";
	}
	@RequestMapping(value = "/doBusinessUpdate/{id}")
	public String doBusinessUpdate(@PathVariable Integer id, ModelMap modelMap, User queryBean) {
			User user = userService.get(id);
			modelMap.put(ConstantConfig.USERS, user);
			modelMap.addAttribute(ConstantConfig.QUERYBEAN, queryBean);
			return "pager/business/from";
	}

	@RequestMapping(value = {"/saveBusiness", "/updateBusiness"})
	public String saveOrUpdateBusiness(User user, ModelMap modelMap)
			throws UnsupportedEncodingException {
		user.setUserRole(ConstantConfig.MANAGER_BUSINESS);
		user.setPassword(MD5Util.MD5("111111"));
		userService.saveOrUpdate(user);
		return "redirect:/user/businesslist?keyword="+(java.net.URLEncoder.encode(user.getKeyword(),"UTF-8"))+"&currentPage="+user.getCurrentPage()+"&pageSize="+user.getPageSize();
	}

	@RequestMapping(value = {"/saveCustomer", "/updateCustomer"})
	public String saveOrUpdateCustomer(User user, ModelMap modelMap)
			throws UnsupportedEncodingException {
		user.setUserRole(ConstantConfig.MANAGER_CUSTOMER);
		user.setPassword(MD5Util.MD5("111111"));
		userService.saveOrUpdate(user);
		return "redirect:/user/customerlist?keyword="+(java.net.URLEncoder.encode(user.getKeyword(),"UTF-8"))+"&currentPage="+user.getCurrentPage()+"&pageSize="+user.getPageSize();
	}

	@RequestMapping(value = "/deleteCustomer/{id}")
	public String deleteCustomer(@PathVariable Integer id,User queryBean)
			throws UnsupportedEncodingException {
		userService.delete(id);
		return "redirect:/user/customerlist?keyword="+(java.net.URLEncoder.encode(queryBean.getKeyword(),"UTF-8"))+"&currentPage="+
				queryBean.getCurrentPage()+"&pageSize="+queryBean.getPageSize();
	}
	@RequestMapping(value = "/deleteBusiness/{id}")
	public String deleteBusiness(@PathVariable Integer id,User queryBean)
			throws UnsupportedEncodingException {
		userService.delete(id);
		return "redirect:/user/businesslist?keyword="+(java.net.URLEncoder.encode(queryBean.getKeyword(),"UTF-8"))+"&currentPage="+
				queryBean.getCurrentPage()+"&pageSize="+queryBean.getPageSize();
	}
}

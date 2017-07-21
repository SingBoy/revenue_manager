package com.ibingo.core.controller;

import com.ibingo.common.controller.BaseController;
import com.ibingo.common.pagination.model.PaginationList;
import com.ibingo.common.pagination.model.SimplePaginatedList;
import com.ibingo.common.utils.ConstantConfig;
import com.ibingo.core.model.User;
import com.ibingo.core.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			//当登陆用户权限为时，只能查看自己的信息
			List<User> listUser = new ArrayList<User>();
			listUser.add(user);
			pageDataList = new SimplePaginatedList<User>(listUser, 0);
		}
		modelMap.addAttribute(ConstantConfig.PAGE_DATA_LIST, pageDataList);
		modelMap.addAttribute(ConstantConfig.QUERYBEAN, userQuery);
		return "pager/business/list";
	}

	@RequestMapping(value = "/customerlist")
	public String customerlist(HttpSession session, User userQuery, ModelMap modelMap) {
		User user = new User();
		user = (User) session.getAttribute(ConstantConfig.USER);
		PaginationList<User> pageDataList = null;
		List<User> businessUserList = null;
		//当用户权限为1（超级管理员）时，查看所有客户人员列表
		if (user != null && user.getUserRole().equals(ConstantConfig.MANAGER_SUPER)) {
			userQuery.setUserRole(ConstantConfig.MANAGER_CUSTOMER);
			pageDataList = userService.list(userQuery);
			businessUserList = userService.selectBusinessList();
		} else {
			//当登陆用户权限为，只能查看自己的信息
			List<User> listUser = new ArrayList<User>();
			listUser.add(user);
			pageDataList = new SimplePaginatedList<User>(listUser, 0);
		}
		modelMap.addAttribute(ConstantConfig.BUSINESS_USER_LIST, businessUserList);
		modelMap.addAttribute(ConstantConfig.PAGE_DATA_LIST, pageDataList);
		modelMap.addAttribute(ConstantConfig.QUERYBEAN, user);
		return "pager/customer/list";
	}

    @RequestMapping(value = "/getBusinessList")
    @ResponseBody
	public Map getBusinessList(HttpSession session) {
		User user = new User();
		user = (User) session.getAttribute(ConstantConfig.USER);
		List<User> businessUserList = null;
		//当用户权限为1（超级管理员）时，查看所有客户人员列表
		if (user != null && user.getUserRole().equals(ConstantConfig.MANAGER_SUPER)) {
			businessUserList = userService.selectBusinessList();
		}
		Map<String,Object> map = new HashMap<>();
		map.put("businessUserList",businessUserList);
		return map;
	}



	@RequestMapping(value = "/doCustomerSave/")
	public String doCustomerSave(ModelMap modelMap, User queryBean) {
			modelMap.addAttribute(ConstantConfig.QUERYBEAN, queryBean);
			return "pager/customer/from";
	}

	@RequestMapping(value = "/doCustomerUpdate/{id}")
	public String doCustomerUpdate(@PathVariable Integer id, ModelMap modelMap, User queryBean) {
			User user = userService.get(id);
			modelMap.put(ConstantConfig.USERS, user);
			modelMap.addAttribute(ConstantConfig.QUERYBEAN, queryBean);
			return "pager/customer/from";

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
		userService.saveOrUpdate(user);
		return "redirect:/user/businesslist?keyword="+(java.net.URLEncoder.encode(user.getKeyword(),"UTF-8"))+"&currentPage="+user.getCurrentPage()+"&pageSize="+user.getPageSize();
	}

	@RequestMapping(value = {"/saveCustomer", "/updateCustomer"})
	public String saveOrUpdateCustomer(User user, ModelMap modelMap)
			throws UnsupportedEncodingException {
		user.setUserRole(ConstantConfig.MANAGER_CUSTOMER);
		userService.saveOrUpdate(user);
		return "redirect:/user/customerlist?keyword="+(java.net.URLEncoder.encode(user.getKeyword(),"UTF-8"))+"&currentPage="+user.getCurrentPage()+"&pageSize="+user.getPageSize();
	}

	@RequestMapping(value = "/deleteCustomer")
	public String deleteCustomer(@Param("ids") Integer[] ids,User queryBean)
			throws UnsupportedEncodingException {
		userService.batchDelete(ids);
		return "redirect:/user/customerlist?keyword="+(java.net.URLEncoder.encode(queryBean.getKeyword(),"UTF-8"))+"&currentPage="+
				queryBean.getCurrentPage()+"&pageSize="+queryBean.getPageSize();
	}
	@RequestMapping(value = "/deleteBusiness")
	public String deleteBusiness(@Param("ids") Integer[] ids,User queryBean)
			throws UnsupportedEncodingException {
		userService.batchDelete(ids);
		return "redirect:/user/businesslist?keyword="+(java.net.URLEncoder.encode(queryBean.getKeyword(),"UTF-8"))+"&currentPage="+
				queryBean.getCurrentPage()+"&pageSize="+queryBean.getPageSize();
	}

    @RequestMapping(value = "/setBusiness")
    public String setBusiness(User queryBean)throws UnsupportedEncodingException  {
	    userService.updateBusiness(queryBean);
        return "redirect:/user/customerlist?keyword="+(java.net.URLEncoder.encode(queryBean.getKeyword(),"UTF-8"))+"&currentPage="+
                queryBean.getCurrentPage()+"&pageSize="+queryBean.getPageSize();
    }

	/**
	 * 重置默认密码11111
	 * @param id
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/editPassWordDefault")
	@ResponseBody
	public String editPassWordDefault(@RequestParam Integer id)throws UnsupportedEncodingException  {
		int count = userService.editPassWordDefault(id);
		if(count>0){
			return "success";
		}
		return "fail";
	}

	/**
	 * 重置默认密码11111
	 * @param id
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/checkUserName")
	@ResponseBody
	public String checkUserName(@RequestParam String username,@RequestParam String userRole)throws Exception  {
		int count = userService.selectByUsernameAndRole(username,userRole);
		if(count>0){
			return "fail";
		}
		return "success";
	}

}

package com.ibingo.core.controller;

import com.ibingo.common.controller.BaseController;
import com.ibingo.common.utils.ConstantConfig;
import com.ibingo.common.utils.MD5Util;
import com.ibingo.core.model.User;
import com.ibingo.core.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class LoginController extends BaseController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam String username,
			@RequestParam String password, HttpSession session,
			ModelMap modelMap,HttpServletResponse response) {
		try {
			if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
				throw new RuntimeException("账户或密码不能为空!");
			}
			User user = userService.login(username, password);
			if (null != user) {
				// 1、创建cookie
				username = URLEncoder.encode(username, "utf-8");
				Cookie usernameCookie = new Cookie("username", username);
				Date date = new Date();
				//tomcat8.5 日期之间不能空格
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddkk:mm:ss");
				String now = sdf.format(date);
				Cookie dateCookie = new Cookie("date", now);

				Cookie passwordCookie = new Cookie("password", password);
				// 2、设置cookie的过期时间，如果不设置，则浏览关闭后就过期了，本地就没有了
				usernameCookie.setMaxAge(30 * 24 * 3600);
				dateCookie.setMaxAge(30 * 24 * 3600);
				passwordCookie.setMaxAge(30 * 24 * 3600);
				// 3、将cookie存于响应对象中
				response.addCookie(usernameCookie);
				response.addCookie(dateCookie);
				response.addCookie(passwordCookie);
				
				session.setAttribute(ConstantConfig.UID, user.getId());
				session.setAttribute(ConstantConfig.USER, user);
			} else {
				//throw new RuntimeException("账户不存在!");
				modelMap.put(ConstantConfig.ERROR_MESSAGES, "账户不存在");
			}
			return "redirect:/welcome/index";
		} catch (Exception e) {
			modelMap.put(ConstantConfig.ERROR_MESSAGES, e.getMessage());
			return "login";
		}
	}

	@RequestMapping("/login")
	public String login(ModelMap modelMap) {
		return "login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (null != session) {
			session.invalidate();
		}
		return "redirect:/login";
	}

	@RequestMapping("/updatePassword")
	public String updatePassword(HttpSession session,ModelMap modelMap,@RequestParam String password,@RequestParam String pwdAgain) {
		if (null != session) {
			User user = new User();
			user = (User) session.getAttribute(ConstantConfig.USER);
			if(password.equals(pwdAgain)){
				user.setPassword(MD5Util.MD5(password));
				userService.updatePassword(user);
			}else{
				modelMap.put(ConstantConfig.ERROR_MESSAGES, "两次密码输入不一致!");
			}
		}
		return "redirect:/login";
	}

}

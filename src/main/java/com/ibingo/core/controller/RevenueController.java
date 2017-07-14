package com.ibingo.core.controller;

import com.ibingo.common.controller.BaseController;
import com.ibingo.common.utils.ConstantConfig;
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
@RequestMapping("revenue")
public class RevenueController extends BaseController {

	@Autowired
	private UserService userService;


	@RequestMapping("/list")
	public String login(ModelMap modelMap) {
		return "pager/revenue/list";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (null != session) {
			session.invalidate();
		}
		return "redirect:/login";
	}

}

package com.ibingo.core.controller;


import com.ibingo.common.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/welcome")
public class IndexController extends BaseController {
	

    @RequestMapping("/index")
	public String welcome(HttpSession session,ModelMap modelMap) {
		return "index";
	}
}

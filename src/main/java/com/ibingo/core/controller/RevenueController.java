package com.ibingo.core.controller;

import com.ibingo.common.controller.BaseController;
import com.ibingo.common.pagination.model.PaginationList;
import com.ibingo.common.utils.ConstantConfig;
import com.ibingo.common.utils.DateUtils;
import com.ibingo.common.utils.ExcelRead;
import com.ibingo.core.model.Revenue;
import com.ibingo.core.model.User;
import com.ibingo.core.service.RevenueService;
import com.ibingo.core.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("revenue")
public class RevenueController extends BaseController {

	@Autowired
	private UserService userService;

	@Autowired
	private RevenueService revenueService;


	@RequestMapping("/list")
	public String list(HttpSession session, Revenue revenueQuery, ModelMap modelMap) {
		User user  = (User)session.getAttribute(ConstantConfig.USER);
		PaginationList<Revenue> pageDataList = null;
		List<String> companyList = null;
		if(user != null) {
			if (user.getUserRole().equals(ConstantConfig.MANAGER_CUSTOMER)) {
				companyList = new ArrayList<>();
				companyList.add(user.getNickname());
				revenueQuery.setCreateDate(DateUtils.dateSubtracOneHour(new Date()));
			} else if(user.getUserRole().equals(ConstantConfig.MANAGER_BUSINESS)){
				List<User> userBusList = userService.getByBusinessId(user.getId());
				if(userBusList!=null && userBusList.size()>0){
					companyList = new ArrayList<>();
					for(User userfor :userBusList){
						companyList.add(userfor.getNickname());
					}
				}
				revenueQuery.setCreateDate(DateUtils.dateSubtracOneHour(new Date()));
			}
		}
		pageDataList = revenueService.list(revenueQuery,companyList);
		Revenue revenueTotal = revenueService.selectCountTotal(revenueQuery,companyList);
		modelMap.addAttribute(ConstantConfig.PAGE_DATA_LIST, pageDataList);
		modelMap.addAttribute(ConstantConfig.QUERYBEAN, revenueQuery);
		modelMap.addAttribute("revenueTotal", revenueTotal);
		return "pager/revenue/list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@Param("ids") Integer[] ids, Revenue queryBean)
			throws UnsupportedEncodingException {
		revenueService.batchDelete(ids);
		return "redirect:/revenue/list?keyword="+(java.net.URLEncoder.encode(queryBean.getKeyword(),"UTF-8"))+"&currentPage="+queryBean.getCurrentPage()+"&pageSize="+queryBean.getPageSize();
	}

	@RequestMapping("uploadFileExcel")
	public String uploadFileExcel(Revenue queryBean,ModelMap modelMap, @Param("file")MultipartFile file) throws UnsupportedEncodingException {
		try {
			List<ArrayList<String>> arrayList =  new ExcelRead().readExcel(file);
			List<Revenue> liserevenue = new ArrayList<Revenue>();
			if(arrayList!=null&&arrayList.size()>0){
				Revenue revenue = null;
				for(ArrayList<String> arr:arrayList){
					revenue= new Revenue();
					revenue.setGameName(arr.get(0));
					revenue.setCompanyName(arr.get(1));
					revenue.setRegisteredNum(arr.get(2)!=null?Integer.valueOf(arr.get(2)):0);
					revenue.setCuonsumOrderNum(arr.get(3)!=null?Integer.valueOf(arr.get(3)):0);
					revenue.setCuonsumNum(arr.get(4)!=null?Integer.valueOf(arr.get(4)):0);
					revenue.setCuonsumAmount(arr.get(5)!=null?Float.valueOf(arr.get(5)):0F);
					revenue.setDate(arr.get(6)!=null? DateUtils.parseStringToDate(arr.get(6)):null);
					revenue.setCreateDate(new Date());
					liserevenue.add(revenue);
				}
			}
			if(liserevenue.size()>0){
				revenueService.batchInsterRevenue(liserevenue);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/revenue/list?keyword="+(java.net.URLEncoder.encode(queryBean.getKeyword(),"UTF-8"))+"&currentPage="+queryBean.getCurrentPage()+"&pageSize="+queryBean.getPageSize();
	}


}

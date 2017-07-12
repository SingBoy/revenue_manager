package com.ibingo.common.utils;

/**
 * @author YuanLian
 *
 */
public class ConstantConfig {
	
	public static final String PAGE_DATA_LIST = "pageDataList";
	
	public static final String DATA_LIST = "dataList";

	public static final String UID = "uid";
	
	public static final String USER = "current_user";
	
	public static final String ERROR_MESSAGES = "errorMessages";
	
	public static final String PROJECT_NAME = "advert_new";
	
	public static final String ONETREE = "oneTree";
	
	public static final String TWOTREE = "twoTree";
	
	public static final String INDEX = "index";
	
	public static final String QUERYBEAN = "queryBean";
	
	public static final String ADVERTISERS = "advertisers";
	
	public static final String FRISTCHANNEL = "fristChannel";
	
	public static final String TWOCHANNEL = "twoChannel";
	
	public static final String USERBEAN = "user";
	
	public static final String MCC = "mcc";
	
	public static final String IPAREA = "ipArea";
	
	public static final String RESOURCES = "resources";
	
	public static final String DEFAULT = "defaultBean";
	
	public static final String TIMEZONECOUNTRY = "timezoneCountry";
	
	public static final String LISTFRISTCHANNEL = "listFristChannel";
	
	public static final String LISTADVERTISERS = "listAdvertisers";
	
	public static final String LISTMNC = "listMnc";
	
	public static final String LISTLINKCODES = "listLinkCodes";
	
	public static final String LISTTWOCHANNEL = "listTwoChannel";
	
	public static final String LISTRESOURCES = "listResources";
	
	public static final String LISTMCC = "listMcc";

	public static final String LISTDISRATE = "listDisRate";

	public static final String IMGPATH = "/home/ec2-user/advert-resouce";

	//public static final String IMGPATH="E:/advert_manager_imge";+
	
	//Voluum平台地址
	public static final String VOLUUM_URL;
	//Voluum平台账号
	public static final String VOLUUM_USERNAEM;
	//Voluum平台密码
	public static final String VOLUUM_PASSWORD;
	//广告系统的回调地址
	public static final String ADVERT_MANAGER_URL;
	static {
		VOLUUM_URL = PropertiesUtil.getInstance().getvalue("voluum_url");
		
		VOLUUM_USERNAEM = PropertiesUtil.getInstance().getvalue("voluum_username");
		
		VOLUUM_PASSWORD = PropertiesUtil.getInstance().getvalue("voluum_password");

		ADVERT_MANAGER_URL = PropertiesUtil.getInstance().getvalue("advert_manager_url");
	}
	
	
	
	public static final String TRAFFICSOURCE_TYPE_CUS = "CUSTOM";
	
	public static final String TRAFFICSOURCE_TYPE_PRE = "PREDEFINED";
	
	public static final String TRAFFICSOURCE_FINEDTYPE_ZER = "ZERO_PARK";
	
	public static final String TRAFFICSOURCE_FINEDTYPE_DSP = "DSP";
	
	
	public static final int HTTP_CODE_200 = 200;//请求成功
	
	public static final int HTTP_CODE_201 = 201;//请求已实现


	public static final int DEFAULT_NUMBER = 100;


	public final static Integer SUPER_MANAGER = 1;//超级管理员权限

	public final static Integer ADVERTISER_MANAGER = 2;//广告主权限

	public final static Integer TRAFFIC_MANAGER = 3;//渠道权限
	
}

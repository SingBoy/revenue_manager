package com.ibingo.core.service;

import com.ibingo.common.pagination.model.PaginationList;
import com.ibingo.core.model.Revenue;
import com.ibingo.core.model.User;

import java.util.List;

public interface RevenueService {

	public PaginationList<Revenue> list(Revenue revenue,List<String> companyList);

	public Revenue get(Integer id);

	public boolean saveOrUpdate(Revenue revenue);

	public boolean delete(Integer id);

	public boolean batchDelete(Integer [] ids);

	public boolean batchInsterRevenue(List<Revenue> revenues);

	public Revenue selectCountTotal(Revenue revenue,List<String> companyList);

	public Revenue selectByCompanyName(String companyName);
	
}

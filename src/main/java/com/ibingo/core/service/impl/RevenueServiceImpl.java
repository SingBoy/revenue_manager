package com.ibingo.core.service.impl;


import com.ibingo.common.pagination.model.PaginationList;
import com.ibingo.common.pagination.model.SimplePaginatedList;
import com.ibingo.core.dao.RevenueMapper;
import com.ibingo.core.model.Revenue;
import com.ibingo.core.service.RevenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RevenueServiceImpl implements RevenueService {

    @Autowired
    private RevenueMapper revenueMapper;

    @Override
    public PaginationList<Revenue> list(Revenue revenue,List<String> companyList) {
        Map<String, Object> params = arrageParams(revenue,companyList);
        Integer totalCount = revenueMapper.selectCount(params);
        List<Revenue> list = revenueMapper.selectList(params);
        SimplePaginatedList<Revenue> pList = new SimplePaginatedList<Revenue>(list, revenue.getCurrentPage(), revenue.getPageSize(), totalCount);
        return pList;
    }

    @Override
    public Revenue get(Integer id) {
        return revenueMapper.selectById(id);
    }

    @Override
    public boolean saveOrUpdate(Revenue revenue) {
        if (revenue.getId() == null) {
            return revenueMapper.updateRevenue(revenue) > 0;
        } else {
            return revenueMapper.saveRevenue(revenue) > 0;
        }
    }

    @Override
    public boolean delete(Integer id) {
        return revenueMapper.deleteByPrimaryKey(id);
    }

    @Override
    public boolean batchDelete(Integer[] ids) {
        return revenueMapper.batchDeleteRevenue(ids);
    }

    @Override
    public boolean batchInsterRevenue(List<Revenue> revenues) {
        return revenueMapper.batchInsterRevenue(revenues) > 0;
    }

    @Override
    public Revenue selectCountTotal(Revenue revenue, List<String> companyList) {
        Map<String, Object> params = arrageParams(revenue,companyList);
        return revenueMapper.selectCountTotal(params);
    }

    public Map<String, Object> arrageParams( Revenue revenue,List<String> companyList){
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("keyword",revenue.getKeyword());
        params.put("startDate",revenue.getStartDate());
        params.put("endDate",revenue.getEndDate());
        params.put("startIndex",revenue.getStartIndex());
        params.put("pageSize",revenue.getPageSize());
        params.put("createDate",revenue.getCreateDate());
        params.put("companyList",companyList);
        return params;
    }
}

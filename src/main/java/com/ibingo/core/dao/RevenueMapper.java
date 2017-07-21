package com.ibingo.core.dao;

import com.ibingo.core.model.Revenue;

import java.util.List;
import java.util.Map;

public interface RevenueMapper {
    public Integer selectCount(Map<String, Object> map);

    public List<Revenue> selectList(Map<String, Object> map);

    public Revenue selectById(Integer id);

    public int updateRevenue(Revenue revenue);

    public int saveRevenue(Revenue revenue);

    public boolean deleteByPrimaryKey(Integer id);

    public boolean batchDeleteRevenue(Integer [] ids);

    public int batchInsterRevenue(List<Revenue> revenues);

    public Revenue selectCountTotal(Map<String, Object> map);

}
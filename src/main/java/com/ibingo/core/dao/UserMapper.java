package com.ibingo.core.dao;

import com.ibingo.core.model.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
	public User selectUserByUsername(String username);
	
	public List<User> selectByUsername(String username);
}
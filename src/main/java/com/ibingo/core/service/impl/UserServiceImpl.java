package com.ibingo.core.service.impl;


import com.ibingo.common.pagination.model.PaginationList;
import com.ibingo.common.pagination.model.SimplePaginatedList;
import com.ibingo.core.dao.UserMapper;
import com.ibingo.core.model.User;
import com.ibingo.core.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	private final static Integer USER_STATUS_LOCKED = 1;
	
	@SuppressWarnings("unused")
	private final static Integer USER_STATUS_OK = 2;
	
	@Override
	public User login(String username, String password) {
		User user = userMapper.selectUserByUsername(username);
		if (null != user) {
			if (user.getStatus() == USER_STATUS_LOCKED) {
				throw new RuntimeException("账户已经被管理员锁定，暂无法使用!");
			}
			if (!password.equalsIgnoreCase(user.getPassword())) {
				throw new RuntimeException("账户或密码有误，请重新输入...");
			}
			return user;
		}
		return null;
	}
	
/*	@Override
	public PaginationList<User> list(UserQueryBean queryBean) {
			Integer totalCount = userMapper.selectCount(queryBean);
			List<User> list = userMapper.selectList(queryBean);
			SimplePaginatedList<User> pList = new SimplePaginatedList<User>(list, queryBean.getCurrentPage(), queryBean.getPageSize(), totalCount);
			return pList;
	}*/

	@Override
	public User get(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean saveOrUpdate(User user) {
		if (null != user.getId()) {
			User u = userMapper.selectByPrimaryKey(user.getId());
			BeanUtils.copyProperties(user, u);
			u.setModifyDate(new Date());
			return userMapper.updateByPrimaryKeySelective(u) > 0;
		} else {
			user.setStatus(1);//默认为禁用状态
			user.setCreateDate(new Date());
			return userMapper.insertSelective(user) > 0;
		}
	}

	@Override
	public boolean delete(Integer id) {
		return userMapper.deleteByPrimaryKey(id) > 0;
	}

	@Override
	public boolean enable(Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		if (user.getStatus() == 1) {
			user.setStatus(2);
		} else {
			user.setStatus(1);
		}
		user.setModifyDate(new Date());
		return userMapper.updateByPrimaryKeySelective(user) > 0;
	}

	@Override
	public Boolean selectByUsername(User user) {
		Boolean b = false;
		List<User> list = new ArrayList<User>();
		if(user.getId() != null){
			User u = userMapper.selectByPrimaryKey(user.getId());
			if(u.getUsername().equals(user.getUsername())){
				b = true;
			}else{
				list = userMapper.selectByUsername(user.getUsername());
			}
		}else{
			list = userMapper.selectByUsername(user.getUsername());
		}
		
		if(list.size() == 0){
			b = true;
		}
		return b;
	}

}

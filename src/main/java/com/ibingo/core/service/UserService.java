package com.ibingo.core.service;

import com.ibingo.core.model.User;

public interface UserService {
	
	public User login(String username, String password);

	public User get(Integer id);

	public boolean saveOrUpdate(User user);

	public boolean delete(Integer id);

	public boolean enable(Integer id);
	
	public Boolean selectByUsername(User user);
	
}

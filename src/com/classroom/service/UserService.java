package com.classroom.service;

import java.util.List;

import com.classroom.bean.User;

public interface UserService  extends BaseService<User>{
	public User getbyaccount(String account);
	public User login(User user);
	public List<User> getusersby(int id); 

}

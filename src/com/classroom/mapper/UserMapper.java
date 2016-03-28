package com.classroom.mapper;

import java.util.List;

import com.classroom.bean.User;

public interface UserMapper  extends BaseMapper<User> {
	public User login(User u);
	public User getbyaccount(String string);
	public List<User> getusersby(int id); 
}

package com.classroom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.classroom.bean.User;
import com.classroom.mapper.UserMapper;
import com.classroom.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public void save(User t) {
		// TODO Auto-generated method stub
		userMapper.save(t);
		
	}

	@Override
	public void delete(int t) {
		// TODO Auto-generated method stub
		userMapper.delete(t);
	}

	@Override
	public void update(User t) {
		// TODO Auto-generated method stub
		userMapper.update(t);
		
	}

	@Override
	public User getById(int id) {
		// TODO Auto-generated method stub
		return userMapper.getById(id);
	}

	@Override
	public User getbyaccount(String account) {
		// TODO Auto-generated method stub
		return userMapper.getbyaccount(account);
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userMapper.login(user);
	}

	@Override
	public List<User> getusersby(int id) {
		// TODO Auto-generated method stub
		return userMapper.getusersby(id);
	}

}

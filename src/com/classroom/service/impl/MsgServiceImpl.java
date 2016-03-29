package com.classroom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.classroom.bean.Msg;
import com.classroom.mapper.MsgMapper;
import com.classroom.service.MsgService;
@Service
public class MsgServiceImpl implements MsgService{
	@Autowired
	private MsgMapper msgMapper;

	@Override
	public void save(Msg t) {
		// TODO Auto-generated method stub
		msgMapper.save(t);
	}

	@Override
	public void delete(int t) {
		// TODO Auto-generated method stub
		msgMapper.delete(t);
	}

	@Override
	public void update(Msg t) {
		// TODO Auto-generated method stub
		msgMapper.update(t);
	}

	@Override
	public Msg getById(int id) {
		// TODO Auto-generated method stub
		return msgMapper.getById(id);
	}

	@Override
	public List<Msg> getall() {
		// TODO Auto-generated method stub
		return msgMapper.getall();
	}

	@Override
	public List<Msg> getbyuid(int u_id) {
		// TODO Auto-generated method stub
		return null;
	}

}

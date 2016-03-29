package com.classroom.mapper;

import java.util.List;

import com.classroom.bean.Msg;

public interface MsgMapper extends BaseMapper<Msg>{
	
	public List<Msg> getall();
	public List<Msg> getbyuid(int u_id);

}

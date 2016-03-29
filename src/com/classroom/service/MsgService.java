package com.classroom.service;

import java.util.List;

import com.classroom.bean.Msg;

public interface MsgService  extends BaseService<Msg> {
	public List<Msg> getall();
	public List<Msg> getbyuid(int u_id);

}

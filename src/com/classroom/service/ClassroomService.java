package com.classroom.service;

import java.util.List;

import com.classroom.bean.Classroom;

public interface ClassroomService extends BaseService<Classroom> {
	
	public List<Classroom> getquery(Classroom classroom);
	public List<Classroom> getbytime(Classroom classroom);
	public List<Classroom> getqueryroom(Classroom classroom);
	public int getsave(Classroom classroom);


 
}

package com.classroom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.classroom.bean.Classroom;
import com.classroom.mapper.ClassroomMapper;
import com.classroom.service.ClassroomService;
@Service
public class ClassroomServiceImpl implements ClassroomService {
	@Autowired
	private ClassroomMapper classroomMapper;

	@Override
	public void save(Classroom t) {
		// TODO Auto-generated method stub
		classroomMapper.save(t);
		
	}

	@Override
	public void delete(int t) {
		// TODO Auto-generated method stub
		classroomMapper.delete(t);
		
	}

	@Override
	public void update(Classroom t) {
		// TODO Auto-generated method stub
		classroomMapper.update(t);
		
	}

	@Override
	public Classroom getById(int id) {
		// TODO Auto-generated method stub
		return classroomMapper.getById(id);
	}

	@Override
	public List<Classroom> getquery(Classroom classroom) {
		// TODO Auto-generated method stub
		return classroomMapper.getquery(classroom);
	}

	@Override
	public List<Classroom> getbytime(Classroom classroom) {
		// TODO Auto-generated method stub
		return classroomMapper.getbytime(classroom);
	}

	@Override
	public List<Classroom> getqueryroom(Classroom classroom) {
		// TODO Auto-generated method stub
		return classroomMapper.getqueryroom(classroom);
	}


}

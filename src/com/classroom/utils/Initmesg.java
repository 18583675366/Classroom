package com.classroom.utils;

import java.util.List;

import com.classroom.bean.Classroom;
import com.classroom.data.OfftenData;
import com.classroom.service.ClassroomService;

public class Initmesg {

	/**
	 * 审核中的教室
	 * @return
	 */
	public static int  passingroom(ClassroomService service) {
		
		
		Classroom classroom=new Classroom();
		classroom.setCr_type(OfftenData.cr_passingroom);
		List<Classroom> classrooms=service.getquery(classroom);
		return classrooms.size();
		
	}
	/**
	 * 审核通过的教室
	 * @return
	 */
	public static int  passroom(ClassroomService service) {
		
		
		Classroom classroom=new Classroom();
		classroom.setCr_type(OfftenData.cr_passroom);
		List<Classroom> classrooms=service.getquery(classroom);
		return classrooms.size();
		
	}
}

package com.classroom.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.classroom.bean.Msg;
import com.classroom.service.ClassroomService;
import com.classroom.service.MsgService;
import com.classroom.service.UserService;
import com.classroom.utils.Initmesg;

@RequestMapping("/msg")
@Controller
public class MsgHandler {
	@Autowired
	private MsgService msgService;
	@Autowired
	private ClassroomService  classroomService;
	@Autowired
	private UserService userService;
	@RequestMapping("/queryNewmsg")
	public String  queryNewmsg(HttpSession session,@RequestParam Integer u_Id){
		List<Msg> msgs=msgService.getall();
		System.out.println(msgs);
		session.setAttribute("user", userService.getById(u_Id));
		session.setAttribute("msgs",msgs);
		session.setAttribute("passingroom", Initmesg.passingroom(classroomService));
		session.setAttribute("passroom", Initmesg.passroom(classroomService));
		return "front/msg";
	}


}

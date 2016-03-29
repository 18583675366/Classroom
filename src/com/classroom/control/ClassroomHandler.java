package com.classroom.control;

import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.classroom.bean.Classroom;
import com.classroom.bean.Msg;
import com.classroom.bean.User;
import com.classroom.service.ClassroomService;
import com.classroom.service.MsgService;
import com.classroom.service.UserService;
import com.classroom.utils.Datachange;
import com.classroom.utils.Flagchangefa;
import com.classroom.utils.Initmesg;

@Controller
@RequestMapping("/classroom")
public class ClassroomHandler {
	@Autowired
	private ClassroomService classroomService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private MsgService msgService;
	private Classroom classroomg = new Classroom();

	/**
	 * 进入查询教室界面
	 * 
	 * @return
	 */
	@RequestMapping("/queryclassroom")
	public String Queryclass(HttpSession session, Classroom classroom) {
			return "front/qclassroom";
	}
	/**
	 * ajax请求
	 * @param session
	 * @param classroom
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/ajqclassroom")
	public List<Classroom> ajqclassroom(HttpSession session, Classroom classroom) {
		List<Classroom> classrooms = new LinkedList<>();
		if(Datachange.isfeild(classroom)){
			System.out.println(classroom.getCr_id());
			classrooms = classroomService.getqueryroom(classroom);
		}
			return classrooms;
	}
	/**
	 * 进入教室页面
	 * 
	 */
	@RequestMapping("/roomhome")
	public String roomhome(@RequestParam Integer u_Id, HttpSession session) {
		session.removeAttribute("classroomss");
		session.setAttribute("user", userService.getById(u_Id));
		session.setAttribute("passingroom", Initmesg.passingroom(classroomService));
		session.setAttribute("passroom", Initmesg.passroom(classroomService));
		return "front/classroom";
	}

	/**
	 * 申请教室
	 */
	@RequestMapping("/applyroom")
	public String appluroom(Classroom classroom, HttpSession session) {
		System.out.println(classroom);
		try {
			if (classroom != null) {
				classroom.setCr_type(0);
				classroomService.save(classroom);
				Msg msg=new Msg();
				User t=(User) session.getAttribute("user");
				msg.setM_content(t.getU_account()+"提交申请"+classroom.getCr_id());
				msg.setM_time(new Date().toString());
				msg.setU_id(t.getU_Id());
				msg.setCr_id(classroom.getCr_id());
				msgService.save(msg);
				session.setAttribute("info", "已经成功提交等待审核");

			}
		} catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("info", "提交信息出错");
			e.printStackTrace();

		}
		session.setAttribute("passingroom", Initmesg.passingroom(classroomService));
		session.setAttribute("passroom", Initmesg.passroom(classroomService));
		return "front/applyroom";

	}

	private List<Classroom> page(List<Classroom> classrooms1, Integer currenrPage) {
		// TODO Auto-generated method stub
		List<Classroom> classrooms = new LinkedList<>();
		for (int i = 0; i < currenrPage * 4; i++) {
			try {
				classrooms1.remove(0);
			} catch (Exception e) {
				// TODO: handle exception
				return classrooms;
			}
		}
		for (int i = 0; i < 4; i++) {
			try {
				classrooms.add(classrooms1.get(i));
			} catch (Exception e) {
				// TODO: handle exception
				return classrooms;
			}
		}

		// TODO Auto-generated method stub
		return classrooms;
	}

	/**
	 * 我的申请单 z暂时只考虑显示4个数据
	 * 
	 */
	@RequestMapping("myapplyroom")
	public String myapplyroom(HttpSession session, @RequestParam Integer u_Id, @RequestParam Integer currentPage) {

		Classroom classroom = new Classroom();
		classroom.setU_Id(u_Id);
		List<Classroom> classrooms1 = classroomService.getquery(classroom);
		int pageCount = classrooms1.size() / 4 + 1;
		List<Classroom> classrooms = page(classrooms1, currentPage);
		User users = userService.getById(u_Id);
		System.out.println(classrooms);
		classroomgetuser(classrooms, users);
		classroomgettime(classrooms);
		System.out.println(classrooms);
		session.setAttribute("user", userService.getById(u_Id));
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("classrooms", classrooms);
		session.setAttribute("passingroom", Initmesg.passingroom(classroomService));
		session.setAttribute("passroom", Initmesg.passroom(classroomService));
		return "front/myapply";

	}

	private void classroomgettime(List<Classroom> classrooms) {
		// TODO Auto-generated method stub
		for (int i = 0; i < classrooms.size(); i++) {
			classrooms.get(i).setCr_timestart(Flagchangefa.changetime(classrooms.get(i).getCr_timestart()));
			classrooms.get(i).setCr_timeend(Flagchangefa.changetime(classrooms.get(i).getCr_timeend()));
		}

	}

	private void classroomgetuser(List<Classroom> classrooms, User users) {
		// TODO Auto-generated method stub
		for (int i = 0; i < classrooms.size(); i++) {

			classrooms.get(i).setCr_state(users.getU_account());

		}
	}

	/**
	 * 时间查询教室
	 */
	@RequestMapping("/searchroom")
	public String searchroom(HttpSession session, Classroom classroom, @RequestParam Integer currentPage) {
		if (classroom.getCr_timestart() != null) {
			classroomg = classroom;
		} else {
			classroom = classroomg;
		}
		System.out.println(classroom.toString());
		List<Classroom> classrooms1 = classroomService.getbytime(classroom);
		System.out.println(classrooms1.size());
		int pageCount = classrooms1.size() / 4 + 1;
		List<Classroom> classrooms = page(classrooms1, currentPage);
		User users = userService.getById(classroom.getU_Id());
		classroomgetuser(classrooms, users);
		classroomgettime(classrooms);
		session.setAttribute("user", userService.getById(classroom.getU_Id()));
		session.setAttribute("pageCounts", pageCount);
		session.setAttribute("classroomss", classrooms);
		session.setAttribute("passingroom", Initmesg.passingroom(classroomService));
		session.setAttribute("passroom", Initmesg.passroom(classroomService));
		return "front/classroom";

	}

}

package com.classroom.control;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.classroom.bean.Classroom;
import com.classroom.bean.Msg;
import com.classroom.bean.User;
import com.classroom.data.OfftenData;
import com.classroom.service.ClassroomService;
import com.classroom.service.MsgService;
import com.classroom.service.UserService;
import com.classroom.utils.Datachange;
import com.classroom.utils.Initmesg;
import com.classroom.utils.MailSender;

@Controller
@RequestMapping("/user")
public class UserHandler {
	@Autowired
	private UserService userService;
	@Autowired
	private ClassroomService classroomService;
	@Autowired
	private MsgService msgService;

	/**
	 * 跳转到登录界面
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String login() {

		return "front/login";

	}

	@RequestMapping("/main")
	public String maintest() {
		return "front/main";
	}

	/**
	 * 申请教室
	 */
	@RequestMapping("/applyroom")
	public String appluroom(Classroom classroom, HttpSession session) {
		System.out.println(classroom);
		try {
			if (classroom.getCr_usertime()!=null) {
				classroom.setCr_type(OfftenData.cr_passingroom);
				classroomService.getsave(classroom);
				Msg msg=new Msg();
				User t=userService.getById(classroom.getU_Id());
				msg.setM_content(t.getU_account()+"提交申请"+classroom.getCr_id());
				msg.setM_time(new Date().toLocaleString());
				msg.setU_id(classroom.getU_Id());
				msg.setCr_id(classroom.getCr_id());
				System.out.println(msg);
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

	@RequestMapping("/register")
	public String register(User user, HttpSession session, Model model) {
		try {

			String validata_str = validataUser(user);
			if (validata_str == "error") {
				String uuid = UUID.randomUUID().toString();
				user.setU_username(uuid);
				
				user.setU_active(OfftenData.active_no);

				userService.save(user);
				session.setAttribute("user", user);
				String toAddress = user.getU_account();
				String content = "点击完成注册http://localhost:8080/Classroom/user/regValidate?uuid=" + uuid + "&email="
						+ user.getU_account();
				MailSender.sendMail(toAddress, content);
				model.addAttribute("info", "验证激活邮箱已经发送，请及时登录邮箱点击验证，(*^__^*)");
			} else {
				model.addAttribute("info", validata_str);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "front/info";

	}

	private String validataUser(User user) {
		// TODO Auto-generated method stub
		if (user.getU_account().trim().equals(""))
			return "邮箱不能为空";
		if (user.getU_password().trim().equals(""))
			return "密码不能为空";
		if (userService.getbyaccount(user.getU_account()) != null) {
			return "此邮箱已被注册";
		}
		return "error";
	}

	@RequestMapping("/registerUI")
	public String registerUI() {
		return "front/register";
	}
	@RequestMapping("/regValidate")
	public String regValidate(@RequestParam String email,@RequestParam String uuid, HttpSession session, Model model) {
		session.removeAttribute("classroomss");

		User user = userService.getbyaccount(email);
		if (session.getAttribute("user") != null) {

		}
		if (user.getU_username().equals(uuid)) {
			user.setU_active(OfftenData.active_su);
			userService.update(user);
			session.setAttribute("user", user);
		} else {
			model.addAttribute("info", "您注册超时，请重新注册(*^__^*");
			return "front/info";
		}
		session.setAttribute("passingroom",Initmesg.passingroom(classroomService));
		session.setAttribute("passroom",Initmesg.passroom(classroomService));
		return "front/classroom";
	}
	@ResponseBody
	@RequestMapping("/querymsglength")
	public int querymsglength(){
		return msgService.getall().size();
	}

}

package com.classroom.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/msg")
@Controller
public class MsgHandler {
	@RequestMapping("/queryNewmsg")
	public String  queryNewmsg(@RequestParam Integer u_Id){
		return "front/msg";
	}

}

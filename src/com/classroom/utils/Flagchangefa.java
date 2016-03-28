package com.classroom.utils;

public class Flagchangefa {
	/**
	 * 课程转换
	 * @param flag
	 * @return
	 */
public static String changetime(String flag){
	if(flag.equals("1")){
		return "08:10:00-08:55:00";
	}
	if(flag.equals("2")){
		return "09:00:00-09:45:00";
	}
	if(flag.equals("3")){
		return "10:10:00-10:55:00";
	}
	if(flag.equals("4")){
		return "11:00:00-11:45:00";
	}
	if(flag.equals("5")){
		return "11:50:00-12:35:00";
	}
	if(flag.equals("6")){
		return "12:45:00-14:00:00";
	}
	if(flag.equals("7")){
		return "14:10:00-14:55:00";
	}
	if(flag.equals("8")){
		return "15:00:00-15:45:00";
	}
	if(flag.equals("9")){
		return "16:10:00-16:55:00";
	}
	if(flag.equals("10")){
		return "17:00:00-17:45:00";
	}
	if(flag.equals("11")){
		return "17:50:00-18:35:00";
	}
	if(flag.equals("12")){
		return "19:10:00-19:55:00";
	}
	if(flag.equals("13")){
		return "20:00:00-20:45:00";
	}
	if(flag.equals("14")){
		return "20:50:00-21:35:00";
	}
	
	
	
	return null;
	
}

}

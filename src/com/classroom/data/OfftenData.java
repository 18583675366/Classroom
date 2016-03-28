package com.classroom.data;

public class OfftenData {
	public static final int  active_no=0;//没有激活
	public static final int  active_su=0;//已经激活
	/**
	 * 表示身份的标识
	 */
	public static final int  u_teacher=0;
	public static final int  u_student=1;
	public static final int  u_admin=2;
	
	
	/**
	 * 标识教室审核状态
	 * 
	 * 
	 */
	
	public static final int cr_passroom=1;//审核通过
	public static final int  cr_passingroom=0;//审核中
	public static final int  cr_end=2;//已经完成
	public static final int cr_termination=3;//终止

}

package com.classroom.bean;

import java.io.Serializable;
import java.util.Date;

public class Classroom implements Serializable{
	private Integer cr_id;
	private Integer cr_dec;
	private Integer cr_seat;
	private Integer cr_type;
	private String cr_state;
	private String cr_usertime;
	private String cr_userteach;
	private String cr_activecontent;
	private String cr_location;
	private String cr_timestart;
	private String cr_timeend;
	private Integer u_Id;
	public Integer getU_Id() {
		return u_Id;
	}
	public void setU_Id(Integer u_Id) {
		this.u_Id = u_Id;
	}
	@Override
	public String toString() {
		return "Classroom [cr_id=" + cr_id + ", cr_dec=" + cr_dec + ", cr_seat=" + cr_seat + ", cr_type=" + cr_type
				+ ", cr_state=" + cr_state + ", cr_usertime=" + cr_usertime + ", cr_userteach=" + cr_userteach
				+ ", cr_activecontent=" + cr_activecontent + ", cr_location=" + cr_location + ", cr_timestart="
				+ cr_timestart + ", cr_timeend=" + cr_timeend + ", u_Id=" + u_Id + "]";
	}
	public String getCr_state() {
		return cr_state;
	}
	public void setCr_state(String cr_state) {
		this.cr_state = cr_state;
	}
	public String getCr_usertime() {
		return cr_usertime;
	}
	public void setCr_usertime(String cr_usertime) {
		this.cr_usertime = cr_usertime;
	}
	public String getCr_timestart() {
		return cr_timestart;
	}
	public void setCr_timestart(String cr_timestart) {
		this.cr_timestart = cr_timestart;
	}
	public String getCr_timeend() {
		return cr_timeend;
	}
	public void setCr_timeend(String cr_timeend) {
		this.cr_timeend = cr_timeend;
	}
	public String getCr_location() {
		return cr_location;
	}
	public void setCr_location(String cr_location) {
		this.cr_location = cr_location;
	}
	public Integer getCr_id() {
		return cr_id;
	}
	public void setCr_id(Integer cr_id) {
		this.cr_id = cr_id;
	}
	public Integer getCr_dec() {
		return cr_dec;
	}
	public void setCr_dec(Integer cr_dec) {
		this.cr_dec = cr_dec;
	}
	public Integer getCr_seat() {
		return cr_seat;
	}
	public void setCr_seat(Integer cr_seat) {
		this.cr_seat = cr_seat;
	}
	public Integer getCr_type() {
		return cr_type;
	}
	public void setCr_type(Integer cr_type) {
		this.cr_type = cr_type;
	}
	public String getCr_userteach() {
		return cr_userteach;
	}
	public void setCr_userteach(String cr_userteach) {
		this.cr_userteach = cr_userteach;
	}
	public String getCr_activecontent() {
		return cr_activecontent;
	}
	public void setCr_activecontent(String cr_activecontent) {
		this.cr_activecontent = cr_activecontent;
	}

}

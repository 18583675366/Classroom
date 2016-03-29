package com.classroom.bean;

public class Msg {
	private Integer m_id;
	private String m_content;
	private String m_time;
	private Integer u_id;
	private Integer cr_id;
	@Override
	public String toString() {
		return "Msg [m_id=" + m_id + ", m_content=" + m_content + ", m_time=" + m_time + ", u_id=" + u_id + ", cr_id="
				+ cr_id + ", getM_id()=" + getM_id() + ", getM_content()=" + getM_content() + ", getM_time()="
				+ getM_time() + ", getU_id()=" + getU_id() + ", getCr_id()=" + getCr_id() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getM_content() {
		return m_content;
	}
	public void setM_content(String m_content) {
		this.m_content = m_content;
	}
	public String getM_time() {
		return m_time;
	}
	public void setM_time(String m_time) {
		this.m_time = m_time;
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Integer getCr_id() {
		return cr_id;
	}
	public void setCr_id(Integer cr_id) {
		this.cr_id = cr_id;
	}

}

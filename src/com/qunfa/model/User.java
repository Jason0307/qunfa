package com.qunfa.model;

public class User {

	private long id;
	private String nick_name;
	private String remark_name;
	private int group_id;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getRemark_name() {
		return remark_name;
	}
	public void setRemark_name(String remark_name) {
		this.remark_name = remark_name;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	
	
}

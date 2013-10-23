package com.qunfa.model;

public class Message {

	private long id;
	private int type;
	private String fakeid;
	private String nick_name;
	private long date_time;
	private String content;
	private String source;
	private int msg_status;
	private boolean has_reply;
	private String refuse_reason;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getFakeid() {
		return fakeid;
	}
	public void setFakeid(String fakeid) {
		this.fakeid = fakeid;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public long getDate_time() {
		return date_time;
	}
	public void setDate_time(long date_time) {
		this.date_time = date_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public int getMsg_status() {
		return msg_status;
	}
	public void setMsg_status(int msg_status) {
		this.msg_status = msg_status;
	}
	public boolean getHas_reply() {
		return has_reply;
	}
	public void setHas_reply(boolean has_reply) {
		this.has_reply = has_reply;
	}
	public String getRefuse_reason() {
		return refuse_reason;
	}
	public void setRefuse_reason(String refuse_reason) {
		this.refuse_reason = refuse_reason;
	}
	
	
}

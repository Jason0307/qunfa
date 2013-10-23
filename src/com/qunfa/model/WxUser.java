package com.qunfa.model;

public class WxUser {
	private String fakeId;
	private String nickName;
	public String getFakeId() {
		return fakeId;
	}
	public void setFakeId(String fakeId) {
		this.fakeId = fakeId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "WxUser [fakeId=" + fakeId + ", nickName=" + nickName + "]";
	}
	
	
}

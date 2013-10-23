package com.qunfa.model;

import java.util.ArrayList;

import com.qunfa.common.Page;

public class FanListDTO {
	private ArrayList<WxUser> userList;
	private Page page;

	public ArrayList<WxUser> getUserList() {
		return userList;
	}

	public void setUserList(ArrayList<WxUser> userList) {
		this.userList = userList;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}

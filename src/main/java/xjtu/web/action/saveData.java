package xjtu.web.action;

import com.opensymphony.xwork2.ActionSupport;

import xjtu.dao.User;

public class saveData extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private User user;

	public String test() throws Exception {
		System.out.println(user);
		System.out.println("连接成功111");
		return "success";
	}
}

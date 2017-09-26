package xjtu.web.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class getAjaxData extends ActionSupport {

	public String test() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(request);
		System.out.println("连接成功111");
		return "success";
	}
}

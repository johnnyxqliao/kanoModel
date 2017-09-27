package xjtu.web.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URLDecoder;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class getAjaxData extends ActionSupport {
	public String test() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		ServletInputStream is = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String str = URLDecoder.decode(br.readLine(), "utf-8");
		System.out.println(str);
		return "success";
	}
}

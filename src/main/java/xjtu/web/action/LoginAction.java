package xjtu.web.action;

import org.apache.shiro.authc.AuthenticationException;
import org.springframework.beans.factory.annotation.Autowired;

import xjtu.service.UserManager;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserManager userManager;
	
	private String username;
	private String password;
	
	public String login(){
        try {
			userManager.login(username, password);
		} catch (AuthenticationException e) {
			return INPUT;
		}
        return SUCCESS;
	}
	
	public String logout(){
		userManager.logout();
		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

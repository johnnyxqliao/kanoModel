package xjtu.web.action;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import xjtu.model.User;
import xjtu.service.UserService;

/**
 * Created by Json Wan on 2017/2/26.
 * Description:注册操作
 */

public class RegisterAction extends ActionSupport {
    private static final long serialVersionUID = 1L;

    @Autowired
    private UserService userService;

    private String username;
    private String password;

    public String register() {
        User user=new User(username,password,username);
        userService.createUser(user);
        return SUCCESS;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

package xjtu.service;

import javax.transaction.Transactional;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xjtu.dao.UserDao;
import xjtu.model.User;

@Service
@Transactional
public class UserManager {
	@Autowired
	UserDao dao;
	
	public void login(String username, String password) throws AuthenticationException{
		AuthenticationToken token = new UsernamePasswordToken(username, password);
		SecurityUtils.getSubject().login(token);
	}

	public void logout() {
		SecurityUtils.getSubject().logout();
	}

	public User getByUsername(String username) {
		return dao.getByUsername(username);
	}
}

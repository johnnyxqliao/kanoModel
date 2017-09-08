package xjtu.security;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import xjtu.model.User;
import xjtu.service.UserService;
/**
 * Created by Json Wan on 2017/2/26.
 * Description:通过查询数据库实现认证与授权
 */
public class ShiroDbRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String username = token.getUsername();
        User user;
        user = userService.getByUsername(username);
        if (user == null) {
            user = userService.getByUsername(username);
        }
        if (user != null) {
            return new SimpleAuthenticationInfo(
                    user.getUsername(), user.getPassword(),
                    getName());
        } else {
            return null;
        }
    }

    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        String shiroUser = (String) principals.fromRealm(getName())
                .iterator().next();
        User user;
        user = userService.getByUsername(shiroUser);
        if (user != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            return info;
        } else {
            return null;
        }
    }
}

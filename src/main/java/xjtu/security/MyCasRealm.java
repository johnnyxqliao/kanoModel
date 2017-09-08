package xjtu.security;

import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.subject.PrincipalCollection;
import xjtu.model.User;
import xjtu.service.UserService;

/**
 * Created by Json Wan on 2017/2/26.
 * Description:自定义的认证与授权实现
 */
public class MyCasRealm extends CasRealm {

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();
        User user = userService.getByUsername(username);
        //调试
        System.out.println(this.getClass().getName() + ":username=" + username);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        return authorizationInfo;
    }
}

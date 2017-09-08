package xjtu.service;


import org.springframework.beans.factory.annotation.Autowired;
import xjtu.dao.UserDao;
import xjtu.model.User;
import xjtu.util.PasswordHelper;
/**
 * Created by Json Wan on 2017/2/26.
 * Description:用户服务
 */
public class UserService {

    @Autowired
    PasswordHelper passwordHelper;
    @Autowired
    UserDao userDao;

    /**
     * 创建用户
     * @param user
     */
    public User createUser(User user){
        //密码加密
        passwordHelper.encryptPassword(user);
        userDao.add(user);
        return user;
    }

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    public void changePassword(Long userId, String newPassword){
        User user= userDao.get(User.class,userId);
        user.setPassword(newPassword);
        //密码加密
        passwordHelper.encryptPassword(user);
        userDao.update(user);
    }



    /**
     * 移除用户-角色关系
     * @param userId
     * @param roleIds
     */
    public void uncorrelationRoles(int userId, int... roleIds){
        //todo:

    }

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User getByUsername(String username){
        return userDao.getByUsername(username);
    }

    public PasswordHelper getPasswordHelper() {
        return passwordHelper;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setPasswordHelper(PasswordHelper passwordHelper) {
        this.passwordHelper = passwordHelper;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}

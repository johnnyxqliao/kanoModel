package xjtu.dao;


import org.hibernate.Query;
import xjtu.model.User;

import java.util.List;
import java.util.Set;

public class UserDao extends GenericDao<User> {
    public User getByUsername(String username) {
        Query q = getSession().createQuery("from User user where user.username=?");
        q.setString(0,username);
        List<User> userList = q.list();
        if (userList.size() < 1)
            return null;
        return (User) userList.get(0);
    }
}

package xjtu.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Json Wan on 2017/2/26.
 * Description:用户
 */
@Entity
@Table(name="Platform_S_User")
public class User extends BaseModel{
    //正常
    public static final int STATUS_NORMAL=1;
    //审核
    public static final int STATUS_CHECK=2;
    //封禁
    public static final int STATUS_FORBIDDEN=3;

    private int id;
    private String username;
    private String password;
    //加密用的盐，由系统自动生成
    private String salt;
    private int status;

    public User(){
        super();
    }

    public User(String username,String password,String createId) {
        super(createId);
        this.username=username;
        this.password=password;
        status=STATUS_NORMAL;
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getSalt() {
        return salt;
    }

    public int getStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", status=" + status +
                ", maintenance=" + maintenance +
                ", delete=" + delete +
                ", version=" + version +
                ", createId='" + createId + '\'' +
                ", createDate=" + createDate +
                ", updateId='" + updateId + '\'' +
                ", updateDate=" + updateDate +
                '}';
    }
}



package xjtu.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Json Wan on 2017/2/26.
 * Description:用户详细信息
 */
@Entity
@Table(name="Platform_S_UserInfo")
public class UserInfo extends BaseModel{
    //个人用户
    public static final int USER_TYPE_INDIVIDUAL=1;
    //企业用户
    public static final int USER_TYPE_ENTERPRISE=2;

    private int userId;
    private String phoneNumber;
    private String email;
    private String identifyNumber;
    private int userType;
    private int enterpriseId;
    private int departmentId;

    public UserInfo(){
        super();
    }
    public UserInfo(int userId,int userType,String createId){
        super(createId);
        this.userId=userId;
        this.userType=userType;
    }
    @Id
    public int getUserId() {
        return userId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getIdentifyNumber() {
        return identifyNumber;
    }

    public int getUserType() {
        return userType;
    }

    public int getEnterpriseId() {
        return enterpriseId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIdentifyNumber(String identifyNumber) {
        this.identifyNumber = identifyNumber;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public void setEnterpriseId(int enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId=" + userId +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", identifyNumber='" + identifyNumber + '\'' +
                ", userType=" + userType +
                ", enterpriseId=" + enterpriseId +
                ", departmentId=" + departmentId +
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

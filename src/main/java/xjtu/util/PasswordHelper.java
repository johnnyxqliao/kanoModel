package xjtu.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import xjtu.model.User;
/**
 * Created by Json Wan on 2017/2/26.
 * Description:密码加密工具类
 */
public class PasswordHelper {

    @Autowired
    private RandomNumberGenerator randomNumberGenerator;
    private String algorithmName = "md5";
    private int hashIterations = 2;

    public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
        this.randomNumberGenerator = randomNumberGenerator;
    }

    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }

    public void encryptPassword(User user) {

        //生成盐
        user.setSalt(randomNumberGenerator.nextBytes().toHex());
        String newPassword;
//      newPassword   = new SimpleHash(
//                algorithmName,
//                user.getPassword(),
//                ByteSource.Util.bytes(user.getSalt()),
//                hashIterations).toHex();
//        newPassword=user.getPassword();
        //todo:同cas端自定义加密方式
        newPassword   = new SimpleHash(algorithmName,user.getPassword(),null,1).toHex();
        user.setPassword(newPassword);
    }
}

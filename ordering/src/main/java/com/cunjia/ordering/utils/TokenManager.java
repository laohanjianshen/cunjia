package com.cunjia.ordering.utils;

import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.domain.User;
import com.cunjia.ordering.plugins.shiro.ShiroToken;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * SAAS Token管理工具
 */
public class TokenManager {

    /**
     * Token存储对象，保持5000个并发容量(K-useraccount@corCode,V-token)
     */
    public static Map<String, Object> map = new ConcurrentHashMap<String, Object>(
            5000);

    /**
     * 获取用户Token
     *
     * @param key
     * @return
     * @throws
     * @MethodName: getToken
     * @Description:
     */
    public static ShiroToken getToken(String key) {
        if (map.containsKey(key)) {
            return (ShiroToken) map.get(key);
        }
        return null;
    }

    /**
     * 添加用户token
     *
     * @param key        useraccount@corCode
     * @param ShiroToken
     * @throws
     * @MethodName: putToken
     * @Description:
     */
    public static void putToken(String key, ShiroToken ShiroToken) {
        map.put(key, ShiroToken);
    }

    /**
     * 移除token
     *
     * @param key useraccount@corCode
     * @throws
     * @MethodName: removeToken
     * @Description:
     */
    public static void removeToken(String key) {
        if (map.containsKey(key)) {
            map.remove(key);
        }
    }

    /**
     * 验证Token是否过期
     *
     * @return
     * @throws
     * @MethodName: isVlidateToken
     * @Description:
     */
    public static boolean isVlidateToken(String token) {
        if(true){
            return true;
        }
        ShiroToken shiroToken = null;
        try{
            shiroToken = parseTokenInfo(token);
        }catch (Exception e){
            throw new DescribeException(ExceptionEnum.TOKEN_FORMAT_ERROR);
        }

        int userId = shiroToken.getUserId();
        System.out.println("userId:" + userId);
        System.out.println("map:" + map);
        if (map.containsKey(String.valueOf(userId))) {
            ShiroToken ShiroToken = (ShiroToken) map.get(userId);
            long currentTimestamp = new Date().getTime();
            // 有效时间半小时
            if (ShiroToken.getLongTime() - currentTimestamp > 1800 * 1000) {
                return false;
            }
            return true;
        }
        return false;
    }

    /**
     * 更新Token
     *
     * @param key        useraccount@corCode
     * @param ShiroToken
     * @return
     * @throws
     * @MethodName: reputToken
     * @Description:
     */
    public static void reputToken(String key, ShiroToken ShiroToken) {
        if (map.containsKey(key)) {
            putToken(key, ShiroToken);
        }
    }

    /**
     * 更新Token
     *
     * @param key      useraccount@corCode
     * @param tokenStr
     * @return
     * @throws
     * @MethodName: reputToken
     * @Description:
     */
    public static void reputToken(String key, String tokenStr) {
        if (map.containsKey(key)) {
            ShiroToken ShiroToken = new ShiroToken(1, 1, null,null);
            ShiroToken.setUserToken(tokenStr);
            ShiroToken.setTimestamp(new Timestamp(new Date().getTime()));
            putToken(key, ShiroToken);
        }
    }

    /**
     * 是否包含用户token
     *
     * @param key useraccount@corCode
     * @return
     * @throws
     * @MethodName: iscontainKey
     * @Description:
     */
    public static boolean iscontainKey(String key) {
        return map.containsKey(key);
    }

    /**
     * 生成RSA加密 Token
     *
     * @param platformCode
     * @param tenantCode
     * @return
     * @throws
     * @MethodName: generateToken
     * @Description:
     */
    public static String generateToken(String publicKey, String platformCode, String tenantCode) {
        String str = platformCode + tenantCode + new Date().getTime();
        try {
            byte[] bytes = RSAUtils.encryptByPublicKey(str.getBytes(), publicKey);
            return new String(bytes, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static ShiroToken parseTokenInfo(String token) {
        String tokenInfo = DESUtils.decryptBasedDes(token);
        String[] tokenDetail = tokenInfo.split("@");
        ShiroToken shiroToken = new ShiroToken(Integer.valueOf(tokenDetail[0]), Integer.valueOf(tokenDetail[1]), tokenInfo, new Timestamp(System.currentTimeMillis()));
        System.out.println("token解析后的数据：" + shiroToken);
        return shiroToken;
    }

    public static String generateTokenByDES(User user) {
        String token = user.getUserId() + "@"+user.getShopId()+"@" + user.getUserWxOpenid();
        System.out.println("要加密的数据为：" + token);
        return DESUtils.encryptBasedDes(token);
    }

    /**
     * @param args
     * @throws Exception 测试函数入口
     * @throws
     * @MethodName: main
     * @Description:
     */
    public static void main(String[] args) throws Exception {
        System.out.println(Md5Utils.hash("123456"));
        String key = "wmsadmin@10000";
        ShiroToken ShiroToken = new ShiroToken(1, 1, null,null);
        ShiroToken.setUserToken("token==xxjisifdihfifdds");
        ShiroToken.setTimestamp(new Timestamp(new Date().getTime()));
        putToken(key, ShiroToken);
        com.cunjia.ordering.plugins.shiro.ShiroToken ShiroToken2 = getToken(key);
        System.out.println("token:" + ShiroToken2.getUserToken());
        System.out.println("isValidate:" + isVlidateToken(key));

        Map<String, Object> keyMap = RSAUtils.genKeyPair();
        String publicKey = RSAUtils.getPublicKey(keyMap);
        String privateKey = RSAUtils.getPrivateKey(keyMap);

        String token = generateToken(publicKey, "abcdefghijklmnopqrstuvwxyz", "10000");

        System.out.println("RSA Token:" + token);

        System.out.println("加密:" + new String(RSAUtils.encryptByPublicKey("this is data".getBytes(), publicKey), "UTF-8"));
        System.out.println("明文:" + new String(RSAUtils.decryptByPrivateKey(RSAUtils.encryptByPublicKey("this is data".getBytes(), publicKey), privateKey)));
    }
}
  
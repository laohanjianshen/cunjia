package com.cunjia.ordering.service;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.dao.UserMapper;
import com.cunjia.ordering.domain.User;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.utils.TokenManager;
import com.cunjia.ordering.vo.UserInfoVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userDao;

    public User getUserById(int userId) {
        return userDao.selectByPrimaryKey(userId);
    }

    public int addUser(User record) {
        return userDao.insertSelective(record);
    }

    public List<User> selectUserByMap(Map map) {
        return userDao.selectUserByMap(map);
    }

    public int updateById(User user) {
        return userDao.updateByPrimaryKeySelective(user);
    }

    /**
     * 前端登陆
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    public String firstLogin(User user) {
        User tempUser = userDao.getUserByOpenid(user);
        System.out.println("登陆时数据库查询结果："+tempUser);
        if (null == tempUser) {
            System.out.println("用户不存在，新建用户信息为：" + user);
            userDao.insertSelective(user);
            tempUser = user;
            tempUser.setShopId(Constants.ONE);
        }
        String tokenStr = TokenManager.generateTokenByDES(tempUser);
        ShiroToken token = new ShiroToken(tempUser.getUserId(),tempUser.getShopId(), tokenStr, new Timestamp(System.currentTimeMillis()));
        TokenManager.putToken(String.valueOf(tempUser.getUserId()), token);
        //更新登录时间 last login time
        tempUser.setUserLastLoginTime(new Date());
        tempUser.setUserToken(tokenStr);
        userDao.updateByPrimaryKeySelective(tempUser);
        System.out.println("用户登陆成功" + tempUser);
        return tokenStr;
    }

    @Override
    public int deleteUser(Integer userId) {
        return userDao.deleteByPrimaryKey(userId);
    }

    @Override
    public User getUserInfo(Integer userId) {
        return userDao.getUserInfo(userId);
    }

    @Override
    public UserInfoVO getUserExtraInfo(Integer userId) {
        return userDao.getUserExtraInfo(userId);
    }

    @Override
    public int updateUserRoleInfo(Integer userId, Long roleId) {
        return userDao.updateUserRoleInfo(userId, roleId);
    }

    @Override
    public List<UserInfoVO> getUserRoleAndPermission(Integer userId) {
        return userDao.getUserRoleAndPermission(userId);
    }
    /**
     * 绑定用户手机号
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @Override
    public int bindUserPhone(User user) {
        return userDao.bindUserPhone(user);
    }

}
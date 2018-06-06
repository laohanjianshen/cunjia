package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.User;
import com.cunjia.ordering.vo.UserInfoVO;

import java.util.List;
import java.util.Map;

public interface UserService {
    public User getUserById(int userId);

    int addUser(User record);

    public List<User> selectUserByMap(Map map);

    public int updateById(User user);

    public String firstLogin(User user);

    int deleteUser(Integer userId);

    User getUserInfo(Integer userId);

    UserInfoVO getUserExtraInfo(Integer userId);

    int updateUserRoleInfo(Integer userId, Long roleId);

    List<UserInfoVO> getUserRoleAndPermission(Integer userId);

    int bindUserPhone(User user);
}
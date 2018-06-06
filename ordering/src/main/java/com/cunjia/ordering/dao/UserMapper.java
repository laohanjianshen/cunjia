package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.User;
import com.cunjia.ordering.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getUserByOpenid(User user);

    List<User> selectUserByMap(Map map);

    User getUserInfo(Integer userId);

    UserInfoVO getUserExtraInfo(Integer userId);

    List<User> getAllUserList();

    int updateUserRoleInfo(@Param("userId") Integer userId, @Param("roleId") Long roleId);

    List<UserInfoVO> getUserRoleAndPermission(Integer userId);

    int bindUserPhone(User user);
}
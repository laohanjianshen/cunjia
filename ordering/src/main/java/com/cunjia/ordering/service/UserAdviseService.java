package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.UserAdvise;

import java.util.List;

/**
 * 用户建议
 * @auther xpc 252645816@qq.com
 * @date 2018/5/8 12:58
 */
public interface UserAdviseService {
    //用户提交建议
    String submitAdvise(UserAdvise userAdvise);
    //管理员后台查看建议
    List<UserAdvise> viewAllAdvise();
}

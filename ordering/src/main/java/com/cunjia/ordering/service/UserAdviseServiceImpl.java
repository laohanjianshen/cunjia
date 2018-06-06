package com.cunjia.ordering.service;

import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.dao.UserAdviseMapper;
import com.cunjia.ordering.domain.UserAdvise;
import com.cunjia.ordering.utils.TimeUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

/**
 * 用户建议
 *
 * @auther xpc 252645816@qq.com
 * @date 2018/5/8 13:06
 */
@Service
@Slf4j
public class UserAdviseServiceImpl implements UserAdviseService {
    @Resource
    private UserAdviseMapper userAdviseMapper;

    //用户提交建议
    @Override
    public String submitAdvise(UserAdvise userAdvise) throws Error {
        //1.先查询数据库中是否有该用户提交的建议按时间降序查出时间来,没有则直接插入数据.
        //1.1将查出来的最晚的3条数据的时间和当前时间对比,如果三条数据距当前时间都小于1天,则不得继续插入.
        Integer userId = userAdvise.getUserId();
        System.out.println(userId);
        List<UserAdvise> userAdviseList = userAdviseMapper.findAllByUserIdOrderByTimeDESC(userId);
        LocalDate nowDate = LocalDate.now();
        int flag = 0;
        if (!CollectionUtils.isEmpty(userAdviseList) && userAdviseList.size()>=3) {
            for (int i = 0; i < 3; i++) {
                UserAdvise userAdviseNew = userAdviseList.get(i);
                LocalDate submitDate = TimeUtils.timeStamp2LocalDate(userAdviseNew.getAdvisePutTime());
                int num = nowDate.compareTo(submitDate);
                System.out.println(num);
                if (num >= 1) {
                    flag = 1;
                    break;
                }
            }
        }else {
            flag = 1;
        }
        System.out.println(flag);
        if (flag != 1){
            throw new DescribeException(ExceptionEnum.SUBMIT_TIMES_OVER);
        }
        try {
            userAdviseMapper.insert(userAdvise);
        } catch (Exception e) {
           log.error("[提交建议]:提交建议失败 e={}",e);
           throw new DescribeException(ExceptionEnum.SUBMIT_ADVISE_FAIL);
        }
        return "提交成功,感谢您的建议!";
    }

    //管理员查看建议列表
    @Override
    public List<UserAdvise> viewAllAdvise() throws Error {
        List<UserAdvise> userAdviseList = userAdviseMapper.findAllAdviseOrderByTime();
        return userAdviseList;
    }
}

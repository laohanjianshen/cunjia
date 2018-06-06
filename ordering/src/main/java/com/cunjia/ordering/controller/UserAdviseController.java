package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.exception.DescribeException;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.UserAdvise;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.UserAdviseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 用户建议
 *
 * @auther xpc 252645816@qq.com
 * @date 2018/5/8 12:52
 */
@Slf4j
@RestController
@RequestMapping("/advise")
public class UserAdviseController extends BaseController {
    @Resource
    private UserAdviseService userAdviseService;

    /**
     * 用户提交建议
     *
     * @param userAdvise
     * @param bindingResult
     * @return
     */
    @PostMapping("/submit")
    public Result submitAdvise(@Validated UserAdvise userAdvise, BindingResult bindingResult, @Validated  ShiroToken token) {
        validateToken(token);
        userAdvise.setUserId(token.getUserId());
        if (bindingResult.hasErrors()) {
            log.error("[用户建议]:提交建议失败->bindingResult={}", bindingResult);
           if (bindingResult.getFieldError().getCode().equals("Size")){
               return ResultUtil.error(ExceptionEnum.CONTENT_SIZE_OVER);
           }
           if (bindingResult.getFieldError().getCode().equals("NotBlank")){
               return ResultUtil.error(ExceptionEnum.CONTENT_EMPTY);
           }
        }
        String msg = userAdviseService.submitAdvise(userAdvise);
        return ResultUtil.success(msg);
    }

    @GetMapping("/view")
    public Result<UserAdvise> viewAllUserAdvise() {
        List<UserAdvise> userAdviseList = null;
        try {
            userAdviseList = userAdviseService.viewAllAdvise();
        } catch (Exception e) {
            log.error("[用户建议]:查看用户建议失败e={}", e);
            throw new DescribeException(ExceptionEnum.VIEW_ADVISE_FAIL);
        }
        return ResultUtil.success(userAdviseList);
    }
}

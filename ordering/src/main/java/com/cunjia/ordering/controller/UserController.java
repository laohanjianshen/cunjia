package com.cunjia.ordering.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.Role;
import com.cunjia.ordering.domain.User;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.UserService;
import com.cunjia.ordering.utils.Md5Utils;
import com.cunjia.ordering.utils.NumberUtils;
import com.cunjia.ordering.utils.http.OkHttpUtil;
import com.cunjia.ordering.vo.UserInfoVO;
import javassist.bytecode.ExceptionsAttribute;
import org.apache.tomcat.util.bcel.Const;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户Controller
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    private static String APP_ID = "wx7a8795e5bef769da";
    private static String APP_SECRET = "8384c6bb7f82686e5e7d969266039756";
    private static String SMS_VALUE_SEND = "send";
    private static int SMS_VALUE_USERID = 1147;
    private static String SMS_VALUE_ACCOUNT = "SDK-A1147-1147";
    private static String SMS_VALUE_PASSWORD = "741852";
    private static String SMS_VALUE_MESSAGE = "（村家餐饮验证码,请勿泄露)。感谢您的支持【村家餐饮】";

    @Resource
    private UserService userService;



    /**
     * 小程序前端登陆
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @PostMapping(value = "/weChatLogin")
    @ResponseBody
    public Result weChatLogin(@Validated(User.WeChatLogin.class) User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            System.out.println("errors:" + bindingResult.getAllErrors());
            return ResultUtil.error(ExceptionEnum.USER_WECHAT_CODE_NULL);
        }
        //1、根据用户code获取openId与session_key
        Map<String, String> map = new HashMap<>();
        map.put(Constants.WX_APPID_KEY, APP_ID);
        map.put(Constants.WX_SECRET_KEY, APP_SECRET);
        map.put(Constants.WX_JS_CODE_KEY, user.getUserWxCode());
        map.put(Constants.WX_GRANT_TYPE_KEY, Constants.WX_AUTHORIZATION_CODE);
        JSONObject object = JSON.parseObject(OkHttpUtil.get(Constants.WX_OPEN_ID_URL, map));
        System.out.println("根据code从微信获取到的信息为：" + object);
        if (object.containsKey(Constants.WX_ERRCODE_KEY)) {
            return ResultUtil.error(object.getInteger(Constants.WX_ERRCODE_KEY), object.getString(Constants.WX_ERRMSG_KEY));
        }
        //2、根据openId生成token返回给用户
        user.setUserWxOpenid(object.getString(Constants.WX_OPEN_ID_KEY));
        map = new HashMap();
        map.put(Constants.USER_TOKEN_KEY, userService.firstLogin(user));
        System.out.println("返回给用户的token:" + map);
        return ResultUtil.success(map);
    }

    /**
     * 删除用户
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @PostMapping("/deleteUser")
    @ResponseBody
    public Result deleteUser(@Validated ShiroToken token) {
        validateToken(token);
        int result = userService.deleteUser(token.getUserId());
        return ResultUtil.error(result == Constants.ONE?ExceptionEnum.USER_DELETE_SUCCESS:ExceptionEnum.USER_DELETE_FAILED);
    }

    /**
     * 更新用户的个人信息
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/updateUserInfo")
    public Result updateUserInfo(@Validated ShiroToken token, @Validated User user, BindingResult bindingResult) {
        validateToken(token);
        user.setUserId(token.getUserId());
        int result = userService.updateById(user);
        return ResultUtil.error(result == Constants.ONE ? ExceptionEnum.UPDATE_USER_INFO_SUCCESS : ExceptionEnum.UPDATE_USER_INFO_FAILED);
    }

    /**
     * 获取用户信息
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/getUser")
    public Result getUserInfo(@Validated ShiroToken token) {
        validateToken(token);
        User tempUser = userService.getUserInfo(token.getUserId());
        if (tempUser == null) {
            return ResultUtil.error(ExceptionEnum.USER_NOT_FIND);
        }
        return ResultUtil.success(tempUser);
    }

    /**
     * 修改用户角色
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/changeUserRole")
    public Result changeUserRole(@Validated ShiroToken token, Role role) {
        validateToken(token);
        int result = userService.updateUserRoleInfo(token.getUserId(), role.getId());
        return ResultUtil.error(result == Constants.ONE?ExceptionEnum.UPDATE_USER_ROLE_SUCCESS:ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 获取用户角色及权限信息
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/getUserRoleInfo")
    public Result getUserRoleInfo(@Validated ShiroToken token) {
        validateToken(token);
        List<UserInfoVO> userInfoList = userService.getUserRoleAndPermission(token.getUserId());
        return ResultUtil.success(userInfoList);
    }

    /**
     * 发送验证码接口
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/sendCode")
    @CachePut(value="common",key="'code'+#user.getUserId()")
    public Result sendVerificationCode(@Validated ShiroToken token, User user) {
        //TODO 查询缓存中是否有用户的验证码，没有才发送，Redis中验证码保存5分钟,这种本地缓存可以考虑使用GUAVA或EnCache
        System.out.println("user:" + user);
        validateToken(token);
        Map params = new HashMap<>();
        params.put(Constants.SMS_KEY_ACTION,SMS_VALUE_SEND);
        params.put(Constants.SMS_KEY_USERID,SMS_VALUE_USERID);
        params.put(Constants.SMS_KEY_ACCOUNT,SMS_VALUE_ACCOUNT);
        params.put(Constants.SMS_KEY_PASSWORD,Md5Utils.encrypt(SMS_VALUE_PASSWORD));
        params.put(Constants.SMS_KEY_MOBILE,user.getUserPhone());
        params.put(Constants.SMS_KEY_CONTENT,NumberUtils.getVerifyCode() +SMS_VALUE_MESSAGE);
        String result = OkHttpUtil.get(Constants.SMS_BASE_URL,params);
        System.out.println("验证码发送结果："+result);
        return ResultUtil.success(result);
    }

    /**
     * 绑定用户手机号
     *
     * Author:靳楠楠
     * Date:2018/5/22
     */
    @ResponseBody
    @PostMapping("/bindPhone")
    @Cacheable(value="common",key="'code'+#user.getUserId()")
    public Result bindUserPhone(@Validated ShiroToken token, User user) {
        System.out.println("查询验证码：----------------");
        validateToken(token);
        user.setUserId(token.getUserId());
        //TODO 从Redis中获取验证码，比对成功后执行用户与手机号的绑定逻辑，这种本地缓存可以考虑使用GUAVA或EnCache
        int result = userService.bindUserPhone(user);
        return ResultUtil.error(result == Constants.ONE?ExceptionEnum.BIND_USER_PHONE_SUCCESS:ExceptionEnum.OPERATION_FAIL);
    }

}
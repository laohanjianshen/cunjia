package com.cunjia.ordering.base;

import java.math.BigDecimal;

/**
 * 常量类
 **/
public class Constants {
    public static final String CHARSET_NAME = "UTF-8";

    //Mybatis注解key
    public static final String MYBATIS_KEY_LIST = "list";

    //微信相关
    public static final String WX_OPEN_ID_URL = "https://api.weixin.qq.com/sns/jscode2session";
    public static final String WX_APPID_KEY = "appid";
    public static final String WX_SECRET_KEY = "secret";
    public static final String WX_JS_CODE_KEY = "js_code";
    public static final String WX_GRANT_TYPE_KEY = "grant_type";
    public static final String WX_AUTHORIZATION_CODE = "authorization_code";
    public static final String WX_OPEN_ID_KEY = "openid";
    public static final String WX_SESSION_KEY = "session_key";
    public static final String WX_ERRCODE_KEY = "errcode";
    public static final String WX_ERRMSG_KEY = "errmsg";
    public static final int REQUEST_SUCCESS_CODE = 0;
    public static final String USER_TOKEN_KEY = "userToken";//token键值
    //用户信息
    public static final String USER_UPDATE_SUCCESS = "更新成功";

    //短信验证相关

    public static final String SMS_BASE_URL = "http://client.movek.net:8888/sms.aspx";
    public static final String SMS_KEY_ACTION = "action";
    public static final String SMS_KEY_USERID = "userid";
    public static final String SMS_KEY_ACCOUNT = "account";
    public static final String SMS_KEY_PASSWORD = "password";
    public static final String SMS_KEY_MOBILE = "mobile";
    public static final String SMS_KEY_CONTENT = "content";


    //订单相关
    public static final String PROJECT_MODULE_ORDER = "order";
    public static final String ORDER_PROPERTY_ORDER_ID = "orderId";
    public static final String CREATE_ORDER_SUCCESS = "创建订单成功";
    public static final int BOX_LUNCH_TYPE_PERSON = 0;
    public static final int BOX_LUNCH_TYPE_SELF = 1;

    //盒饭相关
    public static final String BOX_LUNCH_MULTI = "multi";
    public static final String BOX_LUNCH_SINGLE = "single";
    public static final String KEY_IS_TRUE = "isTrue";
    public static final String KEY_RESULT_LIST = "list";

    public static final int ZERO = 0;
    public static final int ONE = 1;
    public static final int TWO = 2;
    public static final int THREE = 3;
    public static final int FIVE = 5;
    public static final int TEN = 10;
    public static final int FIFTY = 50;

    public static final int ONE_HUNDRED=100;
    public static final int NINETY_NINE=99;
    public static final int SIXTY = 60;
    public static final int TWENTY_FOUR = 24;
    public static final int ELEVEN = 11;

    //手机号 正则表达式
    public static final String PHONE_REGEX = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(199)|(17[013678])|(18[0,5-9]))\\d{8}$";

}

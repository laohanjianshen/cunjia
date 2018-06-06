package com.cunjia.ordering.base.exception;

/**
 * 异常枚举类
 * 全局异常1****
 * 用户模块异常2****
 * 购物车模块异常3****
 * 订单模块异常4****
 * 评论模块异常5****
 * 地址模块异常6****
 * 盒饭模块异常7****
 * 服务器异常-1
 */
public enum ExceptionEnum {

    /*
     * 全局常见错误码
     */
    PARAM_IS_NULL(10001, "缺少必要参数"),
    OPERATION_FAIL(10002, "操作失败"),
    PARAM_TYPE_FAIL(10003, "参数类型错误"),
    UNKNOW_ERROR(-1, "未知错误"),

    /*
     * 用户相关
     */
    USER_LOGIN_INVALID(20001, "认证失败，请重新登陆"),
    USER_DELETE_FAILED(20002, "删除用户失败"),
    USER_DELETE_SUCCESS(0, "删除用户成功"),
    USER_NOT_FIND(20003, "用户不存在"),
    USER_WECHAT_CODE_NULL(20004, "code不能为空"),
    USER_NAME_OR_PASSWORD_ERROR(21001, "用户名或密码错误"),
    UPDATE_USER_ROLE_SUCCESS(0, "用户角色修改成功"),

    /*
     * 个人点餐购物车模块
     */
    ADD_CART_FAIL(30001,"添加购物车失败"),
    REMOVE_CART_FAIL(30002, "移除购物车失败,请检查移除数量"),
    REMOVE_ALL_FAIL(30003, "清空购物车失败"),
    GOODS_NOT_EXIST_IN_CART(30004, "亲,购物车中不存在该商品或该商品已过期"),
    EMPTY_CARTS(30005, "您的购物车空空如也,一大波美食等待您来选购"),
    VIEW_CART_FAIL(30007,"查看购物车失败"),
    DECREASE_CART_FAIL(30008,"减购失败"),
    /*
     *自助点餐购物车模块
     *
     */
    FOOD_NOT_MEET_REQUIREMENTS(30006,"亲,自助点餐主食,主菜,辅菜,小菜必点哦!,悄悄地告诉您:一份自助点餐小菜最多只可以点3份"),
    MAIN_COURSE_ERRO(30007,"请选选择你的主菜"),
    ASSISTANT_DISH_ERRO(30008,"请选择你的副菜"),
    SIDE_DISH_ERRO(30009,"请选择你的小菜"),
    STAPLE_FOOD_ERRO(30010,"请选择你的主食"),

    /*
     * 订单模块
     */
    CREATE_ORDER_FAILED(40001,"创建订单失败"),
    GET_ORDER_DETAIL_FAILED(40002,"获取订单详情失败"),
    BOX_LUNCH_IN_ORDER_INVALID(40003, "订单中存在已下架商品"),
    UPDATE_ORDER_INFO_FAILED(40004,"创建订单失败"),
    ORDER_BOX_LUNCH_STOP_SELL(40005,"当天商品已停售"),
    ORDER_BOX_LUNCH_LACK_FOOD(40006,"所选商品食材不足，请重新选择后购买"),
    BOX_LUNCH_DATE_INVALID(40007,"日期无效，只能选择当天及以后的时间"),
    CREATE_ORDER_SUCCESS(0,"创建订单成功"),

    /*
     * token
     */

    BOX_LUNCH_NOT_EXIST(40007,"商品不存在"),
    //token
    TOKEN_INVALID(90001,"非法访问,违法必究"),
    TOKEN_FORMAT_ERROR(90002,"token无效,请登陆后重试"),

    /*
     * 收货地址
     */
    ADD_ADDRESSES(60001, "添加收货地址失败"),
    ELEBEN_BITS_PHONE(60002, "请输入11位的手机号码！"),
    PHONE_FORMAT_ERROR(60003, "手机号格式错误！"),
    ADD_DISTRIBUTION_POINT_FAIL(60004,"新增配送点失败"),
    ADDRESS_ALREADY_EXIST(60005,"该配送点已存在"),

    /*
     * 红包模块
     */
    CREATE_REDPACKETS_ERRO(50001,"创建红包失败"),
    REDPACKETS_LIST_EMPTY(50002,"红包列表为空"),

    /*
     * 用户建议模块
     */
    SUBMIT_ADVISE_FAIL(60001,"提交建议失败"),
    VIEW_ADVISE_FAIL(60002,"查看用户建议列表失败"),
    SUBMIT_TIMES_OVER(60003,"您今日的提交次数已达上限，感谢您的建议!"),
    CONTENT_SIZE_OVER(60004,"您输入字数超出限制,最多只能输入200字哦亲!"),
    CONTENT_EMPTY(60005,"您的输入内容为空,请输入内容后再提交"),
    BIND_USER_PHONE_SUCCESS(0,"绑定手机号成功"),
    UPDATE_USER_INFO_SUCCESS(0,"更新用户信息成功"),
    UPDATE_USER_INFO_FAILED(60006,"更新用户信息失败"),


    /**
     * 盒饭模块
     */
    BOX_LUNCH_NAME_CONTENT_SIZE_OVER(70001, "名称字数超出上限!"),
    BOX_LUNCH_SKU_IS_NULL(70002, "请选择套餐规格!"),
    FOODS_IS_NULL(70003, "请载入商品!"),
    SKU_NAME_CONTENT_SIZE_OVER(70004, "规格套餐名称字数超出上限!"),
    FOOD_TYPE_DESC_CONTENT_SIZE_OVER(70005, "类型描述字数超出上限!")
    ;


    private Integer code;
    private String msg;

    ExceptionEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
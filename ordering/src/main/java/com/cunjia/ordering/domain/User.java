package com.cunjia.ordering.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.Date;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class User {
    @ApiModelProperty(value = "id主键", required = true)
    protected Integer userId;
    @ApiModelProperty(value = "用户名称", required = true)
    private String userName;

    private String userNickname;

    private String userPassword;

    private String userPhone;

    private String userAvatarUrl;

    private Integer userSex;

    private Integer userAge;

    private Date userCreateTime;

    private Integer userStatus;

    private Date userLastLoginTime;

    private String userToken;

    private String userWxOpenid;

    private Integer shopId;

    @NotEmpty(groups = WeChatLogin.class)
    private String userWxCode;

    public interface WeChatLogin{

    }
}
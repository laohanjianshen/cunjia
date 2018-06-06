package com.cunjia.ordering.domain;

import lombok.Data;

import javax.validation.constraints.*;
import java.util.Date;

/**
 * 用户建议
 */

@Data
public class UserAdvise {
    private Integer id;

    private Integer userId;

    private Date advisePutTime;
    @NotBlank(message = "亲爱的,建议内容不能为空哦!")
    @Size(max = 200,message ="亲爱的,您输入的字数超出限制了,最多只能输入200个字哦!" )
    private String content;

}
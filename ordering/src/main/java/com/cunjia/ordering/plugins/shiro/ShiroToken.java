package com.cunjia.ordering.plugins.shiro;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.apache.shiro.authc.UsernamePasswordToken;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
public class ShiroToken extends UsernamePasswordToken {
    private static final long serialVersionUID = 4759692267927548118L;
    private Integer userId;

    private Integer shopId;

    private String userToken;// ShiroToken字符串

    private Timestamp timestamp;// 时间戳(用于验证token和重新获取token)

    public long getLongTime() {
        if (timestamp != null) {
            return timestamp.getTime();
        }
        return 0;
    }

}

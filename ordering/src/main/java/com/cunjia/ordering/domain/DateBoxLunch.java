package com.cunjia.ordering.domain;

import lombok.Data;

@Data
public class DateBoxLunch {
    //自增id
    private Integer id;
    //盒饭id
    private Integer dateBoxLunchId;
    //日期时间戳
    private Long dateTimestamp;
}
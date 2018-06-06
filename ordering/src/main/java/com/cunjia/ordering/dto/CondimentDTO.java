package com.cunjia.ordering.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 调料包 DTO
 */
@Data
public class CondimentDTO {
    //调料包id
    private Integer condimentId;
    //调料包名称
    private String condimentName;
    //调料包状态 0、未上架，1、上架中，2、折扣中，3、已售完
    private Integer condimentStatus;
    //调料包价格
    private BigDecimal condimentPrice;
}

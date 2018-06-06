package com.cunjia.ordering.domain;

import lombok.Data;

import java.util.Date;

/**
 * 分享红包记录表
 */
@Data
public class RedPacketShareRecords {
    private Integer sharingRecordId;//id
    private Integer userId;//用户id
    private Date sharingRecordDate;//分享时间
    private String sharingRecord;//分享标识
    private Integer sharingRecordType;//分享类型1=小程序分享得红包 2=红包分享得红包
}

package com.cunjia.ordering.service;

import com.cunjia.ordering.domain.RedPacketShareRecords;
import com.cunjia.ordering.vo.RedPacketUserVO;

import java.util.List;

public interface RedPacketUserService {
    Integer insertRedPacketUser(RedPacketUserVO redPacketUserVO);//新增红包
    List<RedPacketUserVO> listNotExpiredRedPacket(RedPacketUserVO redPacketUserVO);//获取未过期的红包
    List<RedPacketUserVO> listIsExpiredRedPacket(RedPacketUserVO redPacketUserVO);//获取过期的红包 根据时间排序  只取前20条
    RedPacketShareRecords getRedPacketShareRecords(Integer userId);//根据用户id、分享时间以及分享标识获取数据 判断是否是首次分享
    Integer insertRedPacketShareRecord(RedPacketShareRecords redPacketShareRecords);//新增分享记录
}

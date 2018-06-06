package com.cunjia.ordering.dao;

import com.cunjia.ordering.domain.RedPacketUser;
import com.cunjia.ordering.domain.RedPacketShareRecords;
import com.cunjia.ordering.vo.RedPacketUserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RedPacketUserMapper {
    Integer insertRedPacketUser(RedPacketUserVO redPacketUserVO);//新增红包
    @Select("SELECT red_packet_id,red_packet_price,red_packet_get_time,red_packet_type FROM `red_packet_user` WHERE user_id = #{userId} AND red_packet_is_expired = 0 AND red_packet_is_used = 0 ORDER BY red_packet_price DESC")
    List<RedPacketUser> listNotExpiredRedPacket(RedPacketUserVO redPacketUserVO);//获取未过期的红包
    @Select("SELECT red_packet_id,red_packet_price,red_packet_get_time,red_packet_type FROM `red_packet_user` WHERE user_id = #{userId}" +
            " AND red_packet_is_expired = 1  AND red_packet_is_used = 0 AND PERIOD_DIFF( DATE_FORMAT( NOW( ) , '%Y%m' ) , DATE_FORMAT( red_packet_get_time, '%Y%m' ) ) =1 ORDER BY red_packet_get_time DESC LIMIT 20")
    List<RedPacketUser> listIsExpiredRedPacket(RedPacketUserVO redPacketUserVO);//获取上月过期的红包 根据时间排序  只取前20条
    @Select("SELECT sharing_record_id FROM `red_packet_share_records` WHERE user_id = #{userId} AND sharing_record_date = CURDATE() AND  sharing_record_type = 1 LIMIT 1")
    RedPacketShareRecords getRedPacketShareRecords(Integer userId);//根据用户id、分享时间以及分享标识获取数据 判断是否是首次分享

    Integer insertRedPacketShareRecord(RedPacketShareRecords redPacketShareRecords);//新增分享记录
}

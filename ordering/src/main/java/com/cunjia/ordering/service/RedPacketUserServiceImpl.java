package com.cunjia.ordering.service;

import com.cunjia.ordering.dao.RedPacketUserMapper;
import com.cunjia.ordering.domain.RedPacketShareRecords;
import com.cunjia.ordering.vo.RedPacketUserVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RedPacketUserServiceImpl implements RedPacketUserService {
    @Autowired
    private RedPacketUserMapper redPacketUserMapper;

    /**
     * 新增红包
     *
     * @param redPacketUserVO 红包用户表
     * @return int
     */
    @Override
    public Integer insertRedPacketUser(RedPacketUserVO redPacketUserVO) {
        return redPacketUserMapper.insertRedPacketUser(redPacketUserVO);
    }

    /**
     * 获取未过期 未使用的红包 并根据金额排序
     *
     * @param redPacketUserVO 用户红包VO
     * @return json
     */
    @Override
    public List<RedPacketUserVO> listNotExpiredRedPacket(RedPacketUserVO redPacketUserVO) {
        List<RedPacketUserVO> list = new ArrayList<>();
        redPacketUserMapper.listNotExpiredRedPacket(redPacketUserVO).forEach(r -> {
            RedPacketUserVO rp = new RedPacketUserVO();
            BeanUtils.copyProperties(r, rp);
            list.add(rp);
        });
        return list;
    }

    /**
     * 获取已过期 未使用的红包 根据获取时间排序并只取20条数据
     *
     * @param redPacketUserVO 用户红包VO
     * @return json
     */
    @Override
    public List<RedPacketUserVO> listIsExpiredRedPacket(RedPacketUserVO redPacketUserVO) {
        List<RedPacketUserVO> list = new ArrayList<>();
        redPacketUserMapper.listIsExpiredRedPacket(redPacketUserVO).forEach(r ->{
            RedPacketUserVO rp = new RedPacketUserVO();
            BeanUtils.copyProperties(r, rp);
            list.add(rp);
        });
        return list;
    }

    /**
     * 根据用户id、分享时间以及分享标识获取数据 判断是否是首次分享
     * @param userId 用户id
     * @return json
     */
    @Override
    public RedPacketShareRecords getRedPacketShareRecords(Integer userId) {
        return redPacketUserMapper.getRedPacketShareRecords(userId);
    }

    /**
     * 新增红包分享记录
     * @param redPacketShareRecords 分享记录表
     * @return int
     */
    @Override
    public Integer insertRedPacketShareRecord(RedPacketShareRecords redPacketShareRecords) {
        return redPacketUserMapper.insertRedPacketShareRecord(redPacketShareRecords);
    }
}

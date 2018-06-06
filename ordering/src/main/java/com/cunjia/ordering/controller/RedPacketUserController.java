package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.RedPacketShareRecords;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.RedPacketUserService;
import com.cunjia.ordering.utils.RedPacketUtil;
import com.cunjia.ordering.vo.RedPacketUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.math.BigDecimal;

@RestController
@RequestMapping("redPacketUser")
public class RedPacketUserController extends BaseController {
    @Autowired
    RedPacketUserService redPacketUserService;



    /**
     * 获取未过期红包
     *
     * @param token 验证 并 获取用户id
     * @return json
     */
    @PostMapping("listNotExpiredRedPacket")
    public Result listNotExpiredRedPacket(@Validated ShiroToken token) {
        validateToken(token);
        return ResultUtil.success(redPacketUserService.listNotExpiredRedPacket(new RedPacketUserVO(token.getUserId())));
    }

    /**
     * 获取过期红包
     *
     * @param token 验证 并 获取用户id
     * @return json
     */
    @PostMapping("listIsExpiredRedPacket")
    public Result listIsExpiredRedPacket(@Validated ShiroToken token) {
        validateToken(token);
        return ResultUtil.success(redPacketUserService.listIsExpiredRedPacket(new RedPacketUserVO(token.getUserId())));
    }

    /**
     * 新增分享记录
     * @param redPacketShareRecords 分享记录表
     * @return json
     */
    @Transactional
    @PostMapping("insertRedPackerShareRecords")
    public Result insertRedPackerShareRecords(@Validated RedPacketShareRecords redPacketShareRecords, @Validated ShiroToken token) {
        validateToken(token);
        if (redPacketUserService.getRedPacketShareRecords(token.getUserId()) != null) {//首次分享
            /**
             * 分享小程序
             */
            redPacketShareRecords.setUserId(token.getUserId());
            redPacketShareRecords.setSharingRecordType(Constants.ONE);
            if (redPacketUserService.insertRedPacketShareRecord(redPacketShareRecords) > Constants.ZERO) {

                BigDecimal redPacketPrice = RedPacketUtil.getPraiseRedPacket(Constants.TWO);//随机红包金额
                /**
                 * 随机获取红包，并新增用户红包表
                 */
                redPacketUserService.insertRedPacketUser(new RedPacketUserVO(token.getUserId(), redPacketPrice, Constants.THREE));
                return ResultUtil.success(redPacketPrice);
            }
        }
        return ResultUtil.success();//非首次分享
    }
}

package com.cunjia.ordering.controller;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.base.exception.ExceptionEnum;
import com.cunjia.ordering.base.exception.Result;
import com.cunjia.ordering.base.exception.ResultUtil;
import com.cunjia.ordering.domain.*;
import com.cunjia.ordering.dto.CommentFirstLevelDTO;
import com.cunjia.ordering.dto.GoodsDescribeDTO;
import com.cunjia.ordering.plugins.censor.SensitivewordFilter;
import com.cunjia.ordering.plugins.shiro.ShiroToken;
import com.cunjia.ordering.service.CommentFirstLevelService;
import com.cunjia.ordering.service.CommentSecondLevelService;
import com.cunjia.ordering.service.RedPacketUserService;
import com.cunjia.ordering.utils.CommentUtil;
import com.cunjia.ordering.utils.RedPacketUtil;
import com.cunjia.ordering.vo.CommentFirstLevelVO;
import com.cunjia.ordering.vo.GoodsDescribeVO;
import com.cunjia.ordering.vo.RedPacketUserVO;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/commentFirstLevel")
public class CommentFirstLevelController extends BaseController {
    @Autowired
    private CommentFirstLevelService commentFirstLevelService;
    @Autowired
    private CommentSecondLevelService commentSecondLevelService;
    @Autowired
    private RedPacketUserService redPacketUserService;

    /**
     * 获取商品描述
     *
     * @return json
     * @auther hyf
     */
    @GetMapping("/listGoodsDescribe")
    public Result listGoodsDescribe(@Validated ShiroToken token) {
        validateToken(token);
        return ResultUtil.success(commentFirstLevelService.listGoodsDescribe());
    }


    /**
     * 新增一级评价
     *
     * @param commentFirstLevelDTO 一级评价表
     * @param comment              评价描述json字符串
     * @return json
     * @auther hyf
     */
    @PostMapping("/insertCommentFirstLevel")
    @Transactional
    public Result insertCommentFirstLevel(@Validated CommentFirstLevelDTO commentFirstLevelDTO, @Validated String comment, @Validated ShiroToken token) {
        validateToken(token);
        if (StringUtils.isNotBlank(comment)) {
            commentFirstLevelDTO.setList((List) JSONArray.toCollection(JSONArray.fromObject(comment), GoodsDescribeDTO.class));
        }
        if (StringUtils.isNotBlank(commentFirstLevelDTO.getCommentDetail()) && commentFirstLevelDTO.getCommentDetail().length() > Constants.SIXTY) {//限制评论字数不能超过60
            commentFirstLevelDTO.setCommentDetail(commentFirstLevelDTO.getCommentDetail().substring(Constants.ZERO, Constants.SIXTY));
        }
        commentFirstLevelDTO.setUserId(token.getUserId());
        SensitivewordFilter sensitivewordFilter = new SensitivewordFilter();
        commentFirstLevelDTO.setCommentDetail(sensitivewordFilter.replaceSensitiveWord(commentFirstLevelDTO.getCommentDetail(),2,"*"));
        if (commentFirstLevelService.insertCommentFirstLevel(commentFirstLevelDTO) > Constants.ZERO) {
            /**
             * 评论成功 获取随机红包
             */
            BigDecimal redPacketPrice = RedPacketUtil.getCommentRedPacket();//随机红包金额
            redPacketUserService.insertRedPacketUser(new RedPacketUserVO(token.getUserId(), redPacketPrice, Constants.ONE));
            return ResultUtil.success(redPacketPrice);
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 新增二级评论
     *
     * @param commentSecondLevelDO 二级评论
     * @return json
     * @auther hyf
     */
    @PostMapping("/insertCommentSecondLevel")
    public Result insertCommentSecondLevel(@Validated CommentSecondLevelDO commentSecondLevelDO, @Validated ShiroToken token) {
        validateToken(token);
        if (commentSecondLevelDO.getCommentDetail().length() > Constants.SIXTY) {
            commentSecondLevelDO.setCommentDetail(commentSecondLevelDO.getCommentDetail().substring(Constants.ZERO, Constants.SIXTY));
        }
        commentSecondLevelDO.setUserId(token.getUserId());
        SensitivewordFilter sensitivewordFilter = new SensitivewordFilter();
        commentSecondLevelDO.setCommentDetail(sensitivewordFilter.replaceSensitiveWord(commentSecondLevelDO.getCommentDetail(),2,"*"));
        if (commentSecondLevelService.insertCommentSecondLevel(commentSecondLevelDO) > Constants.ZERO) {
            synchronized (this){
                commentFirstLevelService.increaseCommentNumber(commentSecondLevelDO.getCommentFirstLevelId());//新增二级评论成功 把评论数量+1
            }
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 分组商品描述并统计
     *
     * @param commentFirstLevelDTO 一级评价表
     * @return json
     * @auther hyf
     */
    @PostMapping("/SumGoodsDescribe")
    public Result listSumGoodsDescribe(@Validated CommentFirstLevelDTO commentFirstLevelDTO, @Validated ShiroToken token) {
        validateToken(token);
        if (CommentUtil.ifNull(commentFirstLevelDTO)) {
            return ResultUtil.error(ExceptionEnum.PARAM_IS_NULL);
        }
        List<GoodsDescribeVO> resultList = new ArrayList<>();
        List<CommentFirstLevelVO> list = commentFirstLevelService.listAllCommentFirstLevel(commentFirstLevelDTO);
        GoodsDescribeVO gdv = new GoodsDescribeVO(Constants.ONE, "好评", Constants.ZERO);
        GoodsDescribeVO gdv1 = new GoodsDescribeVO(Constants.TWO, "差评", Constants.ZERO);
        for (CommentFirstLevelVO c : list) {
            if (c.getTotalEvaluate() > Constants.ONE) {//好评
                gdv.setSumNumber(gdv.getSumNumber() + Constants.ONE);
            } else {//差评
                gdv1.setSumNumber(gdv1.getSumNumber() + Constants.ONE);
            }
        }
        resultList.add(gdv);
        resultList.add(gdv1);
        resultList.addAll(commentFirstLevelService.listSumGoodsDescribe(commentFirstLevelDTO));
        return ResultUtil.success(resultList);
    }

    /**
     * 获取评价列表
     *
     * @param commentFirstLevelDTO 一级评价表
     * @return json
     * @auther hyf
     */
    @PostMapping("/listCommentFirstLevel")
    public Result listCommentFirstLevel(@Validated CommentFirstLevelDTO commentFirstLevelDTO, @Validated ShiroToken token) {
        validateToken(token);
        if (CommentUtil.ifNull(commentFirstLevelDTO)) {
            return ResultUtil.error(ExceptionEnum.PARAM_IS_NULL);
        }
        List<CommentFirstLevelVO> list;
        if (commentFirstLevelDTO.getGoodsDescribeId() != null) {//根据评价描述id获取评价列表
            list = commentFirstLevelService.listCommentFirstLevelByDescribeId(commentFirstLevelDTO);
        } else {//获取该商品下的所有评价列表
            //list = commentFirstLevelService.listCommentFirstLevel(commentFirstLevelDTO);
            list = commentFirstLevelService.listCommentFirstLevelByDescribeId(commentFirstLevelDTO);
        }
        Map<Integer, Integer> praisesMap = commentFirstLevelService.listCommentPraise(token.getUserId())
                .stream().collect(Collectors.toMap(CommentPraise::getCommentFirstLevelId, CommentPraise::getCommentFirstLevelId));//已点赞的一级评论id
        /**
         * 根据评价id 查询总点赞数量 并把结果生成Map
         */
        Map<Integer, Integer> praiseMap = CommentUtil.getMap(commentFirstLevelService.listPraiseNumber(CommentUtil.getIdList(list)));
        return ResultUtil.success(CommentUtil.resultList(list, praiseMap, praisesMap));
    }

    /**
     * 获取口味和包装的平均值
     *
     * @param commentFirstLevelDTO
     * @return json
     * @auther hyf
     */
    @PostMapping("/listFlavorAndPacking")
    public Result listFlavorAndPacking(@Validated CommentFirstLevelDTO commentFirstLevelDTO, @Validated ShiroToken token) {
        validateToken(token);
        if (CommentUtil.ifNull(commentFirstLevelDTO)) {
            return ResultUtil.error(ExceptionEnum.PARAM_IS_NULL);
        }
        return ResultUtil.success(CommentUtil.getAverage(commentFirstLevelService.listFlavorAndPacking(commentFirstLevelDTO)));
    }

    /**
     * 对一级评论点赞
     *
     * @param commentPraise 点赞记录表
     * @return json
     */
    @PostMapping("/insertCommentPraise")
    public Result insertCommentPraise(@Validated CommentPraise commentPraise, @Validated ShiroToken token) {
        validateToken(token);
        commentPraise.setUserId(token.getUserId());
        /**
         * 查询点赞记录表是否存在,如果存在 修改状态为已点赞
         */
        if (commentFirstLevelService.updateCommentPraiseStatus(commentPraise) > Constants.ZERO) {
            synchronized (this){
                commentFirstLevelService.increasePraiseNumber(commentPraise.getCommentFirstLevelId());//点赞成功 把点赞数量+1
            }
            return ResultUtil.success();
        }
        /**
         * 新增点赞记录
         */
        if (commentFirstLevelService.insertCommentPraise(commentPraise) > Constants.ZERO) {
            /**
             * 点赞成功 获取随机红包
             */
            BigDecimal redPacketPrice = RedPacketUtil.getPraiseRedPacket(Constants.ONE);//随机红包金额
            if (redPacketPrice != null) {
                redPacketUserService.insertRedPacketUser(new RedPacketUserVO(token.getUserId(), redPacketPrice, Constants.TWO));
            }
            synchronized (this){
                commentFirstLevelService.increasePraiseNumber(commentPraise.getCommentFirstLevelId());//点赞成功 把点赞数量+1
            }
            return ResultUtil.success(redPacketPrice);
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }

    /**
     * 取消点赞
     *
     * @param commentPraise 点赞记录表
     * @return json
     */
    @PostMapping("/updateCommentPraise")
    public Result updateCommentPraise(@Validated CommentPraise commentPraise, @Validated ShiroToken token) {
        validateToken(token);
        commentPraise.setUserId(token.getUserId());
        if (commentFirstLevelService.updateCommentPraise(commentPraise) > Constants.ZERO) {
            synchronized (this){
                commentFirstLevelService.decreasePraiseNumber(commentPraise.getCommentFirstLevelId());//点赞成功 把点赞数量-1
            }
            return ResultUtil.success();
        }
        return ResultUtil.error(ExceptionEnum.OPERATION_FAIL);
    }
}

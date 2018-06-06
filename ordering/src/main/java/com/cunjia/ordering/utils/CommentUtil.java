package com.cunjia.ordering.utils;

import com.cunjia.ordering.base.Constants;
import com.cunjia.ordering.domain.CommentFirstLevelDO;
import com.cunjia.ordering.dto.CommentFirstLevelDTO;
import com.cunjia.ordering.vo.CommentFirstLevelVO;
import org.apache.commons.collections4.CollectionUtils;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/**
 * 评价模块util
 */
public class CommentUtil {
    static final MathContext mc = new MathContext(2, RoundingMode.CEILING);//保留2位小数，向上取整

    /**
     * 验证参数是否为null
     *
     * @param commentFirstLevelDTO
     * @return
     */
    public static Boolean ifNull(CommentFirstLevelDTO commentFirstLevelDTO) {
        return commentFirstLevelDTO.getGoodsId() == null || commentFirstLevelDTO.getCommentSource() == null ? true : false;
    }

    /**
     * 获取包装和口味平均值、百分比、好评度百分比
     * 口味和包装平均值计算方式：
     * 口味和包装：星级求和 / 评论的人数 = 平均值 并向上取整
     * 口味和包装百分比：星际平均值 / 总星际（5） * 100 = 百分比
     * 好评度：总评价的星际>1 的为好评  好评数/评论数 * 100 = 好评度百分比
     *
     * @param list 获取评论的总包装和口味
     * @return 计算好的包装和口味平均值
     */
    public static CommentFirstLevelVO getAverage(List<CommentFirstLevelDO> list) {
        CommentFirstLevelVO cfv = new CommentFirstLevelVO();
        if (CollectionUtils.isNotEmpty(list)) {
            double sumFlavor = 0, sumPacking = 0;
            Integer listSize = list.size(), PraiseTotalEvaluate = 0;

            for (CommentFirstLevelDO c : list) {
                sumFlavor += c.getFlavor();
                sumPacking += c.getPacking();
                if (c.getTotalEvaluate() > Constants.ONE) {// >1 的为好评
                    ++PraiseTotalEvaluate;
                }
            }
            cfv.setAverageFlavor((int) Math.ceil(sumFlavor / listSize));//口味
            cfv.setAveragePacking((int) Math.ceil(sumPacking / listSize));//包装
            cfv.setPercentageTotalEvaluate(new BigDecimal(PraiseTotalEvaluate).divide(new BigDecimal(listSize), mc).multiply(new BigDecimal(100)));//好评度百分比
            cfv.setPercentageFlavor(new BigDecimal(cfv.getAverageFlavor()).divide(new BigDecimal(Constants.FIVE), mc).multiply(new BigDecimal(100)));//口味百分比
            cfv.setPercentagePacking(new BigDecimal(cfv.getAveragePacking()).divide(new BigDecimal(Constants.FIVE), mc).multiply(new BigDecimal(100)));//包装百分比
            cfv.setCommentNumber(listSize);//一级评论数量
        }
        return cfv;
    }

    /**
     * 获取评价列表的id, 根据id获取已评价的数量
     *
     * @param list
     * @return list
     */
    public static List<Integer> getIdList(List<CommentFirstLevelVO> list) {
        return list.stream().map(CommentFirstLevelVO::getCommentFirstLevelId).collect(Collectors.toList());
    }

    /**
     * 获取map key id , value PraiseNumber
     *
     * @param list
     * @return map
     */
    public static Map<Integer, Integer> getMap(List<CommentFirstLevelDO> list) {
        if (CollectionUtils.isNotEmpty(list)) {
            return list.stream().collect(Collectors.toMap(CommentFirstLevelDO::getCommentFirstLevelId, CommentFirstLevelDO::getPraiseNumber));
        }
        return null;
    }

    /**
     * set评论总数量 并且 根据id set PraiseNumber（点赞数量）
     *
     * @param list
     * @param map
     * @return list
     */
    public static List<CommentFirstLevelVO> resultList(List<CommentFirstLevelVO> list, Map<Integer, Integer> map, Map<Integer, Integer> praisesMap) {
        return list.stream().peek(c -> {
            if (map != null && map.containsKey(c.getCommentFirstLevelId())) {
                c.setPraiseNumber(map.get(c.getCommentFirstLevelId()));//获取点赞总数量
            }
            c.setSumCommentNumber(c.getCommentSecondLevelList().size());//获取评论总数量
            /**
             * 判断是否对该一级评论进行了点赞
             */
            if (praisesMap.containsKey(c.getCommentFirstLevelId())) {
                c.setIsPraise(Constants.ONE);
            } else {
                c.setIsPraise(Constants.ZERO);
            }
        }).collect(Collectors.toList());
    }


    /**
     * 验证手机号码
     *
     * @param phone 手机号
     * @return 验证结果 true false
     */
    public static Boolean validatePhone(String phone) {
        Pattern p = Pattern.compile(Constants.PHONE_REGEX);
        Matcher m = p.matcher(phone);
        return m.matches();
    }


    public static void main(String[] args) {
        Map<Integer, Integer> map = new HashMap<>();
        System.out.println(!map.isEmpty());
        System.out.println(map.containsKey(552));
    }

}

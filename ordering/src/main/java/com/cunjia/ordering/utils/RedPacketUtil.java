package com.cunjia.ordering.utils;

import com.cunjia.ordering.base.Constants;
import lombok.extern.slf4j.Slf4j;

import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Properties;

/**
 * 红包获取规则
 */
@Slf4j
public class RedPacketUtil {
    private static Properties dataSourceSettings;
    private static Double redPacketMoneyMax;//红包最大金额
    private static Double redPacketMoneyMin;//红包最小金额
    private static Double redPacketMoneyMiddleValue;//中间红包金额
    private static Integer minMiddleValueProbability;//最小红包金额 - 中间红包金额的获取几率
    private static Integer maxMiddleValueProbability;//最大红包金额 - 中间红包金额的获取几率
    private static Double praiseMaxRedPacket;//点赞获取的最大红包金额
    private static Double praiseMinRedPacket;//点赞获取的最小红包金额
    private static Integer praiseGetRedPackerProbability;//点赞获取红包的概率
    public static Integer luckyNumber = 5;//点赞幸运数字  每天会随机挑选 0 - 9
    private static Double random;//随机数

    static {
        dataSourceSettings = new Properties();
        InputStream in = RedPacketUtil.class.getClassLoader().getResourceAsStream("application.properties");
        try {
            dataSourceSettings.load(in);
            in.close();
            redPacketMoneyMax = Double.parseDouble(dataSourceSettings.getProperty("red_packet_money_max"));//红包最大金额
            redPacketMoneyMin = Double.parseDouble(dataSourceSettings.getProperty("red_packet_money_min"));//红包最小金额
            redPacketMoneyMiddleValue = Double.parseDouble(dataSourceSettings.getProperty("red_packet_money_middle_value"));//中间红包金额
            minMiddleValueProbability = Integer.parseInt(dataSourceSettings.getProperty("min_middle_value_probability"));//最小红包金额 - 中间红包金额的获取几率
            maxMiddleValueProbability = Integer.parseInt(dataSourceSettings.getProperty("max_middle_value_probability"));//最大红包金额 - 中间红包金额的获取几率
            praiseMaxRedPacket = Double.parseDouble(dataSourceSettings.getProperty("praise_max_red_packet"));//点赞获取的最大红包金额
            praiseMinRedPacket = Double.parseDouble(dataSourceSettings.getProperty("praise_min_red_packet"));//点赞获取的最小红包金额
            praiseGetRedPackerProbability = Integer.parseInt(dataSourceSettings.getProperty("praise_get_red_packer_probability"));//点赞获取红包的概率
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        } finally {
            dataSourceSettings.clone();
        }
    }

    /**
     * 获取评论红包
     * 金额范围 1.7 - 6.8元
     * 1.7-5.3元获取概率为50%
     * 5.3-6.8元获取概率为50%
     *
     * @return 保留2位数的随机金额
     */
    private static int commentMin = Constants.ZERO;
    private static int commentMax = Constants.ZERO;

    public static BigDecimal getCommentRedPacket() {
        if (commentMin + commentMax >= minMiddleValueProbability + maxMiddleValueProbability) {
            commentMin = Constants.ZERO;
            commentMax = Constants.ZERO;
        }

        while (true) {
            random = Math.random() * redPacketMoneyMax; //随机生成的金额最大为红包的最大金额  Math.random()：随机数生成不包含0、1 也就是说永远不会出现最大的红包金额
            if (random < redPacketMoneyMin) {//随机金额小于 最小红包金额
                continue;
            }
            if (commentMin < minMiddleValueProbability && random <= redPacketMoneyMiddleValue) {
                ++commentMin;
                break;
            }

            if (commentMax < maxMiddleValueProbability && random > redPacketMoneyMiddleValue) {
                ++commentMax;
                break;
            }
        }
        return new BigDecimal(random).setScale(Constants.TWO, RoundingMode.DOWN);
    }

    /**
     * 获取点赞红包
     * 金额：1.7-5.3
     * 概率10%
     *
     * 获取分享红包
     * 金额：1.7-5.3
     * 概率 首次100%
     * @param type 1 = 点赞 2= 分享
     * @return 获取的随机金额
     */
    private static int praiseNumber = Constants.ZERO;

    public static BigDecimal getPraiseRedPacket(int type) {
        if (type == Constants.ONE && praiseNumber >= praiseGetRedPackerProbability) {
            praiseNumber = Constants.ZERO;
        }
        if (type == Constants.TWO || praiseNumber == luckyNumber) {
            while (true) {
                random = Math.random() * praiseMaxRedPacket; //随机生成的金额最大为红包的最大金额  Math.random()：随机数生成不包含0、1 也就是说永远不会出现最大的红包金额
                if (random >= praiseMinRedPacket) {//随机金额>=最小金额 直接返回
                    ++praiseNumber;
                    return new BigDecimal(random).setScale(Constants.TWO, RoundingMode.DOWN);//保留2位小数 向下取整
                }
            }
        }
        ++praiseNumber;
        return null;
    }

}

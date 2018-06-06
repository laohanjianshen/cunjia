package com.cunjia.ordering.config;

import com.cunjia.ordering.utils.RedPacketUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
@Slf4j
public class SpringBootTimer {
    @Scheduled(cron = "59 59 23 * * ?") //每天23点59分59秒执行
    public void fun () {
        /**
         * 每天刷新点赞幸运数字
         */
        RedPacketUtil.luckyNumber = new Random().nextInt(10);
    }
}

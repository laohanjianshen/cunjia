package com.cunjia.ordering.utils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.logging.SimpleFormatter;

/**
 * java8 日期时间操作工具类
 * @auther xpc 252645816@qq.com
 * @date 2018/5/7 13:43
 */
public class TimeUtils {
    /**
     * 把Date类型时间戳转成Java8的localdate类型
     */
    public static LocalDate timeStamp2LocalDate(Date timeStamp){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedTime = simpleDateFormat.format(timeStamp);
        return LocalDate.parse(formattedTime);
    }

    /**
     * 检查两个日期之间间隔多少天
     */
    public static int countDays(LocalDate putDate){
        LocalDate nowDate = LocalDate.now();
        Long Days = ChronoUnit.DAYS.between(putDate,nowDate);
        int countDays = Integer.parseInt(Days.toString());
        return countDays;
    }

    /**
     *把Long类型时间转成java8的localdate类型
     */
    public static LocalDate long2LocalDate(long time){
        Date date = new Date(time);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedTime = simpleDateFormat.format(date);
        return LocalDate.parse(formattedTime);
    }

    /**
     *long转localdateTime
     */
    public static LocalDateTime long2LocalDateTime(long time){
        Date date = new Date(time);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String formattedTime = simpleDateFormat.format(date);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return  LocalDateTime.parse(formattedTime,formatter);
    }

    /**
     *Localdatetime 处理过期1天
     */
    public static Boolean isExpire(long time){
      LocalDateTime nowTime = LocalDateTime.now();
      LocalDateTime addTime = long2LocalDateTime(time);
      System.out.println(addTime);
      int days = nowTime.compareTo(addTime);
      if (days>=1 || days>=0&&addTime.getHour()>=9){
          return true;
      }
        return false;
    }

    /**
     *处理优惠时间是否到期
     */
    public static Boolean discountIsExpire(long time){
        LocalDateTime nowTime = LocalDateTime.now();
        LocalDateTime discountTime = long2LocalDateTime(time);
        return nowTime.isAfter(discountTime);
    }

    public static void main(String[] args){
//        System.out.println(long2LocalDate(1526981600000l));
       System.out.println(long2LocalDateTime(1527569844000l));
//        System.out.println(isExpire(1526981600000l));
        System.out.println(discountIsExpire(1527569844000l));
    }
}

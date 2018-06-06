package com.cunjia.ordering.utils;

import com.cunjia.ordering.domain.Payment;
import com.cunjia.ordering.domain.ResultXML;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;


import java.util.Random;

/**
 * 支付工具类  hyf
 */
@Slf4j
public class PaymentUtil {

    private static final XStream xStream = new XStream(new DomDriver());
    private static final String ALLCHAR = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LETTERCHAR = "abcdefghijkllmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String paymentUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder";
    private static  StringBuffer sb = null;

    /**
     * 小程序支付
     *
     * @param payment
     */
    private static ResultXML appletPayment(Payment payment) {
        String getXml = sendXml(payment);//获取需要发送的xml：发送的数据组装成符合微信的XML格式的信息
        System.out.println("支付xml："+getXml);
        String result = HttpRequest.post(paymentUrl, getXml, "UTF-8");//发送xml，返回格式也是xml
        ResultXML rx = null;
        if(StringUtils.isNotBlank(result)) {
            rx= parseXml(result);//解析微信返回的xml格式的字符串
        }
        return rx;
    }

    /**
     * 获取支付需要发起的xml格式
     *
     * @param payment
     * @return
     */
    private static String sendXml(Payment payment) {
        StringBuffer xmlData=new StringBuffer();
        xmlData.append("<xml>");
        xmlData.append("<appid>"+payment.getAppid()+"</appid>");
        xmlData.append("<body>"+payment.getBody()+"</body>");
        xmlData.append("<mch_id>"+payment.getMchId()+"</mch_id>");
        xmlData.append("<nonce_str>"+payment.getNonceStr()+"</nonce_str>");
        xmlData.append("<notify_url>"+payment.getNotifyUrl()+"</notify_url>");
        xmlData.append("<out_trade_no>"+payment.getOutTradeNo()+"</out_trade_no>");
        xmlData.append("<spbill_create_ip>"+payment.getSpbillCreateIp()+"</spbill_create_ip>");
        xmlData.append("<total_fee>"+payment.getTotalFee()+"</total_fee>");
        xmlData.append("<trade_type>"+payment.getTradeType()+"</trade_type>");
        xmlData.append("<openid>"+payment.getOpenid()+"</openid>");
        xmlData.append("<sign>"+getSign(payment)+"</sign>");//获取签名
        xmlData.append("</xml>");
        return xmlData.toString();
    }

    /**
     * 获取sign
     * @param pay
     * @return
     */
    private static String getSign(Payment pay){
        sb = new StringBuffer();
        sb.append("appid=").append(pay.getAppid())
        .append("&body=").append(pay.getBody())
        .append("&mch_id=").append(pay.getMchId())
        .append("&nonce_str=").append(pay.getNonceStr())
        .append("&notify_url=").append(pay.getNotifyUrl())
        .append("&openid=").append(pay.getOpenid())
        .append("&out_trade_no=").append(pay.getOutTradeNo())
        .append("&spbill_create_ip=").append(pay.getSpbillCreateIp())
        .append("&total_fee=").append(pay.getTotalFee())
        .append("&trade_type=").append(pay.getTradeType());
        String sign = Md5Utils.encrypt(sb.toString()+"&key=75e8fc1f8ef59d3a00728437d46f0555").toUpperCase();//转换成大写
        System.out.println("sign:"+sign);
        return sign;
    }

    /**
     * 生成随机数：长度自己定义
     *
     * @param length
     * @return
     */
    private static String generateMixString(int length) {
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(ALLCHAR.charAt(random.nextInt(LETTERCHAR.length())));
        }
        System.out.println("调用随机生成字符串！");
        return sb.toString();
    }

    /**
     * 小程序支付：解析微信返回的信息
     * @param xml
     * @return
     */
    private static ResultXML parseXml(String xml) {
        log.info("开始解析微信返回的xml。。。。。。。。。。。使用XStream解析");
        xStream.alias("xml", ResultXML.class);
        return (ResultXML) xStream.fromXML(xml);
    }

    /**
     * 支付测试
     * @param args
     */
    public static void main(String[] args) {
        Payment pay = new Payment();
        pay.setAppid("wx2421b1c4370ec43b");
        pay.setBody("JSAPI支付测试");
        pay.setMchId("10000100");
        pay.setNonceStr("1add1a30ac87aa2db72f57a2375d8fec");
        pay.setNotifyUrl("http://wxpay.wxutil.com/pub_v2/pay/notify.v2.php");
        pay.setOutTradeNo("1415659990");
        pay.setSpbillCreateIp("14.23.150.211");
        pay.setTotalFee(1);
        pay.setTradeType("JSAPI");
        pay.setOpenid("oUpF8uMuAJO_M2pxb1Q9zNjWeS6o");
        ResultXML rx = appletPayment(pay);
        System.out.println(rx.getReturn_code()+"\n"+rx.getReturn_msg());
    }
}

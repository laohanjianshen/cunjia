package com.cunjia.ordering.controller;

import com.cunjia.ordering.domain.Payment;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 小程序支付 hyf
 */

public class PaymentController {


    public Object ApplePayment(@RequestBody Payment payment, HttpServletRequest request){

        return null;
    }
}

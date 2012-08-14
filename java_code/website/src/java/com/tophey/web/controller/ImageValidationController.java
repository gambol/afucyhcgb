/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageValidationController {

    @RequestMapping(value = "/validateImage")
    public void ValidateCaptchaImage(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        Boolean isResponseCorrect = Boolean.FALSE;
        //remenber that we need an id to validate!       

        String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        String kaptchaReceived = request.getParameter("kaptcha");
        if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected)) {
            isResponseCorrect = false;
        }

        System.out.println(isResponseCorrect);
        // httpServletResponse.encodeUrl("sucess.html");    
        if (isResponseCorrect.booleanValue()) {
            response.sendRedirect("success.html");
        } else {
            response.sendRedirect("failture.html");
        }
    }
}

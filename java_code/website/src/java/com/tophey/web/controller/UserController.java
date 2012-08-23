/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.model.User;
import com.tophey.web.common.EmailSenderDriver;
import com.tophey.web.common.UserBean;
import com.tophey.web.dao.UserDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tophey.utils.DateUtil;

/**
 *
 *
 * @author xiang.fu
 */
@Controller
@RequestMapping("/user")
public class UserController {

    // Invoked initially to create the "form" attribute
    // Once created the "form" attribute comes from the HTTP session (see @SessionAttributes)
    @ModelAttribute("userBean")
    public UserBean createFormBean() {
        return new UserBean();
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String form(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {

        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@Valid UserBean loginBean, BindingResult result,
            Model model) {

        if (result.hasErrors()) {

            System.err.println(result.toString() + "   " + (result.getAllErrors()).get(0).toString());
            return null;
        }

        String userEmail = loginBean.getUserEmail();
        String password = loginBean.getPassword();

        User user = new UserDao().getUserByEmail(userEmail);
        if (user == null) {
            model.addAttribute("mailErrMsg", "用户不存在");
            return "login";
        } else if (user.getUsername().equalsIgnoreCase(userEmail) && user.getPassword().equalsIgnoreCase(password)) {
            //TODO 处理session
            return "redirect:/mainPage.htm";
        } else {
            model.addAttribute("mailErrMsg", "用户名密码不正确");
            return "login";
        }

    }

    @RequestMapping(value = "regi", method = RequestMethod.GET)
    public String regiform(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {

        return "regi";
    }

    @RequestMapping(value = "regi", method = RequestMethod.POST)
    public String regi(@Valid UserBean loginBean, BindingResult result,
            Model model) {

        if (result.hasErrors()) {

            System.err.println(result.toString() + "   " + (result.getAllErrors()).get(0).toString());
            return null;
        }

        String userEmail = loginBean.getUserEmail();
        String password = loginBean.getPassword();
        UserDao userDao = new UserDao();
        User user = userDao.getUserByEmail(userEmail);
        if (user != null) {
            model.addAttribute("mailErrMsg", "用户已存在");
            return "regi";
        }
        user = new User();
        user.setUsername(userEmail);
        user.setPassword(password);
        user.setEmail(userEmail);
        user.setCreateDate(DateUtil.getCurrentTimestamp());

        userDao.addUser(user);
        //TODO session相关
        return "redirect:/mainPage.htm";
    }

    @RequestMapping(value = "forget", method = RequestMethod.GET)
    public String forgetGet(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {

        return "forget";
    }

    @RequestMapping(value = "forget", method = RequestMethod.POST)
    public String forget(@Valid UserBean loginBean, BindingResult result,
            Model model) {

        if (result.hasErrors()) {

            System.err.println(result.toString() + "   " + (result.getAllErrors()).get(0).toString());
            return null;
        }

        String userEmail = loginBean.getUserEmail();

        UserDao userDao = new UserDao();
        User user = userDao.getUserByEmail(userEmail);
        if (user == null) {
            model.addAttribute("mailErrMsg", "用户不存在");
            return "forget";
        }
        //先用简单的方法发送邮件
        try {
            EmailSenderDriver esd = new EmailSenderDriver();
            esd.setTo(userEmail, "fjfjfj");
            esd.setFrom("topheytest@163.com", "测试返馈");
            esd.setSubject("京都府");
            esd.setBody("<html>测试正文测试正文测试正文测试正文测试正文测试正文测试正文测试正文测试正文测试正文测试正文，密码是"+user.getPassword()+"</html>");
            esd.setSMTPHost("smtp.163.com", "topheytest@163.com", "winnie");
            esd.setSMTPPort(25);
            esd.setTimeout(1000 * 30);
//        esd.setSSLEnable();
            esd.sendMsg();
        } catch (Exception ex) {
            ex.printStackTrace();
            model.addAttribute("mailErrMsg", "发送失败，请重试");
        }
       
        //TODO session相关
        return "redirect:/mainPage.htm";
    }

    @RequestMapping("check")
    public @ResponseBody
    boolean check(HttpServletRequest request,
            HttpServletResponse response, Model model) {

        String userEmail = request.getParameter("userEmail");
        User user = new UserDao().getUserByEmail(userEmail);
        if (user == null) {
            return true;
        } else {
            return false;
        }

    }
    
    
    @RequestMapping("checki")
    public @ResponseBody
    boolean checki(HttpServletRequest request,
            HttpServletResponse response, Model model) {

        return !check(request, response, model);

    }
}

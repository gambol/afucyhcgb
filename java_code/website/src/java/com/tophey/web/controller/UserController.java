/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.model.User;
import com.tophey.web.common.LoginBean;
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
    @ModelAttribute("loginBean")
    public LoginBean createFormBean() {
        return new LoginBean();        
    }

    @RequestMapping(value="login",method = RequestMethod.GET)
    public String form(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        
        return "login";
    }

    @RequestMapping(value="login",method = RequestMethod.POST)
    public String login(@Valid LoginBean loginBean, BindingResult result,
            Model model) {

        if (result.hasErrors()) {
            
            System.err.println(result.toString() + "   " + (result.getAllErrors()).get(0).toString());
            return null;
        }
        
        String userEmail = loginBean.getUserEmail();
        String password = loginBean.getPassword();
        
        User user = new UserDao().getUserByEmail(userEmail);
        if(user == null){
            model.addAttribute("mailErrMsg", "用户不存在");
            return "login";
        }else if(user.getUsername().equalsIgnoreCase(userEmail) && user.getPassword().equalsIgnoreCase(password)){
            //TODO 处理session
            return"redirect:/mainPage.htm";
        }else{
            model.addAttribute("mailErrMsg", "用户名密码不正确");
            return "login";
        }
   
    }


    @RequestMapping("check")
    public @ResponseBody boolean check(HttpServletRequest request,
            HttpServletResponse response,Model model) {

        String userEmail = request.getParameter("userEmail");
        User user = new UserDao().getUserByEmail(userEmail);
        if(user == null){
            return true;
        }else{
            return false;
        }       

    }
}

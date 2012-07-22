/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author xiang.fu
 */
@Controller
@RequestMapping("/")
public class IndexController  {
    
    public IndexController() {
      
    }
    
    @RequestMapping("index.htm")
    public ModelAndView index(){
        return new ModelAndView("index");
    }
   
}

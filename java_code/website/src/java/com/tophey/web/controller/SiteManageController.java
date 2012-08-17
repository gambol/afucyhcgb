/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.common.PageResult;
import com.tophey.model.ServerInfo;
import com.tophey.web.common.PublishBean;
import com.tophey.web.dao.ServerDao;
import com.tophey.web.dao.ServerQuerier;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author zhenbao.zhou
 */

@Controller
@RequestMapping("/sitemanage")
public class SiteManageController {
    
    @RequestMapping(method = RequestMethod.GET)
    public String form(HttpServletRequest request, HttpServletResponse response, 
    Model model) throws ServletException, IOException {
        int userId = 1;
        try {
//            userId = (Integer)request.getAttribute("userId");

        } catch(Exception e) {
            e.printStackTrace();
            return "publish";
        }
        
       // int currentPage = offset/20 + 1;
        int currentPage = 1;
        String offset = request.getParameter("pager.offset");
        if (offset != null) {
            try {
                currentPage = Integer.parseInt(offset) / 20 + 1;
            } catch (Exception e) {
                
            }
        }
        // 查询db
        PageResult<ServerInfo> serverInfoResults = new ServerQuerier().getServerInfoByUserId(userId, currentPage);
        
        model.addAttribute("serverInfos", serverInfoResults);
        return "sitemanage";
    }
}

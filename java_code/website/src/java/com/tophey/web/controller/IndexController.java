/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.common.PageResult;
import com.tophey.common.ServerInfoDetail;
import com.tophey.model.Category;
import com.tophey.web.common.RankPageQuery;
import com.tophey.web.dao.CategoryDao;
import com.tophey.web.dao.ServerQuerier;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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

    public final static int PAGE_SIZE = 10;
    
    public IndexController() {
      
    }
    
    @RequestMapping("mainPage.htm")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Model model){
        ServerQuerier sq = new ServerQuerier();
        int categoryId = 1;
        String strCategoryId = request.getParameter("categoryId");
        try {
            categoryId = Integer.parseInt(strCategoryId);
        } catch (Exception e) {  }
        
        if (categoryId <= 0 || categoryId == 1) {
            categoryId = 1;
            strCategoryId = "1";
        }
        
        int offset = 0;
        try {
            offset = Integer.parseInt(request.getParameter("pager.offset"));
        } catch(Exception e) {
            System.out.println("null page");
//            e.printStackTrace();
        }
       
        
        int totalCount = sq.getServerCountByCategory(strCategoryId);
        List<ServerInfoDetail> retList = sq.getServerInfoDetailPageByCategory(strCategoryId, offset, PAGE_SIZE);
        int curPage = offset / PAGE_SIZE + 1;
        PageResult<ServerInfoDetail> serverInfoResults = new PageResult<ServerInfoDetail>(totalCount, curPage, PAGE_SIZE, retList);
        model.addAttribute("serverInfos", serverInfoResults);
        
        PageResult<Category> categoryResults = CategoryDao.getAllCategory();
        model.addAttribute("categorys", categoryResults);
        
        return new ModelAndView("mainPage");
    }
   
}

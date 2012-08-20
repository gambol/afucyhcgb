/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.common.PageResult;
import com.tophey.common.ServerInfoDetail;
import com.tophey.web.dao.ServerQuerier;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;

/**
 *
 * @author xiang.fu
 */
@Controller
@RequestMapping("/")
public class IndexController  {
    
    public IndexController() {
      
    }
    
    @RequestMapping("mainPage.htm")
    public ModelAndView index(Map<String,Object> model){
         ServerQuerier sq = new ServerQuerier();
//        int totalCount = sq.getServerCountByCategory(rpq.getCategoryId());
        int totalCount = sq.getServerCountByCategory("1");
//        List<ServerInfoDetail> retList = sq.getServerInfoDetailPageByCategory(rpq.getCategoryId(), rpq.getStart(),rpq.getSize());
        List<ServerInfoDetail> retList = sq.getServerInfoDetailPageByCategory("1", 0,50);
        int curPage = (0 +1 ) / 50;
        PageResult pr = new PageResult<ServerInfoDetail>(totalCount, curPage,50, retList);
        model.put("pageResult", pr);
        
        
        
        return new ModelAndView("mainPage",model);
    }
   
}

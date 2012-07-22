/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.common.PageResult;
import com.tophey.common.ServerInfoDetail;
import com.tophey.web.common.RankPageQuery;
import com.tophey.web.dao.ServerQuerier;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author xiang.fu
 */
@Controller
@RequestMapping("/rank/")
public class RankContentController {

    @RequestMapping(value = "rankPage.htm")
    public @ResponseBody
    PageResult<ServerInfoDetail> getRankPage(@RequestBody RankPageQuery rpq, HttpServletRequest request, HttpServletResponse response) {                
        ServerQuerier sq = new ServerQuerier();
        int totalCount = sq.getServerCountByCategory(rpq.getCategoryId());
        List<ServerInfoDetail> retList = sq.getServerInfoDetailPageByCategory(rpq.getCategoryId(), rpq.getStart(),rpq.getSize());
        int curPage = (rpq.getStart() +1 ) / rpq.getSize();
        return new PageResult<ServerInfoDetail>(totalCount, curPage, rpq.getSize(), retList);
        
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.model.ServerInfo;
import com.tophey.model.ServerSysInfo;
import com.tophey.web.common.PublishBean;
import com.tophey.web.dao.ServerDao;
import java.sql.Timestamp;
import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import tophey.utils.DateUtil;

/**
 * 用户主动发布站点
 *
 * @author zhenbao.zhou
 */
@Controller
@RequestMapping("/publish")
@SessionAttributes("publisBean")
public class PublishController {

    // 需要先判断用户是否登录
    public static HashMap NETWORK_MAP = new HashMap();

    static {
        NETWORK_MAP.put(0, "网通");
        NETWORK_MAP.put(1, "电信");
        NETWORK_MAP.put(2, "双线");
        NETWORK_MAP.put(3, "联通");
        NETWORK_MAP.put(4, "铁通");
    }
    // Invoked initially to create the "form" attribute
    // Once created the "form" attribute comes from the HTTP session (see @SessionAttributes)

    @ModelAttribute("publishBean")
    public PublishBean createFormBean() {
        return new PublishBean();
    }

    @RequestMapping(method = RequestMethod.GET)
    public void form() {
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processSubmit(@Valid PublishBean publishBean, BindingResult result,
            Model model) {

        if (result.hasErrors()) {
            return null;
        }

        ServerInfo server = new ServerInfo();
        server.setTitle(publishBean.getServer_name());
        server.setBannerUrl(publishBean.getBanner());
        server.setCategoryId(publishBean.getCategory());

        server.setLine(NETWORK_MAP.get(publishBean.getNetwork()).toString()); //TODO 我们需要将这个int 通过db转成string
        server.setName(publishBean.getServer_name());
        server.setUrl(publishBean.getUrl());

        server.setSiteFrom("atu");
        server.setCreateDate(DateUtil.getCurrentTimestamp());
        
        ServerDao.insert(server);

        String message = "私服发布成功, 私服url:" + server.getUrl();
        // Success response handling

        // prepare model for rendering success message in this request
        model.addAttribute("message", message);
        // 确认这个页面之后，需要跳转到哪个页面?
        return null;

    }
}

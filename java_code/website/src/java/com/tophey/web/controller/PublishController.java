/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.controller;

import com.tophey.web.common.PublishBean;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

/**
 * 用户主动发布站点
 *
 * @author zhenbao.zhou
 */
@Controller
@RequestMapping("/publish")
@SessionAttributes("publisBean")
public class PublishController {

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

        String message = "Form submitted successfully.  Bound " + publishBean;
        // Success response handling

        // prepare model for rendering success message in this request
        model.addAttribute("message", message);
        return null;

    }
}

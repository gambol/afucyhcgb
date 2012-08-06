/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.common;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.URL;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.format.annotation.NumberFormat.Style;

/**
 *
 * @author zhenbao.zhou
 */
public class PublishBean {

    @NotEmpty
    private String name;
    
    @NotEmpty
    @Size(min = 6, max = 20)
    private String passwd;
    
    @Email
    private String email;
    
    @Size(min = 1, max = 20)
    private String title;
    
    @Size(min = 7, max = 200)
    @URL
    private String siteUrl = "http://";
   
    @Size(min = 7, max = 200)
    @URL
    private String bannerUrl = "http://";
    
    @Size(max = 1000)
    private String description;
    
    private int category;

    public String getBannerUrl() {
        return bannerUrl;
    }

    public void setBannerUrl(String bannerUrl) {
        this.bannerUrl = bannerUrl;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("properties name=");
        if (name != null) {
            sb.append("'").append(name).append("', ");
        } else {
            sb.append(name).append(", ");
        }
        
        sb.append("categoryId:");
        sb.append(category);

        return sb.toString();
    }
}

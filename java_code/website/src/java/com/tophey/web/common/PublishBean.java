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

    @Size(min = 1, max = 20)
    private String server_name;
     
    @Size(min = 7, max = 200)
    @URL
    private String url = "http://";
   
    @URL
    private String banner = "http://";
    
    @Size(max = 2000)
    private String desc;
    
    private int network;
    
    private int category;

    public String getBanner() {
        return banner;
    }

    public int getNetwork() {
        return network;
    }

    public void setNetwork(int network) {
        this.network = network;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }


    
    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getServer_name() {
        return server_name;
    }

    public void setServer_name(String server_name) {
        this.server_name = server_name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
  

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("properties name=");
        if (server_name != null) {
            sb.append("'").append(server_name).append("', ");
        } else {
            sb.append(server_name).append(", ");
        }
        
        sb.append("categoryId:");
        sb.append(category);

        return sb.toString();
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.common;

import org.hibernate.validator.constraints.Email;

/**
 *
 * @author xiang.fu
 */
public class LoginBean {

    
    
    
    @Email
    private String userEmail;
         
    private String password;
    
    private String errMsg;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }

    

    
    
}

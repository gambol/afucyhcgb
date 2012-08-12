/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.dao;

import com.tophey.model.ServerInfo;
import tophey.utils.DateUtil;
import tophey.utils.JDBCUtils;

/**
 * ServerInfo相关的更新和插入
 * @author root
 */
public class ServerDao {
    
    public static int insert(ServerInfo si) {
        return JDBCUtils.insert(si);
    }
    
    public static int delete(ServerInfo si) {
        return JDBCUtils.delete(si);
    }
    
    public static void main(String[] args) {
        ServerInfo si = new ServerInfo();
        si.setName("gambol test");
        si.setLine("双线");
        si.setCategoryId(1);
        si.setDescription("哈哈 这是我的小测试");
        si.setUrl("http://www.atugame.com");
        si.setCreateDate(DateUtil.getCurrentTimestamp());
        si.setUpdateDate(DateUtil.getCurrentTimestamp());
        si.setUserId(1);
        System.out.println(ServerDao.insert(si));
        
        System.out.println(ServerDao.delete(si));
    }
}

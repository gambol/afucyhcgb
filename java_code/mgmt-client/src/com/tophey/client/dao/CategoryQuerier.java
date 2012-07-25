/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.client.dao;

import com.tophey.model.ServerInfo;
import com.tophey.common.ServerInfoDetail;
import com.tophey.model.Category;
import com.tophey.model.ServerSysInfo;
import com.tophey.utils.DBTool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xiang.fu
 */
public class CategoryQuerier {

    private static final String QUERY_CATEGORY_COUNT_BY_CATEGORY = "select count(*) from "
            + DBTool.getTableName(Category.class);
    private static final String QUERY_SERVER_LIST = "select * from "
            + DBTool.getTableName(Category.class);

    public int getCategoryCount() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ConnectionFactory.getInstance().getConnection();
            ps = conn.prepareStatement(QUERY_CATEGORY_COUNT_BY_CATEGORY);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(CategoryQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(CategoryQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBTool.closeAll(conn, ps, rs);
        }
        return 0;
    }

    public List<Category> getCategoryList() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ConnectionFactory.getInstance().getConnection();
            ps = conn.prepareStatement(QUERY_SERVER_LIST);   
            rs = ps.executeQuery();
            List<Category> retLis = new ArrayList<Category>();
            while (rs.next()) {
                Category c = (Category) DBTool.getObjectFromRS(rs, Category.class);
                retLis.add(c);
            }
            return retLis;
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(CategoryQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(CategoryQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBTool.closeAll(conn, ps, rs);
        }
        return null;
    }

   
}

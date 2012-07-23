/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.web.dao;

import com.tophey.model.ServerInfo;
import com.tophey.common.ServerInfoDetail;
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
public class ServerQuerier {

    private static final String QUERY_SERVER_PAGE_COUNT_BY_CATEGORY = "select count(*) from "
            + DBTool.getTableName(ServerSysInfo.class) + " sysinfo left join "
            + DBTool.getTableName(ServerInfo.class) + " info on sysinfo.id=info.id "
            + "where info.category_id=?";
    private static final String QUERY_SERVER_PAGE_BY_CATEGORY = "select * from "
            + DBTool.getTableName(ServerSysInfo.class) + " sysinfo left join "
            + DBTool.getTableName(ServerInfo.class) + " info on sysinfo.id=info.id "
            + "where info.category_id=? order by sysinfo.score desc limit ?,?";

    public int getServerCountByCategory(String categoryId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ConnectionFactory.getInstance().getConnection();
            ps = conn.prepareStatement(QUERY_SERVER_PAGE_COUNT_BY_CATEGORY);
            ps.setString(1, categoryId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(ServerQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(ServerQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBTool.closeAll(conn, ps, rs);
        }
        return 0;
    }

    public List<ServerInfoDetail> getServerInfoDetailPageByCategory(String categoryId, int start, int size) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ConnectionFactory.getInstance().getConnection();
            ps = conn.prepareStatement(QUERY_SERVER_PAGE_BY_CATEGORY);
            ps.setString(1, categoryId);
            ps.setInt(2, start);
            ps.setInt(3, size);
            rs = ps.executeQuery();
            List<ServerInfoDetail> retLis = new ArrayList<ServerInfoDetail>();
            while (rs.next()) {
                ServerInfo si = (ServerInfo) DBTool.getObjectFromRS(rs, ServerInfo.class);
                ServerSysInfo ssi = (ServerSysInfo) DBTool.getObjectFromRS(rs, ServerSysInfo.class);
                retLis.add(new ServerInfoDetail(si, ssi));
            }
            return retLis;
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(ServerQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(ServerQuerier.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBTool.closeAll(conn, ps, rs);
        }
        return null;
    }

    public static void main(String[] args) {
        List<ServerInfoDetail> sids = new ServerQuerier().getServerInfoDetailPageByCategory("1", 0, 20);
        System.out.println("aaa");
    }
}

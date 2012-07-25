/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.client.dao;

import com.tophey.model.ServerInfo;
import com.tophey.common.ServerInfoDetail;
import com.tophey.model.ServerSysInfo;
import com.tophey.utils.DBTool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xiang.fu
 */
public class ServerPersister {

    private static final String UPDATE_SERVER_INFO_SQL = "update "
            + DBTool.getTableName(ServerInfo.class) + " set "
            + " name=?,url=?,line=?,description=? "
            + " where id=?";
    private static final String UPDATE_SERVER_SYS_INFO_SQL = "update "
            + DBTool.getTableName(ServerSysInfo.class) + " set "
            + " server_num=?,name=?,score=? "
            + " where id=?";
    private static final String ADD_SERVER_INFO_SQL = "insert into "
            + DBTool.getTableName(ServerInfo.class) + " values "
            + " (NULL,?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String ADD_SERVER_SYS_INFO_SQL = "insert into "
            + DBTool.getTableName(ServerSysInfo.class) + " values "
            + " (?,?,?,?,?,?,?,?,?,?,?,?)";

    public void updateServerInfoDetail(ServerInfoDetail sid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = ConnectionFactory.getInstance().getConnection();
            conn.setAutoCommit(false);
            ps = conn.prepareStatement(UPDATE_SERVER_INFO_SQL);
            ps.setString(1, sid.getServerInfo().getName());
            ps.setString(2, sid.getServerInfo().getUrl());
            ps.setString(3, sid.getServerInfo().getLine());
            ps.setString(4, sid.getServerInfo().getDescription());
            ps.setInt(5, Integer.valueOf(sid.getServerInfo().getId()));
            ps.executeUpdate();
            DBTool.closeStmt(ps);
            ps = conn.prepareStatement(UPDATE_SERVER_SYS_INFO_SQL);
            ps.setInt(1, sid.getServerSysInfo().getServerNum());
            ps.setString(2, sid.getServerInfo().getName());
            ps.setDouble(3, sid.getServerSysInfo().getScore());
            ps.setInt(4, Integer.valueOf(sid.getServerInfo().getId()));

            ps.executeUpdate();

            conn.commit();
        } catch (SQLException ex) {
            try {
                conn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex1);
            }
            ex.printStackTrace();
            Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            try {
                conn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex1);
            }
            ex.printStackTrace();
            Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBTool.closeAll(conn, ps, rs);
        }
    }

    public void addServerInfoDetail(ServerInfoDetail sid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Date now = new Date();
            conn = ConnectionFactory.getInstance().getConnection();
            conn.setAutoCommit(false);
            ps = conn.prepareStatement(ADD_SERVER_INFO_SQL);
            ps.setString(1, sid.getServerInfo().getName()== null ?"":sid.getServerInfo().getName());
            ps.setString(2, sid.getServerInfo().getLine()== null ?"":sid.getServerInfo().getLine());
            ps.setString(3, sid.getServerInfo().getDescription()== null ?"":sid.getServerInfo().getDescription());
            ps.setString(4, sid.getServerInfo().getUrl()== null ?"":sid.getServerInfo().getUrl());
            ps.setString(5, sid.getServerInfo().getTitle() == null ?"":sid.getServerInfo().getTitle());
            ps.setString(6, sid.getServerInfo().getBannerUrl()== null ?"":sid.getServerInfo().getBannerUrl());
            ps.setInt(7, sid.getServerInfo().getCategoryId());
            ps.setTimestamp(8, sid.getServerInfo().getCreateDate()==null?new Timestamp(now.getTime()) :sid.getServerInfo().getCreateDate());
            ps.setTimestamp(9, sid.getServerInfo().getUpdateDate()==null?new Timestamp(now.getTime()) :sid.getServerInfo().getUpdateDate());
            ps.setInt(10, sid.getServerInfo().getIsDisable());
            ps.setTimestamp(11, sid.getServerInfo().getDisableDate()==null?new Timestamp(now.getTime()) :sid.getServerInfo().getDisableDate());
            ps.setString(12, sid.getServerInfo().getDisableReason()==null?"":sid.getServerInfo().getDisableReason());

            ps.executeUpdate();

            DBTool.closeStmt(ps);

            ps = conn.prepareStatement("select last_insert_id()");
            rs = ps.executeQuery();
            int id = 0;
            if (rs.next()) {
                id = rs.getInt(1);
            }
            DBTool.closeAll(null, ps, rs);
            ps = conn.prepareStatement(ADD_SERVER_SYS_INFO_SQL);
            ps.setInt(1, id);

            ps.setString(2, sid.getServerSysInfo().getName()== null ?"":sid.getServerInfo().getName());
            ps.setInt(3, sid.getServerSysInfo().getCategoryId());
            ps.setTimestamp(4, sid.getServerSysInfo().getRefreshDate()== null ?new Timestamp(now.getTime()) :sid.getServerSysInfo().getRefreshDate());
            ps.setDouble(5, sid.getServerSysInfo().getScore());
            ps.setInt(6, sid.getServerSysInfo().getPing());
            ps.setInt(7, sid.getServerSysInfo().getServerNum());
            ps.setTimestamp(8, sid.getServerSysInfo().getServerCreateTime()== null ?new Timestamp(now.getTime()) :sid.getServerSysInfo().getServerCreateTime());
            ps.setTimestamp(9, sid.getServerSysInfo().getServerNewOpenTime()== null ?new Timestamp(now.getTime()) :sid.getServerSysInfo().getServerNewOpenTime());
            ps.setInt(10, sid.getServerSysInfo().getVoteIn());
            ps.setInt(11, sid.getServerSysInfo().getVoteOut());
            ps.setInt(12, sid.getServerSysInfo().getPrivilege());

            ps.executeUpdate();

            conn.commit();
        } catch (SQLException ex) {
            try {
                conn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex1);
            }
            ex.printStackTrace();
            Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            try {
                conn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex1);
            }
            ex.printStackTrace();
            Logger.getLogger(ServerPersister.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBTool.closeAll(conn, ps, rs);
        }
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.utils;

import com.tophey.common.DBColumnName;
import com.tophey.common.DBTableName;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author xiang.fu
 */
public class DBTool {

    public static String getTableName(Class clz) {

        Annotation[] as = clz.getAnnotations();
        for (Annotation a : as) {
            if (a instanceof DBTableName) {
                return ((DBTableName) a).value();
            }
        }
        return null;
    }

    public static Object getObjectFromRS(ResultSet resutlSet, Class clz) throws SQLException, Exception {
        Object o = null;
        try {
            o = clz.newInstance();
        } catch (Exception ex) {
            throw ex;
        }

        Field[] fields = clz.getDeclaredFields();
        for (Field f : fields) {
            Annotation[] anns = f.getAnnotations();
            String columnName = null;
            for (Annotation ann : anns) {
                if (ann instanceof DBColumnName) {
                    columnName = ((DBColumnName) ann).value();
                }
            }
            Object fo = null;
            if (columnName != null) {
                fo = resutlSet.getObject(columnName);
                f.setAccessible(true);
                f.set(o, fo);
            }
        }
        return o;
    }

    public static void rollback(Connection conn) {
        try {
            if (conn != null) {
                conn.rollback();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBTool.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void closeStmt(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBTool.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void closeConn(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBTool.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void closeRS(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBTool.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void closeAll(Connection conn, Statement stmt, ResultSet rs) {
        closeConn(conn);
        closeRS(rs);
        closeStmt(stmt);
    }
}

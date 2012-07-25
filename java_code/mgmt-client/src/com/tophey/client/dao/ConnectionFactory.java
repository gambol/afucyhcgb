/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.client.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author xiang.fu
 */
public class ConnectionFactory {

    private static final String KEY_DB_URL = "KEY_DB_URL";
    private static final String DEFAULT_DB_URL =
//            "jdbc:mysql://localhost/tophey?useUnicode=true&characterEncoding=utf-8&autoReconnect=true";
            "jdbc:mysql://27.120.101.160/tophey?useUnicode=true&characterEncoding=utf-8&autoReconnect=true";
    private static final String KEY_DB_USERNAME = "KEY_DB_USERNAME";
//    private static final String DEFAULT_DB_USERNAME = "root";
    private static final String DEFAULT_DB_USERNAME = "tophey";
    private static final String KEY_DB_PASSWORD = "KEY_DB_PASSWORD";
//    private static final String DEFAULT_DB_PASSWORD = "";
    private static final String DEFAULT_DB_PASSWORD = "tophey#123$321";
    private static ConnectionFactory instance = new ConnectionFactory();
    private Properties prop;
    private String username = DEFAULT_DB_USERNAME;
    private String password = DEFAULT_DB_PASSWORD;
    private String url = DEFAULT_DB_URL;

    private ConnectionFactory() {
    }

    public Connection getConnection() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();


            throw new SQLException("Cannot load driver class", ex);
        }

    }

    public static ConnectionFactory getInstance() {
        return instance;
    }
}
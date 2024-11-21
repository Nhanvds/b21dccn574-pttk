package com.pttk.garaman.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO574 {
    protected Connection con;
    public DAO574() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/gara-man";
            String dbClass = "com.mysql.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, "root","password123");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

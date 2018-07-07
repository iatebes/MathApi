package com.dataaccess;

import com.items.CatalogItem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Locale;
import java.util.ResourceBundle;

public class MysqlAccess {

    private static final String MYSQL_URL = ResourceBundle.getBundle("config", Locale.getDefault()).getString("MYSQL_URL");
    private static final String USERNAME = ResourceBundle.getBundle("config", Locale.getDefault()).getString("USERNAME");
    private static final String PASSWORD = ResourceBundle.getBundle("config", Locale.getDefault()).getString("PASSWORD");

    public static ArrayList<CatalogItem> get_all_catalog() {
        ArrayList<CatalogItem> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(MYSQL_URL, USERNAME, PASSWORD)) {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from list_catalog");
                while (rs.next()) {
                    CatalogItem item = new CatalogItem(rs.getString(1), rs.getString(2));
                    list.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

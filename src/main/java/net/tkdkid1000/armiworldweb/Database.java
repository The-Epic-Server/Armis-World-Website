package net.tkdkid1000.armiworldweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.function.Consumer;

public class Database {

	static Connection conn = null;
	
	public static void runCommand(String sql, Consumer<PreparedStatement> consumer) {
		 try {
			conn = DriverManager.getConnection("jdbc:sqlite:armisworld.db");
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			consumer.accept(pstmt);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void runCommand(String sql) {
		 try {
			conn = DriverManager.getConnection("jdbc:sqlite:armisworld.db");
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static List<HashMap<String, Object>> runQuery(String sql) {
		 try {
			conn = DriverManager.getConnection("jdbc:sqlite:armisworld.db");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			List<HashMap<String, Object>> objects = new ArrayList<HashMap<String, Object>>();
			ResultSetMetaData md = rs.getMetaData();
			int columns = md.getColumnCount();
			while (rs.next()) {
				HashMap<String, Object> row = new HashMap<String, Object>();
				for (int x=1; x<=columns; x++) {
					row.put(md.getColumnName(x), rs.getObject(x));
				}
				objects.add(row);
			}
			return objects;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}

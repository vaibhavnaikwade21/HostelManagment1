package com.smarthostel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.smarthostel.ConnectionFactory.DBConnection;
import com.smarthostel.entity.User;

public class UserDAO {
	public boolean registerUser(String username, String password, String role) {
	    String query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {

	        ps.setString(1, username);
	        ps.setString(2, password); // In real applications, store hashed passwords!
	        ps.setString(3, role);

	        int rows = ps.executeUpdate();
	        return rows > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
		}

	public User authenticate(String username, String password) {
		    User user = null;

		    String sql = "SELECT * FROM users WHERE username = ? AND password = ?";

		    try (Connection conn = DBConnection.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {

		        ps.setString(1, username);
		        ps.setString(2, password); // In real-world apps, compare hashed passwords

		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            user = new User();
		            user.setUserId(rs.getInt("user_id"));
		            user.setUsername(rs.getString("username"));
		            user.setRole(rs.getString("role"));
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return user; // null if authentication fails
		}
	public int registerUserAndReturnId(String username, String password, String role) {
	    int userId = -1;
	    String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	        ps.setString(1, username);
	        ps.setString(2, password);
	        ps.setString(3, role);

	        int rows = ps.executeUpdate();
	        if (rows > 0) {
	            ResultSet rs = ps.getGeneratedKeys();
	            if (rs.next()) {
	                userId = rs.getInt(1);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return userId;
	}


}

package com.smarthostel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smarthostel.ConnectionFactory.DBConnection;
import com.smarthostel.entity.Complaint;

public class ComplaintDAO {
	public List<Complaint> getAllComplaints() {
	    List<Complaint> list = new ArrayList<>();
	    String sql = "SELECT c.*, s.name FROM complaints c JOIN students s ON c.student_id = s.student_id";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Complaint complaint = new Complaint();
	            complaint.setComplaintId(rs.getInt("complaint_id"));
	            complaint.setStudentName(rs.getString("name"));
	            complaint.setDescription(rs.getString("description"));
	            complaint.setStatus(rs.getString("status"));
	            complaint.setCreatedAt(rs.getString("created_at"));
	            list.add(complaint);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	public boolean insertComplaint(int userId, String description) {
	    String sql = "INSERT INTO complaints (student_id, description, status) VALUES (?, ?, 'open')";

	    // You must convert userId to student_id
	    int studentId = getStudentIdByUserId(userId);
	    if (studentId == -1) return false;

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, studentId);
	        ps.setString(2, description);
	        return ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	private int getStudentIdByUserId(int userId) {
	    String sql = "SELECT student_id FROM students WHERE user_id = ?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) return rs.getInt("student_id");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1;
	}


}

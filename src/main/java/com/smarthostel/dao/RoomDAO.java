package com.smarthostel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smarthostel.ConnectionFactory.DBConnection;
import com.smarthostel.entity.Room;

public class RoomDAO {
	public List<Room> getAllRooms() {
	    List<Room> list = new ArrayList<>();
	    String query = "SELECT * FROM rooms";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Room room = new Room();
	            room.setRoomId(rs.getInt("room_id"));
	            room.setRoomNumber(rs.getString("room_number"));
	            room.setCapacity(rs.getInt("capacity"));
	            room.setStatus(rs.getString("status"));
	            list.add(room);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public boolean assignRoom(int studentId, int roomId) {
	    String updateRoom = "UPDATE rooms SET status = 'occupied' WHERE room_id = ? AND status = 'available'";
	    String updateStudent = "UPDATE students SET room_id = ? WHERE student_id = ?";

	    try (Connection conn = DBConnection.getConnection()) {
	        conn.setAutoCommit(false);

	        PreparedStatement ps1 = conn.prepareStatement(updateRoom);
	        ps1.setInt(1, roomId);
	        int updated = ps1.executeUpdate();

	        if (updated == 1) {
	            PreparedStatement ps2 = conn.prepareStatement(updateStudent);
	            ps2.setInt(1, roomId);
	            ps2.setInt(2, studentId);
	            ps2.executeUpdate();

	            conn.commit();
	            return true;
	        } else {
	            conn.rollback();
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	public List<Room> getAvailableRooms() {
	    List<Room> list = new ArrayList<>();
	    String query = "SELECT * FROM rooms WHERE status = 'available'";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Room room = new Room();
	            room.setRoomId(rs.getInt("room_id"));
	            room.setRoomNumber(rs.getString("room_number"));
	            room.setCapacity(rs.getInt("capacity"));
	            room.setStatus(rs.getString("status"));
	            list.add(room);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public int getStudentIdByUserId(int userId) {
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
	
	public boolean releaseRoom(int studentId) {
	    String getRoomSql = "SELECT room_id FROM students WHERE student_id = ?";
	    String updateRoomSql = "UPDATE rooms SET status = 'available' WHERE room_id = ?";
	    String updateStudentSql = "UPDATE students SET room_id = NULL WHERE student_id = ?";

	    try (Connection conn = DBConnection.getConnection()) {
	        conn.setAutoCommit(false);

	        // Step 1: Get assigned room ID
	        int roomId = -1;
	        try (PreparedStatement ps = conn.prepareStatement(getRoomSql)) {
	            ps.setInt(1, studentId);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                roomId = rs.getInt("room_id");
	            }
	        }

	        if (roomId == -1) {
	            conn.rollback();
	            return false;
	        }

	        // Step 2: Mark room as available
	        try (PreparedStatement ps = conn.prepareStatement(updateRoomSql)) {
	            ps.setInt(1, roomId);
	            ps.executeUpdate();
	        }

	        // Step 3: Clear student room_id
	        try (PreparedStatement ps = conn.prepareStatement(updateStudentSql)) {
	            ps.setInt(1, studentId);
	            ps.executeUpdate();
	        }

	        conn.commit();
	        return true;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}

	public int getAssignedStudentCount(int roomId) throws Exception {
	    String sql = "SELECT COUNT(*) FROM students WHERE room_id = ?";
	    Connection conn = DBConnection.getConnection();
	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setInt(1, roomId);
	    ResultSet rs = ps.executeQuery();
	    if (rs.next()) {
	        return rs.getInt(1);
	    }
	    return 0;
	}

	public int getRoomCapacity(int roomId) throws Exception {
	    String sql = "SELECT capacity FROM rooms WHERE room_id = ?";
	    Connection conn = DBConnection.getConnection();
	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setInt(1, roomId);
	    ResultSet rs = ps.executeQuery();
	    if (rs.next()) {
	        return rs.getInt("capacity");
	    }
	    return 0;
	}


}

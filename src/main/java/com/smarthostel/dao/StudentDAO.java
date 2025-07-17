package com.smarthostel.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.smarthostel.ConnectionFactory.DBConnection;
import com.smarthostel.entity.Student;


public class StudentDAO {
	public void insertStudent(int userId, String name) {
	    String sql = "INSERT INTO students (user_id, name) VALUES (?, ?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, userId);
	        ps.setString(2, name);

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	
	

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();

        String query = "SELECT s.student_id, s.name, u.username, s.room_id, r.room_number " +
                       "FROM students s " +
                       "JOIN users u ON s.user_id = u.user_id " +
                       "LEFT JOIN rooms r ON s.room_id = r.room_id";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("student_id"));
                student.setName(rs.getString("name"));
                student.setUsername(rs.getString("username"));
                student.setRoomId(rs.getInt("room_id"));
                student.setRoomNumber(rs.getString("room_number"));

                list.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}

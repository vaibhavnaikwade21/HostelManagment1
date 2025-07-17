package com.smarthostel.dao;

import com.smarthostel.ConnectionFactory.DBConnection;
import com.smarthostel.entity.Fee;
import java.sql.*;
import java.util.*;

public class FeeDAO {
    private Connection conn;

    public FeeDAO() throws Exception {
        conn = DBConnection.getConnection(); // Assume your connection utility
    }

    public Fee getFeeByStudentId(int studentId) throws Exception {
        Fee fee = null;
        String sql = "SELECT * FROM fees WHERE student_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, studentId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            fee = new Fee();
            fee.setFeeId(rs.getInt("fee_id"));
            fee.setStudentId(rs.getInt("student_id"));
            fee.setTotalFee(rs.getDouble("total_fee"));
            fee.setPaidAmount(rs.getDouble("paid_amount"));
            fee.setStatus(rs.getString("status"));
        }
        return fee;
    }

    public void payFees(int studentId, double amount) throws Exception {
        Fee fee = getFeeByStudentId(studentId);
        if (fee != null) {
            double newPaid = fee.getPaidAmount() + amount;
            String status = "Unpaid";
            if (newPaid >= fee.getTotalFee()) {
                newPaid = fee.getTotalFee();
                status = "Paid";
            } else if (newPaid > 0) {
                status = "Partial";
            }

            String sql = "UPDATE fees SET paid_amount = ?, status = ? WHERE student_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, newPaid);
            ps.setString(2, status);
            ps.setInt(3, studentId);
            ps.executeUpdate();
        }
    }

    public List<Fee> getAllFees() throws Exception {
        List<Fee> list = new ArrayList<>();
        String sql = "SELECT * FROM fees";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            Fee fee = new Fee();
            fee.setFeeId(rs.getInt("fee_id"));
            fee.setStudentId(rs.getInt("student_id"));
            fee.setTotalFee(rs.getDouble("total_fee"));
            fee.setPaidAmount(rs.getDouble("paid_amount"));
            fee.setStatus(rs.getString("status"));
            list.add(fee);
        }
        return list;
    }

    public void createFeeForStudent(int studentId) throws Exception {
        String checkSql = "SELECT COUNT(*) FROM fees WHERE student_id = ?";
        PreparedStatement checkPs = conn.prepareStatement(checkSql);
        checkPs.setInt(1, studentId);
        ResultSet rs = checkPs.executeQuery();
        rs.next();
        if (rs.getInt(1) == 0) {
            String sql = "INSERT INTO fees (student_id) VALUES (?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ps.executeUpdate();
        }
    }
}

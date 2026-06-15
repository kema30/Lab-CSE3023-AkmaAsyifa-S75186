
package com.lab.dao;

import com.lab.bean.SubjectBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {
    // Database connection helper method
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/lab7_db", "root", "");
    }

    // CREATE: Add new subject
    public boolean addSubject(SubjectBean subject) {
        String query = "INSERT INTO registered_subjects (matric_no, subject_code, subject_name) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, subject.getMatricNo());
            ps.setString(2, subject.getSubjectCode());
            ps.setString(3, subject.getSubjectName());
            
            return ps.executeUpdate() > 0; // Returns true if insertion is successful
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // READ: View all subjects for a specific student using matric_no
    public List<SubjectBean> getSubjectsByMatric(String matricNo) {
        List<SubjectBean> list = new ArrayList<>();
        String query = "SELECT * FROM registered_subjects WHERE matric_no = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, matricNo);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                SubjectBean sb = new SubjectBean();
                sb.setId(rs.getInt("id"));
                sb.setMatricNo(rs.getString("matric_no"));
                sb.setSubjectCode(rs.getString("subject_code"));
                sb.setSubjectName(rs.getString("subject_name"));
                list.add(sb);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    // READ SINGLE: Get details of one specific subject (for Update form)
    public SubjectBean getSubjectById(int id) {
        SubjectBean sb = null;
        String query = "SELECT * FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                sb = new SubjectBean();
                sb.setId(rs.getInt("id"));
                sb.setMatricNo(rs.getString("matric_no"));
                sb.setSubjectCode(rs.getString("subject_code"));
                sb.setSubjectName(rs.getString("subject_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb;
    }

    // UPDATE: Modify an existing subject
    public boolean updateSubject(SubjectBean subject) {
        String query = "UPDATE registered_subjects SET subject_code = ?, subject_name = ? WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, subject.getSubjectCode());
            ps.setString(2, subject.getSubjectName());
            ps.setInt(3, subject.getId());
            ps.setString(4, subject.getMatricNo()); // Security check: must match logged-in student
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE: Remove a subject
    public boolean deleteSubject(int id, String matricNo) {
        String query = "DELETE FROM registered_subjects WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, id);
            ps.setString(2, matricNo); // Security check: must match logged-in student
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

package com.smarthostel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smarthostel.dao.StudentDAO;
import com.smarthostel.entity.Student;

@WebServlet("/viewStudents")
public class viewStudentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentDAO dao = new StudentDAO();
        List<Student> studentList = dao.getAllStudents();
        request.setAttribute("students", studentList);
        request.getRequestDispatcher("viewStudent.jsp").forward(request, response);
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.Employee;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akmaa
 */
public class PayrollServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayrollServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayrollServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //create arraylist for 5 data 
        List<Employee> list = new ArrayList<>();
        
        Employee emp1 = new Employee();
        emp1.setEmpId("E001"); emp1.setName("Ali"); emp1.setDepartment("IT"); emp1.setBasicSalary(4500.0);
        list.add(emp1);
        
        list.add(createEmp("E002", "Abu", "HR", 2500.0));
        list.add(createEmp("E003", "Zul", "Sales", 3500.0));
        list.add(createEmp("E004", "Siti", "Admin", 2800.0));
        list.add(createEmp("E005", "Tan", "IT", 5000.0));
        
        //call employeelist in jsp
        request.setAttribute("employeeList", list);
        
        //forward request tp payroll_view
        request.getRequestDispatcher("payroll_view.jsp").forward(request, response);
    }
    
        private Employee createEmp(String id, String name, String dept, double salary) {
        Employee e = new Employee();
        e.setEmpId(id); 
        e.setName(name); 
        e.setDepartment(dept); 
        e.setBasicSalary(salary);
        return e;
    
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

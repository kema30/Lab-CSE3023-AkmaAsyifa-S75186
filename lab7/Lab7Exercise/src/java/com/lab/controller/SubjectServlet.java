/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author akmaa
 */
public class SubjectServlet extends HttpServlet {
    private SubjectDAO subjectDAO = new SubjectDAO();
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
        
        // 1. Session Management: Verify if user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("matricNo") == null) {
            // Redirect to login page if session doesn't exist
            response.sendRedirect("login.html");
            return;
        }
        
        String matricNo = (String) session.getAttribute("matricNo");
        String action = request.getParameter("action");
        if (action == null) {
            action = "view"; // Default action
        }

        try {
            switch (action) {
                case "add":
                    // Create new subject bean and save to database
                    SubjectBean newSubject = new SubjectBean();
                    newSubject.setMatricNo(matricNo);
                    newSubject.setSubjectCode(request.getParameter("subjectCode"));
                    newSubject.setSubjectName(request.getParameter("subjectName"));
                    
                    subjectDAO.addSubject(newSubject);
                    response.sendRedirect("SubjectServlet?action=view");
                    break;

                case "editForm":
                    // Fetch data for the specific subject to show inside the update form
                    int editId = Integer.parseInt(request.getParameter("id"));
                    SubjectBean existingSubject = subjectDAO.getSubjectById(editId);
                    
                    request.setAttribute("subject", existingSubject);
                    request.getRequestDispatcher("/subject/updateSubject.jsp").forward(request, response);
                    break;

                case "update":
                    // Process update submission
                    SubjectBean updatedSubject = new SubjectBean();
                    updatedSubject.setId(Integer.parseInt(request.getParameter("id")));
                    updatedSubject.setMatricNo(matricNo);
                    updatedSubject.setSubjectCode(request.getParameter("subjectCode"));
                    updatedSubject.setSubjectName(request.getParameter("subjectName"));
                    
                    subjectDAO.updateSubject(updatedSubject);
                    response.sendRedirect("SubjectServlet?action=view");
                    break;

                case "delete":
                    // Delete subject based on ID and owner's matric number
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    subjectDAO.deleteSubject(deleteId, matricNo);
                    response.sendRedirect("SubjectServlet?action=view");
                    break;

                case "view":
                default:
                    // Fetch all subjects for the student and send to view page
                    List<SubjectBean> listSubjects = subjectDAO.getSubjectsByMatric(matricNo);
                    request.setAttribute("listSubjects", listSubjects);
                    request.getRequestDispatcher("/subject/viewSubjects.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
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
        processRequest(request, response);
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
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Unifies Controller for Subject CRUD Operations";
    }// </editor-fold>

}

<%-- 
    Document   : processUser
    Created on : 12 May 2026, 4:19:53 pm
    Author     : akmaa
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String u = request.getParameter("username");
            String p = request.getParameter("password");
            String f = request.getParameter("firstname");
            String l = request.getParameter("lastname");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/cse3023", "root", "");
                String sql = "INSERT INTO userprofile VALUES (?,?,?,?)";
                
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, u);
                ps.setString(2, p);
                ps.setString(3, f);
                ps.setString(4, l);
                ps.executeUpdate();
        
                out.print("Registration successful! <a href='login.jsp'>Login here</a>");
                con.close();
            } catch(Exception e) { 
                out.print("Error: " + e.getMessage()); 
              }
%>
    </body>
</html>

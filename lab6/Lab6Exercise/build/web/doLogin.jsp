<%-- 
    Document   : doLogin
    Created on : 12 May 2026, 4:26:10 pm
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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/cse3023", "root", "");
        
            String sql = "SELECT * FROM userprofile WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                // Jika betul, simpan data dalam SESSION dan pergi ke main.jsp
                session.setAttribute("user", rs.getString("username"));
                session.setAttribute("fname", rs.getString("firstname"));
                session.setAttribute("lname", rs.getString("lastname"));
                response.sendRedirect("main.jsp");
            } 
            else {
            // Jika salah, hantar balik ke login.jsp dengan mesej ralat
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
            }
            con.close();
        } catch(Exception e) { out.print(e.getMessage()); }
    %>
    </body>
</html>

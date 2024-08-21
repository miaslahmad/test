<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE  html>
<html>
    <head>
        <title>Profil Pengguna</title>
    </head>
    <body>
        <h2>Profil Pengguna</h2>
        <%
           if (session.getAttribute("userName") != null) 
                {
        out.println("<h3>Data dari Session</h3>");
        out.println("Nama: " + session.getAttribute("userName") + "<br>");
                }
                %>
        
    </body>
</html>
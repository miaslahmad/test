<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Result</title>
</head>
<body>
    <h2>Login Result</h2>
    <%
        // Mengambil data dari form
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String address = request.getParameter("address");
    %>
    <p><strong>Nama:</strong> <%= name %></p>
    <p><strong>ID:</strong> <%= id %></p>
    <p><strong>Alamat:</strong> <%= address %></p>
    <a href="processDelete.jsp">Delete</a>
</body>
</html>

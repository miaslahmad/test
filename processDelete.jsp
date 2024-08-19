<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show Message</title>
</head>
<body>
    <h2>Message</h2>
    <%
        // Menampilkan pesan dari parameter URL atau sesi
        String message = request.getParameter("Notif");
        if (message == null) {
            message = "Data sudah dihapus";
        }
            %>
                <p><%= message %></p>
                <a href="login.jsp">Back to Login</a>
</body>
</html>

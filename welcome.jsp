<%-- 
    Document   : welcome
    Created on : Aug 21, 2024, 9:29:59 AM
    Author     : HP
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
    <%
        // Mendapatkan nama dari form
        String nama = request.getParameter("nama");
        
        // Cek jika nama tidak null atau kosong
        if (nama !=null && !nama.trim().isEmpty()) {
           //Menggunakan session yang sudah ada (tidak perlu mendeklarasikan ulang)
           session.setAttribute("userName", nama);
           
           //Menampilkan pesan selamat datang
           out.println("<h2>Selamat Datang, " + nama + "!<h2>");
        } else {
            out.println("<p>Nama tidak valid. <a href='input.jsp'>Kembali</a></p>");
        }
    %>
    <a href="profile.jsp">Lihat Profil Anda</a>
    </body>
</html>
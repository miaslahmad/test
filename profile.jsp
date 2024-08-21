<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE  html>
<html>
    <head>
        <title>Profil Pengguna</title>
    </head>
    <body>
        <h2>Profil Pengguna</h2>
        <%
            //Tidak perlu mendeklarasikan ulang variabel session, langsung gunakan objek session yang disediakan JSP
            if (session != null){
            //Mendapatkan nama dari sesi
            String nama= (String) session.getAttribute("userName");
            
            if (nama != null) {
            out.println("<p>Nama Anda): " + nama +"</p>");
            } else {
            out.println ("<p>Nama tidak ditemukan di sesi.</p>");
            }
            } else {
            out.println ("<p>Sesi tidak ada, silakan kembali ke halaman sebeleumnya dan masukan nama Anda.</p>");
            }
        %>
        <a href="welcome.jsp">Kembali ke Welcome Page </a>
    </body>
</html>
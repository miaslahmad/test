<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ucapan Berdasarkan Waktu</title>
</head>
<body>
    <h2>Ucapan Berdasarkan Waktu</h2>

    <%
        // Ambil pesan dari request
        String message = request.getParameter("message");

        // Ambil waktu saat ini
        java.util.Calendar calendar = java.util.Calendar.getInstance();
        int hour = calendar.get(java.util.Calendar.HOUR_OF_DAY);

        // Tentukan ucapan berdasarkan waktu
        String greeting;
        if (hour >= 5 && hour < 10) {
            greeting = "Selamat Pagi";
        } else if (hour >= 10 && hour < 14) {
            greeting = "Selamat Siang";
        } else if (hour >= 14 && hour < 18) {
            greeting = "Selamat Sore";
        } else {
            greeting = "Selamat Malam";
        }
    %>

    <p><strong>Ucapan:</strong> <%= greeting %></p>
    <p><strong>Pesan Anda:</strong> <%= message %></p>

    <a href="pesansesuaiwaktu.jsp">Kembali</a>
</body>
</html>

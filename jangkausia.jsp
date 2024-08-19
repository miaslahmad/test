<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Age Difference Calculation</title>
</head>
<body>
    <h2>Age Difference Calculation</h2>
    <%
        // Usia individu
        int usiaBudi = 10;
        int usiaAndi = 11;
        int usiaIndah = 20;
        int usiaIrwan = 25;

        // Usia Ani berada di antara 12 dan 19 tahun
        int usiaAniMin = 12;
        int usiaAniMax = 19;

        // Hitung jangka usia Ani dengan Budi
        int selisihMin = usiaAniMin - usiaBudi;
        int selisihMax = usiaAniMax - usiaBudi;

        // Tampilkan hasil
        out.println("<p>Usia Ani berkisar antara " + usiaAniMin + " hingga " + usiaAniMax + " tahun.</p>");
        out.println("<p>Jangka usia Ani dengan Budi:</p>");
        out.println("<ul>");
        out.println("<li>Jika usia Ani adalah " + usiaAniMin + " tahun, selisih usia Ani dengan Budi adalah " + selisihMin + " tahun.</li>");
        out.println("<li>Jika usia Ani adalah " + usiaAniMax + " tahun, selisih usia Ani dengan Budi adalah " + selisihMax + " tahun.</li>");
        out.println("</ul>");
    %>
</body>
</html>

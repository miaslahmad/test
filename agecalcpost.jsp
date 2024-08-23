<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject" %>

<%
    // Data statis
    String nama = "Mia";
    int tahunLahir = 1999; // Tahun lahir
    
    // Menghitung usia
    int tahunSekarang = java.time.LocalDate.now().getYear();
    int usia = tahunSekarang - tahunLahir;
    
    // Mengambil user-agent dari header untuk memastikan permintaan datang dari Postman
    String userAgent = request.getHeader("User-Agent");
    boolean isPostman = userAgent != null && userAgent.contains("Postman");

    if (isPostman) {
        // Buat objek JSON
        JSONObject json = new JSONObject();
        json.put("nama", nama);
        json.put("usia", usia);

        // Tampilkan JSON
        response.setContentType("application/json");
        out.println(json.toString(4));
    } 
    else {
        // Jika bukan dari Postman, tampilkan pesan kesalahan
        response.setContentType("text/html");
        out.println("<h1>Invalid Date</h1>");
        out.println("<p>Halaman ini hanya bisa diakses melalui Postman.</p>");
}
%>
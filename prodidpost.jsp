<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.json.JSONObject" %>

    <%
        // Mendapatkan parameter product_id dari request
        String productId = request.getParameter("productid");

        String nama = "";
        double harga = 0.0;
        String deskripsiBarang = "";
        
        // Mengisi data produk berdasarkan product_id
        if ("12".equals(productId)) {
            nama = "kecap ABC";
            harga = 5.000;
            deskripsiBarang = "cokelat";
        } else if ("34".equals(productId)){
            nama = "indomie";
            harga = 3.000;
            deskripsiBarang = "putih";
        } else {
            nama = "tidak ada produk";
            harga = 0.0;
            deskripsiBarang = "-";
        }        
        // Mengambil user-agent dari header untuk memastikan permintaan datang dari Postman
    String userAgent = request.getHeader("User-Agent");
    boolean isPostman = userAgent != null && userAgent.contains("Postman");
    
        if (isPostman) {
        // Buat objek JSON
        JSONObject json = new JSONObject();
        json.put("productId", productId);
        json.put("nama", nama);
        json.put("harga", harga);
        json.put("deskripsi", deskripsiBarang);
        
        // Tampilkan JSON
        response.setContentType("application/json");
        out.println(json.toString(4));
    } 
    else {
        // Jika bukan dari Postman, tampilkan pesan kesalahan
        response.setContentType("text/html");
        out.println("<h1>Invalid</h1>");
        out.println("<p>Halaman ini hanya bisa diakses melalui Postman.</p>");
}
    %>


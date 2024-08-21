<%-- 
    Document   : simpanData
    Created on : Aug 21, 2024, 10:36:07 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%
  // Mendapatkan data dari form
  String Id = request.getParameter ("id");
  String Nama = request.getParameter ("nama");
  String Alamat = request.getParameter ("alamat");
  String Pekerjaan = request.getParameter ("pekerjaan");
  
  // Koneksi ke Database
  String url = "jdbc:mysql://localhost:3306/test12"; // URL Database
  String user = "root"; // Username database
  String password = ""; // Password database
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  
 try {
    // Memuat driver JDBC
    Class.forName("com.mysql.jdbc.Driver");
    
    // Membuat koneksi ke database
    conn = DriverManager.getConnection(url, user, password);
    
    // Membuat query SQL untuk menyimpan data
    String sql ="INSERT INTO karyawan (id, nama, alamat, pekerjaan) VALUES (?, ?, ?, ?)";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, Id);
    pstmt.setString(2, Nama);
    pstmt.setString(3, Alamat);
    pstmt.setString(4, Pekerjaan);
    // Menjalankan query
    int rowInserted = pstmt.executeUpdate();
    
    if (rowInserted > 0) {
        out.println("<p> Data Berhasil disimpan!</p>");
    } else {
        out.println("<p>Terjadi kesalahan saat menyimpan data.</p>");
    }
    // Menjalankan query
    
  } catch (ClassNotFoundException e) {
    out.println("Driver JDCB tidak ditemukan!");
    e.printStackTrace();
  } catch (SQLException e) {
    out.println("Koneksi atau query database gagal");
    e.printStackTrace();
  } finally {
    // Menutup koneksi dan statement
    if (pstmt !=null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn !=null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 }
}
%>
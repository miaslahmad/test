<html>
    <head>
        <title>Form Input Karyawan</title>
    </head>
    <body>
        <%@page import="java.sql.*"%>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())){
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
        session.setAttribute("userName", Nama);
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
}}
%>
        <h2>Input  Data Karyawan</h2>
        <form action="latihanform.jsp" method="post">
            Id: <input type="text" name="id" required><br><br>
            Nama: <input type="text" name="nama" required><br><br>
            Alamat: <input type="text" name="alamat" required><br><br>
            Pekerjaan: <input type="text" name="pekerjaan" required><br><br>
                        <input type="submit" value="Simpan">
                        <a href="cekform.jsp"><button type="button"> Cek </button></a>
                       
        </form>
        
    </body>
</html>
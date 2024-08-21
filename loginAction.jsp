<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Result</title>
</head>
<body>
    <%
        // Mendapatkan data dari formulir
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "";

        // Database connection parameters
        String dbURL = "jdbc:mysql://localhost:3306/test12";
        String dbUser = "root";
        String dbPassword = "";

        // Variabel untuk menyimpan hasil
        boolean loginSuccessful = false;

        // Koneksi ke database
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Buat koneksi
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Query untuk memeriksa username dan password
            String sql = "SELECT * FROM login WHERE nama = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            // Eksekusi query
            rs = stmt.executeQuery();

            // Memeriksa hasil query
            if (rs.next()) {
                loginSuccessful = true;
                role = rs.getString("role");
                            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Tutup koneksi dan resource
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        
        // Hasil login
        if (loginSuccessful) {
            out.println("Anda adalah " + role + "<br>");
        } else {
            out.println("<h2>Invalid username or password.</h2>");
            out.println("<a href='loginpassword.jsp'>Back to Login</a>");
        }
    %>
</body>
</html>

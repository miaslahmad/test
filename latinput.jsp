<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Nama Pengguna</title>
    </head>
    <body>
        <h2>Silahkan Masukkan Nama Anda:</h2>
        <form action="welcome.jsp" method="post">
            Nama: <input type="text" name="nama" required><br><br>
            <input type="submit" value="Simpan">
            <form>
    </body>
</html>
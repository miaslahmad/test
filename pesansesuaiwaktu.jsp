<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Pesan</title>
</head>
<body>
    <h2>Masukkan Pesan</h2>
    <form action="greeting.jsp" method="post">
        <label for="message">Pesan:</label>
        <input type="text" id="message" name="message" required>
        <input type="submit" value="Submit">
    </form>
</body>
</html>

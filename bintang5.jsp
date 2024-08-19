<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>5x5 Grid of Asterisks</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            width: 20px;
            height: 20px;
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <h2>5x5 Grid of Asterisks</h2>
    <table>
        <%
            for (int row = 0; row < 5; row++) {
                out.println("<tr>"); // Mulai baris baru
                for (int col = 0; col < 5; col++) {
                    out.println("<td>*</td>"); // Tambahkan sel dengan karakter '*'
                }
                out.println("</tr>"); // Akhiri baris
            }
        %>
    </table>
</body>
</html>

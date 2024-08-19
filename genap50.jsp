<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Angka Genap 5x10</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Angka Genap 5x10</h2>
    <table>
        <%
            int number = 0; // Mulai dengan angka genap pertama
            for (int row = 0; row < 5; row++) {
                out.println("<tr>");
                for (int col = 0; col < 10; col++) {
                    out.println("<td>" + number + "</td>");
                    number += 2; // Tambah 2 untuk angka genap berikutnya
                }
                out.println("</tr>");
            }
        %>
    </table>
</body>
</html>

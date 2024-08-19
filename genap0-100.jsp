<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Even Numbers from 0 to 100 in 4 Columns</title>
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
            padding: 8px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Even Numbers from 0 to 100 in 4 Columns</h2>
    <table>
        <tr>
            <%
                // Loop untuk menampilkan angka genap dari 0 hingga 100 dengan 4 kolom
                int number = 0; // Mulai dari angka genap pertama
                int columnCount = 4; // Jumlah kolom
                for (int row = 0; row <= 100 / 2; row++) {
                    out.println("<tr>");
                    for (int col = 0; col < columnCount; col++) {
                        if (number <= 100) {
                            out.println("<td>" + number + "</td>");
                            number += 2; // Tambah 2 untuk angka genap berikutnya
                        }
                    }
                    out.println("</tr>");
                }
            %>
        </tr>
    </table>
</body>
</html>

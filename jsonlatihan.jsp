<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html>
<html>
    <head>
        <title>
            JSON dengan JSP
        </title>
    </head>
    <body>
        
        <%
        //Membuat objek JSON di sisi server
        String jsonString = "{ \"nama\": \"Budi\", \"umur\" :25, \"alamat\": {\"kota\": \"Jakarta\", \"negara\": \"Indonesia\" }}";
        
        //Parsing string JSON ke dalam objek JSONObject
        JSONObject jsonObj = new JSONObject(jsonString);
        
        //Mengambil data dari JSON
        String nama = jsonObj.getString("nama");
        int umur = jsonObj.getInt("umur");
        String kota = jsonObj.getJSONObject("alamat").getString("kota");
        String negara = jsonObj.getJSONObject("alamat").getString("negara");
        %>
        
        <h1>Data dari JSON</h1>
        <p>Nama: <%= nama %></p>
        <p>Umur: <%= umur %></p>
        <p>Kota: <%= kota %></p>
        <p>Negara: <%= negara %></p>
        
    </body>
</html>
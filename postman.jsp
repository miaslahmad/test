<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="org.json.JSONObject" %>

<%
//Membuat objek JSON menggunakan org.json
JSONObject jsonObj = new JSONObject();

//Menambahkan data ke dalam JSON
jsonObj.put("name", "Mia");
jsonObj.put("age", 12);
jsonObj.put("city", "Bogor");

//Mengembalikan JSON sebagai response
out.print(jsonObj.toString());
%>
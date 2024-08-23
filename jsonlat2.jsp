<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page contentType="application/json" %>

<%
    // Membuat objek JSON untuk hasil akhir
    JSONObject jsonResponse = new JSONObject();

    // Daftar nama, usia, kota, dan negara
    String[] names = {"Abe", "Bibi", "Cici", "Dede", "Fifi"};
    int[] ages = {25, 30, 35, 40, 45};
    String[] cities = {"Bandung", "Los Angeles", "Kuala Lumpur", "Bangkok", "Hanoi"};
    String[] countries = {"Indonesia", "USA", "Malaysia", "Thailand", "Vietnam"};

    // Memilih hanya satu negara dari daftar
    String selectedCountry = countries[2]; // Misalnya, pilih negara pertama dari daftar
    int selectedAge = ages[1];

    // Membuat array JSON untuk nama, usia, dan kota
    JSONArray namesArray = new JSONArray();
    JSONArray citiesArray = new JSONArray();

    // Menambahkan nama, usia, dan kota yang hanya tiga pertama dari daftar
    int numberOfElements = Math.min(3, names.length); // Menghindari ArrayIndexOutOfBoundsException

    for (int i = 0; i < numberOfElements; i++) {
        namesArray.put(names[i]);
        citiesArray.put(cities[i]);
    }

    // Menambahkan data ke objek JSON
    jsonResponse.put("names", namesArray);
    jsonResponse.put("ages", selectedAge);
    jsonResponse.put("cities", citiesArray);
    jsonResponse.put("country", selectedCountry);

    // Mengatur format JSON agar lebih mudah dibaca
    String jsonString = jsonResponse.toString(4); // 4 adalah level indentasi

    // Menulis JSON ke response
    out.print(jsonString);
%>

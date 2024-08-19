<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>

<%
    // Input string
    String input = "Buatlah account GITHUB, dan account tersebut di buat open agar semua orang dapat melihat";
    
    // Membersihkan string: mengubah menjadi huruf kecil dan menghapus simbol
    String cleanedInput = input.toLowerCase().replaceAll("[^a-zA-Z0-9\\s]", "");
    
    // Memisahkan string menjadi kata-kata
    String[] words = cleanedInput.split("\\s+");
    
    // Menghitung frekuensi setiap kata
    Map<String, Integer> wordCount = new HashMap<>();
    for (String word : words) {
        if (!word.isEmpty()) {
            wordCount.put(word, wordCount.getOrDefault(word, 0) + 1);
        }
    }
    
    // Menemukan kata dengan jumlah terbanyak
    String mostFrequentWord = null;
    int maxCount = 0;
    for (Map.Entry<String, Integer> entry : wordCount.entrySet()) {
        if (entry.getValue() > maxCount) {
            mostFrequentWord = entry.getKey();
            maxCount = entry.getValue();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Word Count Result</title>
</head>
<body>
    <h1>Word Count Result</h1>
    <p>Total number of words: <%= words.length %></p>
    <p>Word with the highest frequency: '<%= mostFrequentWord %>' (occurrences: <%= maxCount %>)</p>

    <h2>Word Frequencies:</h2>
    <ul>
        <%
            for (Map.Entry<String, Integer> entry : wordCount.entrySet()) {
                out.println("<li>" + entry.getKey() + ": " + entry.getValue() + "</li>");
            }
        %>
    </ul>
</body>
</html>
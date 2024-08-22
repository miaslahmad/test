<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URL" %>
<%@ page import="javax.xml.soap.*" %>
<%@ page import="java.io.*" %>

<%
    // Mendapatkan input dari form
    String num1 = request.getParameter("num1");
    String num2 = request.getParameter("num2");

    try {
        // Membuat koneksi SOAP
        URL wsdlURL = new URL("http://www.dneonline.com/calculator.asmx?WSDL");
        
        // Membuat pesan SOAP
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();

        // Membuat pesan SOAP request
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();

        // Membuat envelope dan body
        SOAPPart soapPart = soapMessage.getSOAPPart();
        SOAPEnvelope envelope = soapPart.getEnvelope();
        SOAPBody soapBody = envelope.getBody();

        // Menambahkan elemen ke body
        SOAPElement soapBodyElem = soapBody.addChildElement("Add", "", "http://tempuri.org/");
        SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("intA");
        soapBodyElem1.addTextNode(num1);
        SOAPElement soapBodyElem2 = soapBodyElem.addChildElement("intB");
        soapBodyElem2.addTextNode(num2);

        // Simpan pesan
        soapMessage.saveChanges();

        // Kirim pesan SOAP dan menerima respons
        SOAPMessage soapResponse = soapConnection.call(soapMessage, wsdlURL);

        // Ekstraksi hasil dari respons
        SOAPBody responseBody = soapResponse.getSOAPBody();
        SOAPElement responseElement = (SOAPElement) responseBody.getElementsByTagName("AddResult").item(0);
        String result = responseElement.getValue();

        // Menutup koneksi SOAP
        soapConnection.close();

        // Menampilkan hasil di halaman JSP
        out.println("<h1>Hasil Penjumlahan: " + result + "</h1>");

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>

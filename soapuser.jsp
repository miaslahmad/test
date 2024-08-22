<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.xml.soap.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Get User Information</title>
</head>
<body>
    <h1>Get User Information</h1>
    <form method="get" action="index.jsp">
        <label for="userId">User ID:</label>
        <input type="text" id="userId" name="userId" required />
        <button type="submit">Get User Info</button>
    </form>

    <%
        String userId = request.getParameter("userId");
        if (userId != null && !userId.isEmpty()) {
            try {
                // URL ke WSDL dari layanan web mock yang dibuat
                String endpointURL = "https://run.mocky.io/v3/47182e82-2e1d-4b70-9c83-3ca0b1549a9a";
                
                // Membuat koneksi SOAP
                SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
                SOAPConnection soapConnection = soapConnectionFactory.createConnection();
                
                // Membuat permintaan SOAP
                SOAPMessage soapMessage = createSOAPRequest(userId);
                SOAPMessage soapResponse = soapConnection.call(soapMessage, endpointURL);
                
                // Memproses respons SOAP
                String result = parseSOAPResponse(soapResponse);
    %>
                <h2>User Information</h2>
                <pre><%= result %></pre>
    <%
            } catch (Exception e) {
                e.printStackTrace();
    %>
                <h2>Error</h2>
                <pre><%= e.getMessage() %></pre>
    <%
            }
        }

        // Membuat permintaan SOAP untuk mendapatkan informasi pengguna
        private SOAPMessage createSOAPRequest(String userId) throws SOAPException {
            MessageFactory messageFactory = MessageFactory.newInstance();
            SOAPMessage soapMessage = messageFactory.createMessage();
            SOAPPart soapPart = soapMessage.getSOAPPart();

            SOAPEnvelope envelope = soapPart.getEnvelope();
            envelope.addNamespaceDeclaration("mock", "http://example.com/namespace");

            SOAPBody soapBody = envelope.getBody();
            SOAPElement soapBodyElem = soapBody.addChildElement("GetUserInfoRequest", "mock");
            SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("userId", "mock");
            soapBodyElem1.addTextNode(userId);

            MimeHeaders headers = soapMessage.getMimeHeaders();
            headers.addHeader("SOAPAction", "http://example.com/getUserInfo");

            soapMessage.saveChanges();
            return soapMessage;
        }

        // Mengambil hasil dari respons SOAP
        private String parseSOAPResponse(SOAPMessage soapResponse) throws Exception {
            SOAPBody soapBody = soapResponse.getSOAPBody();
            SOAPElement responseElement = (SOAPElement) soapBody.getChildElements().next();
            SOAPElement userElement = (SOAPElement) responseElement.getChildElements().next();
            String userId = userElement.getChildElements("id", "http://example.com/namespace").next().getValue();
            String name = userElement.getChildElements("name", "http://example.com/namespace").next().getValue();
            String email = userElement.getChildElements("email", "http://example.com/namespace").next().getValue();
            return "ID: " + userId + "\nName: " + name + "\nEmail: " + email;
        }
    %>
</body>
</html>

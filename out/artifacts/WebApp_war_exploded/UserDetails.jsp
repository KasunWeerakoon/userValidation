<%--
  Created by IntelliJ IDEA.
  User: kasunb
  Date: 3/8/2016
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title></title>
    <%
        JSONObject jsonObject=(JSONObject)session.getAttribute("JSONObj");
        request.setAttribute("JSONObj",jsonObject);

    %>
</head>
<body>
    <P>Name: ${JSONObj.get("name")}</P>
    <P>Age: ${JSONObj.get("age")}</P>
    <P>Address: ${JSONObj.get("addr")}</P>
    <P>email: ${JSONObj.get("email")}</P>
    <P>TP Number: ${JSONObj.get("tpNo")}</P>
    <P>NIC: ${JSONObj.get("NIC")}</P>

</body>
</html>

<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*" %>
<%@ page import="sun.java2d.pipe.BufferedRenderPipe" %>
<html>
<head>

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/userValidation.js"></script>
    <link href="css/myCSS.css" rel="stylesheet">
    <title>jQuery User Validation</title>

</head>
<body>
<%--<jsp:include  page="servlet" />--%>
<%--<c:out value="${message }"></c:out>--%>

<%
    String file = application.getRealPath("/") + "UserFile.txt";
    FileReader is = new FileReader(file);
    BufferedReader br = new BufferedReader(is);
    String s = br.readLine();
    String[] name = new String[10];
    pageContext.setAttribute("readFile", s);


//    for (String s1 : s.split(",")) {
//        int i = 0;
//        name[i] = s1;
//        i++;
//
//    }
%>
<c:set var="msg" value="${readFile}"/>
<c:set var="arrayofmsg" value="${fn:split(msg,',')}"/>

<form id="form" name="" action="servlet" method="post" onsubmit="return ">
    <div class="fieldgroup">

        <table>
            <tbody>
            <tr>
                <td>
                    <label for="name">Name:&nbsp;</label> <input name="name" id="name" size="20"/>
                    <script>
                        document.getElementById("name").value = "<c:out value="${arrayofmsg[0]}"></c:out>";
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="age">Age:&nbsp;</label> <input name="age" id="age" size="20"/>
                    <script>
                        document.getElementById("age").value = "<c:out value="${arrayofmsg[1]}"></c:out>";
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="addr">Address:&nbsp;</label> <input name="addr" id="addr" size="20"/>
                    <script>
                        document.getElementById("addr").value = "<c:out value="${arrayofmsg[2]}"></c:out>";
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="email">Email:&nbsp;</label> <input type="email" name="email" id="email" size="20"/>
                    <script>
                        document.getElementById("email").value = "<c:out value="${arrayofmsg[3]}"></c:out>";
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="tpNo">TP NO:&nbsp;</label> <input name="tpNo" id="tpNo" size="20"/>
                    <script>
                        document.getElementById("tpNo").value = "<c:out value="${arrayofmsg[4]}"></c:out>";
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="NIC">NIC:&nbsp;</label> <input name="NIC" id="NIC" size="20"/>
                    <script>
                        document.getElementById("NIC").value = "<c:out value="${arrayofmsg[5]}"></c:out>";
                    </script>
                </td>
            </tr>


            </tbody>
        </table>
        <p>
            <input class="submit" type="submit" value="Submit"/>
        </p>
    </div>
</form>
</body>
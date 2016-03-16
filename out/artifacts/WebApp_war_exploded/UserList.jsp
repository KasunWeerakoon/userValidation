<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.Files" %>

<%--
  Created by IntelliJ IDEA.
  User: kasunb
  Date: 3/4/2016
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="User.UserServlet" language="java" %>
<%@ page import="User.UserList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.BufferedWriter" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%--<jsp:include page="/User.UserList"/>--%>
<html>
<head>
    <title></title>

</head>
<body>
<%--<%--%>
<%--String message=(String)request.getAttribute("message");--%>
<%--pageContext.setAttribute("msg",message);--%>
<%
    Path path = Paths.get("C:\\Users\\kasunb\\IdeaProjects\\WebApp\\out\\artifacts\\WebApp_war_exploded", "UserFile.txt");
    Charset charset = Charset.forName("ISO-8859-1");
    List<String> datalist = Files.readAllLines(path, charset);
    System.out.println(datalist.get(0));
    System.out.println("data table" + UserServlet.dataTable.get("123123"));

    response.setContentType("text/html");
    PrintWriter pw = response.getWriter();
    BufferedWriter bw = new BufferedWriter(pw);
    //pw.println("Hello user");
//
//      Iterator it = UserServlet.dataTable.entrySet().iterator();
//        while(it.hasNext()){
////          Integer.getInteger(it.next().toString())
//            String s = datalist.get(1);
//            for (String s1 : Arrays.asList(s.split(","))) {
//                pw.println(s1);
//                System.out.println(s1);
//                bw.newLine();
//            }
//            ;
//        }
//      Enumeration<String> keys = UserServlet.dataTable.keys();
//      while (keys.hasMoreElements()){
//        String key=keys.nextElement();

//      }
    List<String> line = new ArrayList<String>();
    List<String> data = new ArrayList<String>();
    List<String> name = new ArrayList<String>();

    Enumeration e = UserServlet.dataTable.keys();
    while (e.hasMoreElements()) {


        String key = (String) e.nextElement();
//        System.out.println(key + " : " + UserServlet.dataTable.get(key));
//        System.out.println(Integer.parseInt("" + UserServlet.dataTable.get(key)));
        String s = datalist.get(Integer.parseInt(UserServlet.dataTable.get(key).toString()) - 1);
//        System.out.println(s);
        line.add("" + Integer.parseInt("" + UserServlet.dataTable.get(key)));
        data.add(s);

//        System.out.println(data);
        List<String> userDetails = Arrays.asList(s.split(","));
        name.add(userDetails.get(0));

        request.setAttribute("data", data);
        request.setAttribute("line", line);
        request.setAttribute("name", name);
    }
%>
<ul>
    <c:forEach items="${data}" var="d" varStatus="i">
        <li>
            <c:out value="${name.get(i.index)}"></c:out>
            <form name="frm" method="post" action="User.UserList">
                <input type="hidden" value="${data.get(i.index)}" name="hdnbt"/>
                <input class="submit" type="submit" name="bt" value="Details"/>
            </form>
        </li>
    </c:forEach>
</ul>

<%--<p>1${message}</p>--%>
<%--<p>2<%= request.getAttribute("message")%></p>--%>
<%--%>--%>
<%--<%=message%>--%>

<%--<p>${data}</p>--%>
<%--<p>Hello, <c:out value="${data}"></c:out></p>--%>
<%--<p>2,${data}</p>--%>

<%--Servlet communicated message to JSP: ${message}--%>
<%--<p> message <c:out value="${message}"></c:out> </p>--%>
<%--Servlet communicated message to JSP: <%=msg%>--%>
</body>
</html>

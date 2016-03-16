package User;

import org.json.simple.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import com.google.gson.JsonObject;
/**
 * Created by kasunb on 3/4/2016.
 */
//@WebServlet(name = "User.UserList")
public class UserList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String message = "Example source code of Servlet to JSP communication.";
//        request.setAttribute("message", message);
//        request.getRequestDispatcher("User.UserList.jsp").forward(request,response);

//        response.setContentType("text/html");
//        PrintWriter pw=response.getWriter();
//        BufferedWriter bw=new BufferedWriter(pw);
//        pw.println("Hello user");
//
//        Iterator it = User.UserServlet.dataTable.entrySet().iterator();
//        while(it.hasNext()){
//            String s = datalist.get(Integer.getInteger(it.next().toString()));
//            for (String s1 : Arrays.asList(s.split(","))) {
//                pw.println(s1);
//                System.out.println(s1);
//                bw.newLine();
//            }
//            ;
//        }
//        bw.close();
//        pw.close();
        String data = request.getParameter("hdnbt").toString();
        List<String> userData = Arrays.asList(data.split(","));
        System.out.println("submit"+data);

        JSONObject obj=new JSONObject();
        obj.put("name",userData.get(0));
        obj.put("age",userData.get(1));
        obj.put("addr",userData.get(2));
        obj.put("email",userData.get(3));
        obj.put("tpNo",userData.get(4));
        obj.put("NIC",userData.get(5));
//        String s = obj.toJSONString();
//        System.out.println(s);
//        response.setContentType("application/json");
//        PrintWriter writer = response.getWriter();
//        writer.print(s);
//        writer.flush();
            HttpSession session = request.getSession(true);
            session.setAttribute("JSONObj",obj);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserDetails.jsp");
            requestDispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Path path= Paths.get("C:\\Users\\kasunb\\IdeaProjects\\WebApp\\out\\artifacts\\WebApp_war_exploded", "UserFile.txt");
//        Charset charset = Charset.forName("ISO-8859-1");
//        List<String> datalist = Files.readAllLines(path, charset);
//        System.out.println(datalist.get(1));
//
//        request.setAttribute("data","Hello User");
//        request.getRequestDispatcher("User.UserList.jsp").forward(request,response);

        String message = "Example source code of Servlet to JSP communication.";
        request.setAttribute("message", message);
        request.getRequestDispatcher("User.UserList.jsp").forward(request,response);


    }
}

package User;

import org.omg.CORBA.INTERNAL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Hashtable;
import java.util.List;

/**
 * Created by kasunb on 3/2/2016.
 */
//@WebServlet(name = "User.UserServlet")
public class UserServlet extends HttpServlet {
    static public Hashtable dataTable=new Hashtable();

    @Override
    public void init() throws ServletException {
        super.init();

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Name = request.getParameter("name");
        String Age = request.getParameter("age");
        // int Age= Integer.getInteger(request.getParameter("age"));
        String Addr = request.getParameter("addr");
        String Email = request.getParameter("email");
        String tpNo = request.getParameter("tpNo");
        String NIC = request.getParameter("NIC");
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.printf("Hello " + Name + ",You have successfully registered");

//        pw.println("Age: "+Age);
//        pw.println("Address: "+Addr);
//        pw.println("Email: "+Email );
//        pw.println("TO No "+ tpNo);

        File outFile = new File(getServletContext().getRealPath("/") + "UserFile.txt");
        FileWriter fw = new FileWriter(outFile,true);
        FileReader fileReader=new FileReader(outFile);
        BufferedReader bufferedReader=new BufferedReader(fileReader);
//        fw.write(Name + "," + Age + "," + Addr + "," + Email + "," + tpNo);
//        fw.write(Name + "," + Age + "," + Addr + "," + Email + "," + tpNo);
        BufferedWriter bw=new BufferedWriter(fw);
        if(!dataTable.contains(NIC)){
            bw.append(Name + "," + Age + "," + Addr + "," + Email + "," + tpNo+","+NIC);
            bw.newLine();
            dataTable.put(NIC,getLineNum(bufferedReader));
        }else {
            dataTable.remove(NIC);
            dataTable.put(NIC,getLineNum(bufferedReader));
            bw.append(Name + "," + Age + "," + Addr + "," + Email + "," + tpNo+","+NIC);
            bw.newLine();
        }
        bw.close();
        fw.close();
        System.out.println(outFile.getAbsolutePath());

        request.setAttribute("titleAttribute", "kittens are fuzzy");



//        LineNumberReader lineNumberReader=new LineNumberReader(fileReader);
//        System.out.println(lineNumberReader.getLineNumber());




        //dataTable.put(NIC,getLineNum(bufferedReader));



    }
    public int getLineNum(BufferedReader reader) throws IOException {
        int lines = 0;
        while (reader.readLine() != null) lines++;
        System.out.println("lines "+lines);
        return lines+1;

    }

    public boolean isAvailable(String NIC){
        return dataTable.get(NIC)==null?false:true;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "hello");
        request.getSession().setAttribute("titleAttribute", "kittens are fuzzy");
    }
}

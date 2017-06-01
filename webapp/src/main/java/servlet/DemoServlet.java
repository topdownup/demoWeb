package servlet;

import org.springframework.web.bind.annotation.RequestMapping;
import services.DemoService;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * Created by lixulong on 2017/5/27.
 * 使用spring-mvc后，这个类就没用了，所有servlet管理在controller中
 */
public class DemoServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
//        PrintWriter out = resp.getWriter();
//        System.out.println("service is :"+(DemoService == null));
//        DemoService se=new DemoService();
//        String str= se.getDemoService();
//        out.append(str);
//        out.flush();
//        out.close();
    }

//    public static void main(String[] args){
//        DemoService se=new DemoService();
//        String str= se.getDemoService();
//        System.out.println("str:"+str);
//    }
}

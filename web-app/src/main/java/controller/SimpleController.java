package controller; /**
 * Created by lixulong on 2017/5/31.
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import services.DemoService;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class SimpleController {
    @Autowired
    DemoService demoService;

    @RequestMapping("/simple-servlet")
    public String doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String str= demoService.getDemoService();

        return str;
    }

//    @RequestMapping("/hello")
//    public String getHello(){
//        return "redirect:/hello.html";
//    }
//
//    @RequestMapping("/index")
//    public String getIndex(){
//        return "redirect:/index.jsp";
//    }

}

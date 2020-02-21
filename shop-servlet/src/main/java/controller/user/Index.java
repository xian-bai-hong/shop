package controller.user;

import com.entity.article.Article;
import com.entity.user.Users;
import com.github.pagehelper.PageInfo;
import com.service.user.impl.UsersImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Index {

    @Autowired
    private UsersImpl service;


    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/dim")
    public String check(String category, @RequestParam(value = "pageNum",
            required = false, defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize",
                                required = false,
                                defaultValue = "8") int pageSize,
                        Model model, HttpSession session) {
        session.setAttribute("category", category);

        List<Article> search = service.search(pageNum, pageSize, category);
        PageInfo pageInfo = new PageInfo(search);
        model.addAttribute("seek", pageInfo);
        return "goodslist";
    }

    @RequestMapping("/sole")
    public String sole(Integer code, Model model) {
        List<Article> articles = service.sole(code);
        PageInfo pageInfo = new PageInfo(articles);
        model.addAttribute("sole", pageInfo);
        return "sole";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/checklogin", method = RequestMethod.GET)
    public ModelAndView login(String username, String password, ModelAndView mv,
                              HttpSession session) {

        Users user = service.login(username, password);
        System.out.println("user = " + user);
        if (user != null) {
            //登录成功，将user对象设置到HttpSession作用范围域中
            session.setAttribute("user", user);
            if (user.getType().equals("管理员")) {
                mv.setViewName("forward:/getAll");
            } else {
                //登录成功，跳转页面　
                mv.setViewName("index");
            }
        } else {
            //登录失败，设置失败信息，并调转到登录页面
            mv.addObject("message", "登录名和密码错误，请重新输入");
            // 登录失败，跳转页面
            mv.setViewName("error");
        }
        return mv;
    }

    //注销方法
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session) {
        //通过session.removeAttribute()方法来注销当前的session
        session.removeAttribute("user");
        return "login";
    }

    //注册
    @RequestMapping("register")
    public String insert1() {
        return "register";
    }

    @RequestMapping("/insert")
    public String insert(Users user) {
        service.insert(user);
        System.out.println("user = " + user);
        return "/login";
    }

    //商品浏览记录
    @RequestMapping("/browse")
    public String browse(){

        return "browse";
    }



}

package controller.user;

import com.entity.article.Article;
import com.entity.user.Users;
import com.github.pagehelper.PageInfo;
import com.service.user.UsersService;
import com.service.user.impl.UsersImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes("user")
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
                                required = false, defaultValue = "8") int pageSize, Model model, HttpSession session) {
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
    //表单提交过来的路径
    @RequestMapping("/checkLogin")
    public String checkLogin(Users user, Model model){
        //调用service方法
        user = service.username(user.getUsername(), user.getPassword());
        System.out.println("user = " + user);
        //若有user则添加到model里并且跳转到成功页面
        if(user != null){
            if (user.getType().equals("管理员")){
                System.out.println("管理");
                return "forward:/getAll";
            }
            System.out.println("普通");
            model.addAttribute("user",user);
            return "forward:/";
        }
        return "login";
    }
}

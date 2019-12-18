package controller.article;

import com.service.Article.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Delete {

    @Autowired
    private ArticleService service;
    @RequestMapping("/del")
    public  String Del(Integer code){
        service.delete(code);
        return "forward:/getAll";

    }
}

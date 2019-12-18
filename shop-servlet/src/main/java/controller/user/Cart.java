package controller.user;

import com.entity.article.Article;
import com.service.Article.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

//购物车
@Controller
public class Cart {
    @Autowired
    private ArticleService service;
    @RequestMapping("addToCart")
    public String addToCart(Article article, HttpSession session, Model model) {
        Map<Article, Integer> cart = (Map<Article, Integer>)session.getAttribute("cart");
        if(cart == null) {
            cart = new HashMap<>();//创建购物车Map集合
            article = service.getById(article.getCode());//从数据库中查询商品信息
            cart.put(article, 1);//向购物车map集合中添加商品
            session.setAttribute("cart", cart);//向session中添加购物车
        }else {
            Integer n = cart.get(article);
            if(n == null) {
                article = service.getById(article.getCode());//从数据库中查询商品信息
                cart.put(article, 1);
            }else {
                cart.put(article, 1+n);
            }
        }
        BigDecimal sum = new BigDecimal(0);
        for(Article g : cart.keySet()) {
            System.out.println("g = " + g);
            sum = sum.add(g.getPrice().multiply( new BigDecimal(cart.get(g))));
        }

        model.addAttribute("sum", sum);
        return "listCart";
    }


}

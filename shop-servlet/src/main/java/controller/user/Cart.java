package controller.user;

import com.entity.article.Article;
import com.entity.cart.Order;
import com.entity.user.Users;
import com.service.Article.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//购物车
@Controller
public class Cart {

    @Autowired
    private ArticleService service;


    @RequestMapping("/listCart")
    public String cart(){
        return "listCart";
    }

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
//            sum = sum.add(g.getPrice().multiply( new BigDecimal(cart.get(g))));
        }

        model.addAttribute("sum", sum);
        return "listCart";
    }
    @RequestMapping("/joinCart")
    @ResponseBody
    public List<Order> joinCart(Integer code, HttpSession session, Model model) {
        //标识符:判断是否存在此商品
        boolean flag = false;
        //通过id查询商品信息
        Article article = service.getById(code);
        //从session中获取购物车信息
        List<Order> shopcart = (List<Order>) session.getAttribute("shopcart");
        //获取用户信息
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            //如果用户为空,则直接返回,让用户登录
            throw new RuntimeException("用户未登录");
        }
        //判断购物车列表是否为空
        if (shopcart == null) {
            //new 一个集合
            shopcart = new ArrayList<>();
        } else {
            for (Order order : shopcart) {
                //判断是否存在此商品,存在则数量+1
                if (order.getNmae().equals(article.getName())) {
                    flag = true;
                    order.setCount(order.getCount() + 1);
                    order.setSubtotal( (order.getCount() * article.getPrice()));
                }
            }
        }
        //如果购物车中没有当前商品的信息,则新增商品
        if (!flag) {
            Order order = new Order();
            order.setNmae(article.getName());
            order.setCount(1);
            order.setSubtotal(article.getPrice());
            //把商品加入集合
            shopcart.add(order);
        }
        //计算总价格
        Double total = 0d;
        for (Order order : shopcart) {
            total += order.getSubtotal();
        }
        for (Order order : shopcart) {
            order.setTotal(total);
        }
        //设置session
        session.setAttribute("shopcart", shopcart);
        //返回list
        return shopcart;
    }

}

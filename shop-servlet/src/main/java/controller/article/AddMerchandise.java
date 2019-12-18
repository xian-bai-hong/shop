package controller.article;

import com.entity.article.Article;
import com.github.pagehelper.PageInfo;
import com.service.Article.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;


@Controller
public class AddMerchandise {

    @Autowired
    private ArticleService service;

    @GetMapping("/getAll")
   public String list(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") int pageNum,
                      @RequestParam(value = "pageSize",
                              required = false, defaultValue = "6") int pageSize, Model model){
        List<Article> articles = service
                .getAll(pageNum, pageSize);

        PageInfo pageInfo = new PageInfo(articles);

        model.addAttribute("list", pageInfo);
        return "list";
    }

    @RequestMapping("/getAll")
    public String list2(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize",
                               required = false, defaultValue = "6") int pageSize, Model model) {
        List<Article> articles = service
                .getAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(articles);
        model.addAttribute("list", pageInfo);
        return "list";
    }


    @RequestMapping("/add")
    public String insert() {
        return "add";
    }


    @PostMapping("/add2")
    public String insert(MultipartFile myfile, Article article) throws IOException {
        System.out.println(article.getImages());
        //保存图片
        String filePath = "D:/item/shop/shop-servlet/web/WEB-INF/img";//图片存放的位置

        String filename = myfile.getOriginalFilename();//获取原图片的拓展名
        System.out.println(filename);
        String newFileNmae = UUID.randomUUID() + filename;//新的文件名字

        File targetFile = new File(filePath, newFileNmae);//封装上传文件位置的全路径

        myfile.transferTo(targetFile);

        article.setImages(newFileNmae);

        service.add(article);

        return "forward:/getAll";
    }

}

package controller.article;

import com.entity.article.Article;
import com.service.Article.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/update")
public class Update {
    @Autowired
    private ArticleService service;

    @RequestMapping("/getUser")
    public String getUser(String code,Model model){
        Integer id = 0;
        if (code != null && code != "") {
            id= Integer.valueOf(code);
        }
        System.out.println("id = " + id);
        model.addAttribute("shopinfo", service.getById(id));
        return "/update";
    }



    @RequestMapping("/update")
    public String UpdateUser(Model model, Article article, MultipartFile myfile) throws IOException {

        System.out.println("进入修改serlvet");
        System.out.println("shopInfo = " + article);
        //保存图片
        String filePath = "D:/item/shop/shop-servlet/web/WEB-INF/img";//图片存放的位置

        String filename = myfile.getOriginalFilename();//获取原图片的拓展名
        System.out.println(filename);
        String newFileNmae = UUID.randomUUID() + filename;//新的文件名字

        File targetFile = new File(filePath, newFileNmae);//封装上传文件位置的全路径

        myfile.transferTo(targetFile);

        article.setImages(newFileNmae);


        if(service.update(article)){
            article = service.getById(article.getCode());

            model.addAttribute("shopinfo", article);
            return "forward:/getAll";
        }
        return "/update";




    }



}

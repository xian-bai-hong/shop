package com.service.user;

import com.entity.article.Article;
import com.entity.user.Users;

import java.util.List;

public interface UsersService {
    //登陆
    Users login(String username, String password);

    //注册
    void insert(Users users);

    //模糊查询并分页
    List<Article> search(int pageNum, int pageSize, String category);

    //查询商品详细信息
    List<Article> sole(Integer code);
}

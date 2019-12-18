package com.service.user;

import com.entity.article.Article;
import com.entity.user.Users;

import java.util.List;

public interface UsersService {
    Users username(String username,String password);
     void insert(Users users);
    List<Article>  search(int pageNum,int pageSize,String category);
    List<Article> sole(Integer code);
}

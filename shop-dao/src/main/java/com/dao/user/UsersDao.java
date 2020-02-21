package com.dao.user;

import com.entity.article.Article;
import com.entity.user.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersDao {

    //登陆
    Users login(@Param("username") String username,@Param("password") String password);

    void insert(Users users);

    List<Article> search(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize,@Param("category") String category);

    List<Article> sole(Integer code );
}

package com.dao.user;

import com.entity.article.Article;
import com.entity.user.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersDao {

    //查找用户名
    Users username(String username);

    void insert(Users users);

    List<Article> search(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize,@Param("category") String category);

    List<Article> sole(Integer code );
}

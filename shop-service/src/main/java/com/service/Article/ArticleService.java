package com.service.Article;

import com.entity.article.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleService {
    List<Article> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    void add(Article article);

    boolean update(Article article);

    Article getById(Integer code);
    void delete(Integer code);
}

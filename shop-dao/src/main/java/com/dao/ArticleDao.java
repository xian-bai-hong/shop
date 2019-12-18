package com.dao;

import com.entity.article.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleDao {

    //查询并分页
    List<Article> getAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    //添加
    void add(Article article);

    //修改
    boolean update(@Param("shop") Article article);

    //修改前的查询
    Article getById(Integer code);
    //删除
    void delete(Integer code);
}

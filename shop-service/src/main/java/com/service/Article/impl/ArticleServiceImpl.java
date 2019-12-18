package com.service.Article.impl;

import com.dao.ArticleDao;
import com.entity.article.Article;
import com.service.Article.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao dao;
    @Override
    public List<Article> getAll(int pageNum, int pageSize) {
        return dao.getAll(pageNum,pageSize);
    }

    @Override
    public void add(Article article) {
        dao.add(article);
    }

    @Override
    public boolean update(Article article) {
        System.out.println("shopInfo = " + article);
        return dao.update(article);
    }

    @Override
    public Article getById(Integer code) {
        return dao.getById(code);
    }

    @Override
    public void delete(Integer code) {
        dao.delete(code);
    }


}

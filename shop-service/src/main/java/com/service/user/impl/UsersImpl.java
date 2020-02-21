package com.service.user.impl;

import com.dao.user.UsersDao;
import com.entity.article.Article;
import com.entity.user.Users;
import com.service.user.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersImpl implements UsersService {

    @Autowired
    private UsersDao dao;

    //登陆
    @Override
    public Users login(String username, String password) {
        return dao.login(username, password);
    }

    //注册
    @Override
    public void insert(Users users) {
        dao.insert(users);
    }

    //模糊查询并分页
    @Override
    public List<Article> search(int pageNum, int pageSize, String category) {
        return dao.search(pageNum, pageSize, category);
    }

    //查询商品详细信息
    @Override
    public List<Article> sole(Integer code) {
        return dao.sole(code);
    }
}

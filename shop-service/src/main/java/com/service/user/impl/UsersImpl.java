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

        //校验用户登录
    @Override
    public Users username(String username, String password) {
        Users user = dao.username(username);
        if(user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    @Override
    public void insert(Users users) {
        dao.insert(users);
    }

    @Override
    public List<Article> search(int pageNum, int pageSize, String category) {
        return dao.search(pageNum, pageSize, category);
    }

    @Override
    public List<Article> sole(Integer code) {
        return dao.sole(code);
    }
}

package com.entity.user;

import lombok.Data;

//用户实体类
@Data
public class Users {
    private Integer id;
    private String username;
    private String password;
    private String type;
}

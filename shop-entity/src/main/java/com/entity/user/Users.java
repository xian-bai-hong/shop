package com.entity.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

//用户实体类
@Data
public class Users {
    private Integer id;
    @NotBlank(message = "用户名不能为空")
    private String username;
    @NotBlank(message = "密码不能为空")
    private String password;
    private String type;
}

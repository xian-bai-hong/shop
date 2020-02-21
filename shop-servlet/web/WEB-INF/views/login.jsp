<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号登录</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/css/layui/css/layui.css" media="all">
    <link rel="start icon" href="/static/images/resize_png_new.png">
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/checklogin" style=" text-align: center;margin-top: 200px">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width: 200px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width: 200px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" style="width: 200px">登录</button>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/">直通车</a>
</form>
</body>
</html>

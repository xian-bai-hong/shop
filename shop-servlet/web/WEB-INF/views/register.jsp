<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static/css/layui/css/layui.css" media="all">
    <link rel="start icon" href="/static/images/resize_png_new.png">
</head>
<body>



<form class="layui-form" action="${pageContext.request.contextPath}/insert"
      style=" text-align: center;margin-top: 200px">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">请输入账号</label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="username" lay-verify="required|phone" autocomplete="off"
                       class="layui-input"  style="width: 200px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">请输入密码</label>
            <div class="layui-input-inline">
                <input type="password" id="pwd" name="password" lay-verify="required|phone" autocomplete="off"
                       class="layui-input" style="width: 200px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" id="pwd2" name="" lay-verify="required|phone" autocomplete="off"
                       class="layui-input" style="width: 200px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="sub" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="check()" type="submit"
                    style="width: 200px">注册
            </button>
        </div>
    </div>
</form>

</body>
</html>

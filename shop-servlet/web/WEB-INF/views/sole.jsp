<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详细信息</title>
    <link href="static/css/details.css" rel='stylesheet' type='text/css'/>
    <link href="static/css/shopping.css" rel='stylesheet' type='text/css'/>
    <link href="/static/css/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <script src="/static/js/layui.js"></script>
    <link rel="start icon" href="images/resize_png_new.png">
    <style>
        .checktxt{
            text-align: left;
            position: absolute;
            width: 450px;
            height: 40px;
            left: 360px;
            top: 70px;
            margin-top:10px;
            border: 2px solid red ;
        }
        .btn-disabled{
            margin-left: 810px;
            margin-top: -51px;
            background-color: red;
            color: white;
            width: 80px;
            height: 40px;
            border: 0px;
        }
    </style>
</head>
<body>

<div class="top1">
</div>
<div class="top-middle">

</div>
<div class="top-right">
    <ul>
        <li><a href="${pageContext.request.contextPath}/">首页</a></li>

        <li><a href="#">最近浏览</a></li>

        <li><a href="#">关于我们</a></li>

        <li><a href="${pageContext.request.contextPath}/login" target="_blank">登录</a></li>

        <li><a href="register.html" target="_blank">注册</a></li>
    </ul>
</div>

<div class="header1">
    <div class="header1">
        <div id="logo"><a href="${pageContext.request.contextPath}/"> <img style="width: 180px" src="images/logo_img_sc.jpg" alt="购物网logo" title="购物网"/> </a></div>
    </div>

    <div class="icon2"><a id="displayCart" href="${pageContext.request.contextPath}/addToCart">
        <i class="layui-icon layui-icon-cart" style="font-size: 30px; color: #1E9FFF;"></i></a>
    </div>
    <div >
        <form action="${pageContext.request.contextPath}/dim" method="post" >

            <input class="checktxt" type="text" name="category" placeholder="请输入关键字"/>
            <input class="btn-disabled" type="submit"  value="查询" />

        </form>
    </div>
</div>


<br>
<br>
<div class="div">
<c:forEach items="${sole.list}" var="sole">
    <input type="text" name="code" value="${sole.code}" style="display: none">
    <div class="menu-A1  div" >
        <div class="menu-a1 div">
            <c:if test="${sole.images !=null }">
                <img class="imgbig" width="300" height="400" alt="" src="/shop/${sole.images}">
            </c:if>
        </div>
    </div>
    <div  class="div">
            ${sole.notice}
    </div>
    <div class="div">
        <span style="color: red">￥${sole.price}</span>
    </div>
    <div class="div">
            ${sole.mezz}
    </div>

    <div>
        <a href="${pageContext.request.contextPath}/addToCart?code=${sole.code}" > <button type="button" class="layui-btn layui-btn-primary" style="background-color: red;color: white" >加入购物车</button></a>
    </div>
    <a href="javascript:history.go(-1)">返回商品信息页面</a>
</c:forEach>
</div>

</body>
</html>

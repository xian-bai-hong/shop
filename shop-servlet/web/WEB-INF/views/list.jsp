<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/3
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台页面</title>





    <link rel="start icon" href="logo/resize_png_new.png">
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        #images {
            width: 100px;
            height: 50px;
        }

        div {
            /*border: lawngreen 1px solid;*/
            float: left;
        }

        a {
            text-decoration: none
        }

        a:link { /*默认状态*/
            color: black;
        }

        a:visited { /*浏览过的*/
            color: black;
        }

        a:hover { /*悬浮状态*/
            color: red;
        }

        a:active { /*激活过的*/
            color: red;
        }

        td, tr {

            text-align: center;
            border: 1px black solid;
            width: 1000px;

        }

        body {
            border: 1px solid #dddddd;
            padding-top: 20px;
            margin-bottom: 70px;
            background: url(../images/register_bg.jpg) bottom no-repeat white;
        }
    </style>
</head>
<body>


<table style="border: 1px black solid ;width: 1366px" cellspacing="0" cellpadding="0">
    <tr>
        <td>商品编号</td>
        <td>商品名字</td>
        <td>商品描述</td>
        <td>商品价格</td>
        <td>商品图片</td>
        <td>商品类型</td>
        <td>商品品牌</td>
        <td>操作</td>
    </tr>


    <c:forEach var="list" items="${list.list}">
        <tr>
            <td>${list.code}</td>

            <td>${list.name}</td>
            <td>
                <span style="font-size: 10px">${list.notice}</span>
            </td>
            <td>
                <span style="color:red;">￥${list.price}</span>
            </td>
            <td>
                <c:if test="${list.images !=null }">
                    <img id="images" alt="" src="/shop/${list.images}">
                </c:if>
            </td>
            <td>${list.category}</td>
            <td>${list.mezz}</td>
            <td>
                <button type="button" class="layui-btn "><a
                        href="${pageContext.request.contextPath}/update/getUser?code=${list.code}">修改</a></button>
                <button type="button" class="layui-btn"><a
                        href="${pageContext.request.contextPath}/del?code=${list.code}">删除</a></button>
            </td>
        </tr>
    </c:forEach>
</table>

<div style="width: 1366px;text-align: center">
    <ul class="pagination">
        <li><a href="/getAll?pageNum=1">首页</a></li>
        <li><a href="/getAll?pageNum=${list.prePage}">上一页</a></li>
        <c:forEach items="${list.navigatepageNums}" var="a">
            <li><a href="/getAll?pageNum=${a}">${a}</a></li>
        </c:forEach>
        <li><a href="/getAll?pageNum=${list.nextPage}">下一页</a></li>
        <li><a href="/getAll?pageNum=${list.pages}">尾页</a></li>
        <li><a href="${pageContext.request.contextPath}/add">添加</a></li>
    </ul>
</div>


</body>


</html>

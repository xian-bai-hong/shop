<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
<body>
<div style="text-align:center;">
    <h1>我的购物车</h1>
    <table border="1" width="700" align="center">
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>单价</th>
            <th>数量</th>
            <th>小计</th>
        </tr>
        <c:forEach items="${ cart }" var="entry">
            <tr>
                <td>${entry.key.code}</td>
                <td>${entry.key.name}</td>
                <td>${entry.key.price}</td>
                <td>${entry.value}</td>
                <td>${ entry.key.price*entry.value }</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5">
                总计：${ sum }
            </td>
        </tr>

        <tr>
            <td>
                <a href="#">结算</a>
            </td>
            <td colspan="5">
                <a href="javascript:history.go(-1)">返回商品信息页面</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>

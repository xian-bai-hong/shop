<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>商品列表</title>
    <link href="/static/css/shopping.css" rel='stylesheet' type='text/css'/>
    <link href="/static/css/shoplist.css" rel='stylesheet' type='text/css'/>
    <link rel="start icon" href="/static/images/resize_png_new.png">
    <link href="/static/css/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <script src="/static/js/layui.js"></script>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <style>
        #images {
            width: 150px;
            height: 180px;
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
        .dic {
            float: left;
        }
        .div-body2 {
            width: 1360px;
            height: 550px;
            float: left;
        }
        .div-body {
            margin-top: 15px;
            float: left;
            width: 800px;

            margin: auto;
            margin-left: 23%;
        }
        .checktxt{
            text-align: left;
            position: absolute;
            width: 450px;
            height: 40px;
            left: 360px;
            top: 70px;
            border: 2px solid red ;
        }
        .btn-disabled{
            margin-left: 810px;
            margin-top: -61px;
            background-color: red;
            color: white;
            width: 80px;
            height: 40px;
            border: 0px;
        }
    </style>
</head>
<body>
<!------header top------->
<div class="top1">
    <div class="top-left">
        <c:if test="${user != null}">
            <ul>
                <li style="color: whitesmoke"> <strong> 欢迎您:${sessionScope.user.username}!</strong>
                    <a style="color: whitesmoke" href="${pageContext.request.contextPath}/outLogin">注销</a>
                </li>
            </ul>
        </c:if>

    </div>
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


<!------header top------->
<div>
<div class="header1">
    <div id="logo"><a href="${pageContext.request.contextPath}/"> <img style="width: 180px" src="/static/images/logo_img_sc.jpg" alt="购物网logo" title="购物网"/> </a></div>
</div>

<div class="icon2"><a id="displayCart" href="${pageContext.request.contextPath}/addToCart">
    <i class="layui-icon layui-icon-cart" style="font-size: 30px; color: #1E9FFF;"></i></a>
</div>
    <div >
        <form action="${pageContext.request.contextPath}/dim" method="post" >
            <fieldset>
                <input class="checktxt" type="text" name="category"  placeholder="请输入关键字"/>
                <input class="btn-disabled" type="submit"  value="查询" />
            </fieldset>
        </form>
    </div>
</div>

<div class="div-body2">

    <div class="div-body">
        <c:forEach var="seek" items="${seek.list}">
            <input type="text" name="code" value="${seek.code}" style="display: none">
            <div style="width: 180px;text-align: center" class="dic">
                <c:if test="${seek.images !=null }">
                    <img id="images" alt="" src="/shop/${seek.images}">
                </c:if>
                <br>
                <div style="width: 180px;padding-left:10px; " class="dic">
                    <br>
                    <a href="${pageContext.request.contextPath}/sole?code=${seek.code}" style="font-size:10px"><span>${seek.notice}</span></a>
                </div>
                <br>
                <span style="color:red; ">￥${seek.price}</span>
            </div>
        </c:forEach>
    </div>
</div>


</div>
<div style="width: 1366px;text-align: center">
    <ul class="pagination">
        <li><a href="/dim?pageNum=1&category=${category}">首页</a></li>
        <li><a href="/dim?pageNum=${seek.prePage}&category=${category}">上一页</a></li>
        <c:forEach items="${seek.navigatepageNums}" var="a">
            <li><a href="/dim?pageNum=${a}&category=${category}">${a}</a></li>
        </c:forEach>
        <li><a href="/dim?pageNum=${seek.nextPage}&category=${category}">下一页</a></li>
        <li><a href="/dim?pageNum=${seek.pages}&category=${category}">尾页</a></li>
    </ul>
</div>

<!--------footer --------->
<script type="text/javascript" src="script/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="script/js.js"></script>




</body>
</html>

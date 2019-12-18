<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/5
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/static/css/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <script src="/static/js/layui.js"></script>
    <title>修改</title>
    <style>
        .as {
            float: left;
        }
    </style>
</head>
<body>

<div class="as" style="text-align: center">

    <form class="layui-form" action="${pageContext.request.contextPath}/update/update" method="post"
          enctype="multipart/form-data" style="margin-left: 550px;margin-top: 30px">
        <input type="text" name="code" value="${shopinfo.code}" style="display: none">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名字</label>
            <div class="layui-input-block">
                <input type="text" name="name" required lay-verify="required" value="${shopinfo.name}"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <br>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品内容</label>
            <div class="layui-input-block">

                <textarea name="notice" class="layui-textarea">${shopinfo.notice}</textarea>
            </div>
        </div>
        <br>
        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="price" required lay-verify="required" value="${shopinfo.price}"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <br>
        <div class="layui-form-item">
            <label class="layui-form-label">商品图片</label>
            <div class="layui-input-block">
                <input type="file" name="myfile" id="myfile" required lay-verify="required" autocomplete="off" >
            </div>
        </div>

        <br>
        <div class="layui-form-item">
            <label class="layui-form-label">商品分类</label>
            <div class="layui-input-block">
                <input type="text" name="category" required lay-verify="required" value="${shopinfo.category}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <br>
        <div class="layui-form-item">
            <label class="layui-form-label">商品品牌</label>
            <div class="layui-input-block">
                <input type="text" name="mezz" required lay-verify="required" value="${shopinfo.mezz}"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });


</script>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>购物网首页</title>
    <link href="/static/css/shopping.css" rel='stylesheet' type='text/css'/>
    <link href="/static/css/shoplist.css" rel='stylesheet' type='text/css'/>
    <link href="/static/css/lunbo.css" rel="stylesheet" type="text/css"/>
    <link rel="start icon" href="images/resize_png_new.png">
    <link href="/static/css/layui/css/layui.css" type="text/css" rel="stylesheet"/>
    <script src="/static/js/layui.js"></script>
    <style>
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
<div class="top1">
    <div class="top-left">

    </div>

    <div class="top-right">
        <ul>
            <li><a href="#">最近浏览</a></li>

            <li><a href="#">关于我们</a></li>

            <li><a href="${pageContext.request.contextPath}/login" target="_blank">登录</a></li>

            <li><a href="#" target="_blank">注册</a></li>
        </ul>
    </div>
</div>

<!------ end header top------->
<!-----start header logo------->
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

<div class="container">
    <div class="slider">
        <div class="area">
            <div id=js class="js" >
                <!--        图片轮播-->
                <div id="container" >
                    <div id="list" style="left: -800px">
                        <img src="images/banner_01.jpg" alt="1" class="pic"/>
                        <img src="images/banner_01.jpg" alt="1" class="pic"/>
                        <img src="images/banner_02.jpg" alt="2" class="pic"/>
                        <img src="images/banner_03.jpg" alt="3" class="pic"/>
                        <img src="images/banner_04.jpg" alt="4" class="pic"/>
                        <img src="images/banner_05.jpg" alt="5" class="pic"/>
                    </div>
                    <div id="buttons">
                        <span index="1" class="on"></span>
                        <span index="2"></span>
                        <span index="3"></span>
                        <span index="4"></span>
                        <span index="5"></span>
                    </div>
                    <a href="javascript:;" id="prev" class="arrow">&lt;</a>
                    <a href="javascript:;" id="next" class="arrow">&gt;</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container-right">
        <div class="container1">
            <div class="pic-sale1"><img src="images/sale (2).jpg" title="粉色衬衣"/></div>
            <h4><a href="${pageContext.request.contextPath}/dim?category=衬衫">纯棉商务休闲衬衣</a></h4>
            <br>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;精致与休闲造型兼备的牛津纺衬衫。简约素雅的风格，新潮百搭

            </p>
        </div>
        <br/>
        <div class="container2">
            <div class="pic-sale2"><img src="images/sale (3).jpg" title="儿童卫衣"/></div>
            <br/>
            <h4><a href="${pageContext.request.contextPath}/dim?category=儿童卫衣">亲子儿童卫衣</a></h4>
            <br>
            <p>2014秋装新款女神的新衣张馨予同款亲子装儿童装卫衣 朗姿LANCY

            </p>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <div class="container3">
            <div class="pic-sale3"><img width="110" src="images/14.jpg" title="鞋子"/></div>
            <h4><a href="${pageContext.request.contextPath}/dim?category=鞋子">鞋子</a></h4>
            <p>佰缌2014秋冬新款欧美尖头粗跟短靴高跟 防水台真皮铆钉女式靴子
            </p>
        </div>
    </div>
</div>
<!--------end content1--------->

<!--------start content 2--------->

<div class="popular">
    <div class="popular1"><a href="${pageContext.request.contextPath}/dim?category=衣服"><img src="images/pic1.jpg"/>
        <div class="look">
            <h4>流行风向</h4>
            <p>查看更多</p>
        </div>
    </a></div>
    <div class="popular1"><a href="${pageContext.request.contextPath}/dim?category=卫衣"><img src="images/pic2.jpg"/>
        <div class="look">
            <h4>时尚前沿</h4>
            <p>查看更多</p>
        </div>
    </a></div>
    <div class="popular1"><a href="${pageContext.request.contextPath}/dim?category=鞋子"> <img src="images/pic3.jpg"/>
        <div class="look">
            <h4>踮起脚尖</h4>
            <p>查看更多</p>
        </div>
    </a></div>
    <div class="popular1"><a href="${pageContext.request.contextPath}/dim?category=背包"><img src="images/pic4.jpg"/>
        <div class="look">
            <h4>独一无二</h4>
            <p>查看更多</p>
        </div>
    </a></div>
</div>



<br/>




<script type="text/javascript" src="script/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="script/js.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".area").hover(function () {
                $(this).find(".qq").show(100);
            }
            , function () {
                $(this).find(".qq").hide(100);
            });
    });
</script>
<script type="text/javascript">
    /* 知识点：        */
    /*       this用法 */
    /*       DOM事件 */
    /*       定时器 */

    window.onload = function () {
        var container = document.getElementById('container');
        var list = document.getElementById('list');
        var buttons = document.getElementById('buttons').getElementsByTagName('span');
        var prev = document.getElementById('prev');
        var next = document.getElementById('next');
        var index = 1;
        var timer;

        function animate(offset) {
            //获取的是style.left，是相对左边获取距离，所以第一张图后style.left都为负值，
            //且style.left获取的是字符串，需要用parseInt()取整转化为数字。
            var newLeft = parseInt(list.style.left) + offset;
            list.style.left = newLeft + 'px';
            //无限滚动判断
            if (newLeft > -800) {
                list.style.left = -3000 + 'px';
            }
            if (newLeft < -3000) {
                list.style.left = -800 + 'px';
            }
        }

        function play() {
            //重复执行的定时器
            timer = setInterval(function () {
                next.onclick();
            }, 2000)
        }

        function stop() {
            clearInterval(timer);
        }

        function buttonsShow() {
            //将之前的小圆点的样式清除
            for (var i = 0; i < buttons.length; i++) {
                if (buttons[i].className == "on") {
                    buttons[i].className = "";
                }
            }
            //数组从0开始，故index需要-1
            buttons[index - 1].className = "on";
        }

        prev.onclick = function () {
            index -= 1;
            if (index < 1) {
                index = 5
            }
            buttonsShow();
            animate(800);
        };

        next.onclick = function () {
            //由于上边定时器的作用，index会一直递增下去，我们只有5个小圆点，所以需要做出判断
            index += 1;
            if (index > 5) {
                index = 1
            }
            animate(-800);
            buttonsShow();
        };

        for (var i = 0; i < buttons.length; i++) {
            (function (i) {
                buttons[i].onclick = function () {

                    /*   这里获得鼠标移动到小圆点的位置，用this把index绑定到对象buttons[i]上，去谷歌this的用法  */
                    /*   由于这里的index是自定义属性，需要用到getAttribute()这个DOM2级方法，去获取自定义index的属性*/
                    var clickIndex = parseInt(this.getAttribute('index'));
                    var offset = 800 * (index - clickIndex); //这个index是当前图片停留时的index
                    animate(offset);
                    index = clickIndex; //存放鼠标点击后的位置，用于小圆点的正常显示
                    buttonsShow();
                }
            })(i)
        }

        container.onmouseover = stop;
        container.onmouseout = play;
        play();

    }
</script>
</body>
</html>

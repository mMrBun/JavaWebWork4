<%@ page import="com.xxxx.service.UserService" %>
<%@ page import="com.xxxx.entity.vo.MessageModel" %><%--
  Created by IntelliJ IDEA.
  User: Xu hui
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="css/Login.css">

</head>
<body>
<div class="titlepage">
    <form action="login" method="post" id="loginForm">
        <div id="div_uname">
            <img class="img_uname" src="ImgSource/user%20(1).png"width="25px"height="25px">
            <input type="text" name="uname" id="uname" value="${messageModel.object.userName}" >
            <span id="warning_uname"></span>
        </div>
        <div id="div_upwd">
            <img class="img_pwd" src="ImgSource/password.png"width="25px"height="25px">
            <input type="password" name="upwd" id="upwd" value="${messageModel.object.userPwd}"> <br>
            <span id="warning_upwd"></span>
        </div>
        <div id="div_validationCode">
            <img class="img_validationCode" src="ImgSource/code%20(2).png"width="25px"height="25px">
            <input type="text" name="validationCode" id="validationCode" placeholder="请输入验证码" lay-verify="required">

        </div>
        <div style="clear: both;width: 170px;height: 30px;">
            <span id="warning_code"></span>
        </div>
        <div id="div_validationCode_img">
            <img src="validate.jsp" id="validationCode_img" title="看不清?换一个" onclick="loadimage();return false;" name="validationCode_img" align="middle">
        </div>
        <div style="width: 200px;">
            <input type="checkbox"name="OneWeekLogin"value="ok" >一周内免登录
            <a id="signin" href="javascript:;" style="float: right;">免费注册</a>
        </div>

        <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span> <br>
        <div class="tel">
            <p style="font-size:30px;font-family: 'Microsoft YaHei UI Light';color:white">立即登陆</p>
        </div>
    </form>
</div>
<div id="sign_in">
    <form action="Signin" method="post" id="SignForm">
        <div class="sin">
            <img class="img_logo" src="ImgSource/user%20(1).png"width="25px"height="25px">
            <input type="text" name="sign_uname" id="sign_uname" class="sign_content"placeholder="用户名">
            <span id="WM_name"></span>
        </div>
        <div class="sin">
            <img class="img_logo" src="ImgSource/user%20(1).png"width="25px"height="25px">
            <input type="text" name="sign_realname"id="sign_realname" class="sign_content"placeholder="真实姓名" >
            <span id="WM_realname"></span>
        </div>
        <div class="sin">
            <img class="img_logo" src="ImgSource/email.png"width="25px"height="25px">
            <input type="text" name="sign_email"id="sign_email" class="sign_content"placeholder="电子邮箱" >
            <span id="WM_email"></span>
        </div>
        <div id="city_1">
            <img class="img_logo" src="ImgSource/address.png"width="25px"height="25px">
            <select class="prov"id="sign_prow" name="sign_prow"></select>
            <select class="city"id="sign_city" name="sign_city" disabled="disabled"></select>
            <span id="WM_address"></span>
        </div>
        <div class="sin">
            <img class="img_logo" src="ImgSource/password.png"width="25px"height="25px">
            <input type="text" name="sign_pwd"id="sign_pwd" class="sign_content"placeholder="密码" >
            <span id="WM_pwd"></span>
        </div>
        <div class="sin">
            <img class="img_logo" src="ImgSource/password.png"width="25px"height="25px">
            <input type="text" name="sign_checkpwd"id="sign_checkpwd" class="sign_content"placeholder="确认密码">
            <span id="WM_checkpwd"></span>
        </div>
        <div class="btn_signin">
            <p style="font-size:30px;font-family: 'Microsoft YaHei UI Light';color:white">注册</p>
        </div>
    </form>
</div>
</body>
<%-- 引入Jquery的js文件 --%>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/jquery.cityselect.js"></script>
<script type="text/javascript">
    /**
     * 登录表单验证
         1. 给登录按钮绑定点击事件（通过id选择器绑定）
         2. 获取用户姓名和密码的值
         3. 判断姓名是否为空
            如果姓名为空，提示用户（span标签赋值），并且return
         4. 判断密码是否为空
            如果密码为空，提示用户（span标签赋值），并且return
         5. 如果都不为空，则手动提交表单
     */
    window.addEventListener("beforeunload",function (ev) {
        <%
        Cookie[]cookies=request.getCookies();
        String usrname="";
        String usrpwd="";
        if (cookies!=null&&cookies.length>0) {
            for (Cookie cookie : cookies) {
                String name = cookie.getName();
                if (name.equals("uname")) {
                    usrname = cookie.getValue();
                }
                String pwd = cookie.getName();
                if (pwd.equals("upwd")) {
                    usrpwd = cookie.getValue();
                }
            }
            if (usrname != null && usrpwd != null) {
                UserService userService = new UserService();
                MessageModel messageModel = userService.userLogin(usrname, usrpwd, true);
                if (messageModel.getCode() == 1) {
                    request.getSession().setAttribute("user", messageModel.getObject());
                    request.getSession().setAttribute("dwnFile1", messageModel.getFile1());
                    request.getSession().setAttribute("dwnFile2", messageModel.getFile2());
                    request.getSession().setAttribute("dwnFile3", messageModel.getFile3());
                    response.sendRedirect("index.jsp");
                }
            }
        }
        %>
    });

    $(".tel").click(function () {
        // 获取用户姓名和密码的值
        var uname = $("#uname").val();
        var upwd = $("#upwd").val();
        var ucode=$("#validationCode").val();
        // 判断姓名是否为空
        if (isEmpty(uname)) {
            // 如果姓名为空，提示用户（span标签赋值），并且return  html()
            // $("#msg").html("用户姓名不可为空！");
            return;
        }
        // 判断密码是否为空
        if (isEmpty(upwd)) {
            // 如果密码为空，提示用户（span标签赋值），并且return  html()
            // $("#msg").html("用户密码不可为空！");
            return;
        }
        if(isEmpty(ucode))
        {
            // $("#msg").html("验证码不能为空");
            return;
        }
        // 如果都不为空，则手动提交表单
        $("#loginForm").submit();
    });
    //加载验证码图片，后面加时间可以保证每次页面刷新时验证码也刷新
    function loadimage(){
        document.getElementById("validationCode_img").src= "validate.jsp?time=" + new Date().getTime();
    }
    /**
     * 判断字符串是否为空
     *      如果为空，返回true
     *      如果不为空，返回false
     * @param str
     * @returns {boolean}
     */

    function isEmpty(str) {
        if (str == null || str.trim() == "") {
            return true;
        }
        return  false;
    }
</script>
<script type="text/javascript">

    function checkuname() {
        var uname=$("#uname").val();
        if(uname.trim()=="")
        {
            $("#warning_uname").css("color","red");
            $("#warning_uname").html("用户名不能为空");
        }
        else
        {
            $("#warning_uname").html(" ");
        }
    }
    function checkpwd() {
        var uname=$("#upwd").val();
        if(uname.trim()=="")
        {
            $("#warning_upwd").css("color","red");
            $("#warning_upwd").html("密码不能为空");
        }
        else
        {
            $("#warning_upwd").html(" ");
        }
    }
    function checkcode() {
        var uname=$("#validationCode").val();
        if(uname.trim()=="")
        {
            $("#warning_code").css("color","red");
            $("#warning_code").html("验证码不能为空");
        }
        else
        {
            $("#warning_code").html(" ");
        }
    }
    function checksignname() {
        var name =$("#sign_uname").val();
        if(name.trim()=="")
        {
            $("#WM_name").css("color","red");
            $("#WM_name").html("用户名不能为空");
        }
        else
        {
            $("#WM_name").html(" ");
        }
    }
    function checksigrealname() {
        var name =$("#sign_realname").val();
        if(name.trim()=="")
        {
            $("#WM_realname").css("color","red");
            $("#WM_realname").html("真实姓名不能为空");
        }
        else
        {
            $("#WM_realname").html(" ");
        }
    }
    function checksigemail() {
        var name =$("#sign_email").val();
        if(name.trim()=="")
        {
            $("#WM_email").css("color","red");
            $("#WM_email").html("电子邮箱不能为空");
        }
        else
        {
            $("#WM_email").html(" ");
        }
    }
    function checksigaddr() {
        var name =$("#sign_prow").val();
        var name1=$("#sign_city").val();
        if(name.trim()==""||name1.trim()=="")
        {
            $("#WM_address").css("color","red");
            $("#WM_address").html("二级地址选择不能为空");
        }
        else
        {
            $("#WM_address").html(" ");
        }
    }
    function checksignpwd() {
        var name =$("#sign_pwd").val();

        if(name.trim()=="")
        {
            $("#WM_pwd").css("color","red");
            $("#WM_pwd").html("密码不能为空");
        }
        else
        {
            $("#WM_pwd").html(" ");
        }
    }
    function checksignrepeatpwd() {
        var name =$("#sign_checkpwd").val();
        var pwd=$("#sign_pwd").val();
        if(name!=pwd||name.trim()=="")
        {
            $("#WM_checkpwd").css("color","red");
            $("#WM_checkpwd").html("两次密码不一致");
        }
        else
        {
            $("#WM_checkpwd").html(" ");
        }
    }
    $("#uname").blur(checkuname);
    $("#upwd").blur(checkpwd);
    $("#validationCode").blur(checkcode);
    $("#sign_uname").blur(checksignname);
    $("#sign_realname").blur(checksigrealname);
    $("#sign_email").blur(checksigemail);
    $("#sign_city").blur(checksigaddr);
    $("#sign_pwd").blur(checksignpwd);
    $("#sign_checkpwd").blur(checksignrepeatpwd);
    $("#signin").click(function () {
        $(".titlepage").attr("style","display:none;");
        $("#sign_in").attr("style","display:block;");
        $("#city_1").citySelect();
    })
$(".btn_signin").click(function () {
    var u1 =$("#sign_uname").val();
    var u2 =$("#sign_realname").val();
    var u3 =$("#sign_email").val();
    var u4 =$("#sign_prow").val();
    var u5=$("#sign_city").val();
    var u6 =$("#sign_pwd").val();
    var u7 =$("#sign_checkpwd").val();
    if(isEmpty(u1))
    {
        return;
    }
    if(isEmpty(u2))
    {
        return;
    }
    if(isEmpty(u3))
    {
        return;
    }
    if(isEmpty(u4))
    {
        return;
    }
    if(isEmpty(u5))
    {
        return;
    }
    if(isEmpty(u6))
    {
        return;
    }
    if(isEmpty(u7))
    {
        return;
    }
    $("#SignForm").submit();
})
</script>
</html>

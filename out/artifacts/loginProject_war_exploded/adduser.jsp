<%--
  Created by IntelliJ IDEA.
  User: 馒头尼桑
  Date: 2020/10/31
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
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
            <p style="font-size:30px;color:greenyellow">添加</p>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="js/jquery.cityselect.js"></script>
</html>

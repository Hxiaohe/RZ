

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Header</title>
</head>
<body>

<!-- 导航栏 -->
<header class="navbar navbar-default navbar-fixed-top"   style="background-color:#000">
<nav class="navbar navbar-default" role="navigation"   style="background-color:#000">
    <div class="container"   style="background-color:#000">
    <div class="navbar-header">
    <button data-toggle="collapse" data-target="#header-navbar" type="button" class="navbar-toggle">
    <span class="sr-only">Toggle Navigation</span><span class="icon-bar"></span><span class="icon-bar"></span>
    <span class="icon-bar"></span>
    </button>
    <button data-toggle="collapse" data-target="#notice-navbar" type="button" id="notice-navbar-button" class="navbar-toggle notice-navbar-button">
    <i class="fa fa-bell"></i>
    </button>
    <a href="index.jsp" style="padding:0;" class="navbar-brand">
     <img src="image/logo.png" style="height:52px"></a>
     </div>


	<div>
        <ul class="nav navbar-nav navbar-right"> 
            <li><a href="SignUp.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
            <li><a href="#" data-target="#login-modal-sm" data-toggle="modal"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
       </ul> 
    </div>
    </div>
</nav>

<!-- modal -->
<div id="login-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false" class="modal fade">
<div class="modal-dialog modal-sm">
<div class="modal-content">
<div class="modal-header">
<button data-dismiss="modal" class="close">
<span aria-hidden="true">&times;</span>
<span class="sr-only">关闭</span></button>
<h4 id="myModalLabel" class="modal-title">登录</h4>
</div>
<div class="modal-body">
<p style="margin:5px 0;padding:10px;" class="bg-info">欢迎登录3T网</p>
<form style="padding:8px" method="post" action="process_login.jsp" onsubmit="" class="login-form">
<div class="control-group">
<input id="login-name" type="text" placeholder="输入用户名" class="form-control login-field" name="username">
<label for="login-name" class="login-field-icon fui-user"></label></div>
<div class="control-group">
<input id="login-pass" type="password" placeholder="输入密码" class="form-control login-field" name="password">
<label for="login-pass" class="login-field-icon fui-lock"></label></div>
<button type="submit" href="#" class="btn btn-primary btn-large btn-block">登录</button>
<hr><a href="SignUp.jsp" target="_blank" class="btn btn-success btn-block btn-large">还没有帐号？立即注册</a>
</form></div><div class="modal-footer">
<button type="button" data-dismiss="modal" class="btn btn-default">关闭</button></div></div></div></div>
</header>


  
</body>
</html>
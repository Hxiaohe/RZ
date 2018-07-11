<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论-古籍网</title>
<link rel="Shortcut Icon" href="image/guji.ico" >
</head>
<body>
<% User user=(User)session.getAttribute("user"); 
   if(user!=null){%>
<%@ include file="HeaderWithUser.jsp"%>
<%}else{ %>
<%@ include file="Header.jsp"%>
<%} %>
<ul class="media-list ys-comments">
<li class="media ys-comments-left">
<div style="margin-right:5px;" class="ys-comments-main">
<a href="/user/830442/comments" target="_blank" class="hidden-xs ys-comments-user ys-comments-layout-x">
<img src="image/girl.jpg" width="50"></a>
<div class="media-body">
<h5 class="media-heading">哈哈</h5>
<div class="ys-comments-message"><p> 
白莲花的金融圈至高无上的中立维持平衡的世金所……想法不错 </p>
<small>&nbsp;(本书评来自于 <a target="_blank" href="#">《金融慈善家》   </a>) </small>
</div>
</div>
</div>
</li>
</ul>
<%@ include file="Footer.jsp"%>
</body>
</html>
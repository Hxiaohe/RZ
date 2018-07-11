<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="service.imp.UserService,domain.User"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆处理</title>
</head>
<body>
<jsp:useBean id="userService" class="service.imp.UserService" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String userName=request.getParameter("username");
	String password=request.getParameter("password");
	if(userService.validateUser(userName,password) != null)
	{
        //保存用户对象到会话
		session.setAttribute("user",userService.validateUser(userName,password));
%>
		<script type="text/javascript">
      window.location.href='index.jsp';
       </script>
<%
	}
	else
	{
%>
<script type="text/javascript">
      alert("该用户名不存在！");
      window.location.href='index.jsp';
       </script>
<%
	}
%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page import="service.imp.UserService" %>
<%@ page import="domain.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="userService" class="service.imp.UserService" scope="session"></jsp:useBean>
<%
  request.setCharacterEncoding("utf-8");
    //获取用户名，"userName"和register.jsp中name属性为"userName"的文本框对应
	String userName=request.getParameter("username");
    //获取密码，"password"和register.jsp中name属性为"password"的文本框对应
	String password1 =request.getParameter("password1");
	User user = new User();
	
	//设置用户类对象
	user.setUserName(userName);
	user.setPassWord(password1);
	user.setGender("男");
	user.setTouxiang("image/girl.png");
	user.setQianming("");
	try
	{
		//调用业务逻辑层的方法完成注册功能，userService与上面的useBean元素中的id属性对应
		userService.addUser(user);
%>
        <!-- 注册成功，跳转到登录界面 -->
        <script type="text/javascript">
      window.location.href='index.jsp';
       </script>
<%
	}
	//处理异常
	catch(Exception ex)
	{
		ex.printStackTrace();
	
%>
       <!-- 注册失败，回到原界面 -->
       <script type="text/javascript">
      alert("用户名已存在，请重新输入！");
      window.location.href='SignUp.jsp';
       </script>
      		
<%
	}
%>	
</body>
</html>

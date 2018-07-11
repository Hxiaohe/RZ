<%@page import="domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="service.imp.UserService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
User user=(User)request.getSession().getAttribute("user");
user.setQianming(request.getParameter("pageword").toString());
user.setGender(request.getParameter("gender").toString());
if((String)request.getSession().getAttribute("touxiangID")!=null)
user.setTouxiang((String)request.getSession().getAttribute("touxiangID"));
else
	user.setTouxiang(user.getTouxiang());
UserService userservice=(UserService)request.getSession().getAttribute("userService");
userservice.alterUser(user);
%>
<script type="text/javascript">
      alert("保存设置成功！");
      window.location.href='Setting.jsp';
       </script>
</body>
</html>
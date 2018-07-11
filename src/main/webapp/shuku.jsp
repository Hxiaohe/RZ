<%@page import="domain.Book"%>
<%@page import="service.imp.BookService"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书库-古籍网</title>
<link rel="Shortcut Icon" href="image/guji.ico" >
</head>

<%!


public int getAlltxt(String mulu){
	File file=new File(mulu);
	String files[];
	files=file.list();
	 int num=0;
	for(int i=0;i<files.length;i++)
	{
		if(files[i].endsWith(".txt")){
			  num++;
		}
		else if(!files[i].contains(".")){
			num+=getAlltxt(mulu+files[i]+"/");
		}
		else{
			
		}
	}  
	return num;
}
public int getWordsNum(String mulu){
	int num=0;
	File file=new File(mulu);
	if(file.exists())//得到文件总行数  
    { 
		try{
			FileReader fileReader1=new FileReader(file);    
		     BufferedReader buffer1=new BufferedReader(fileReader1);
		     String tempString=null;   
		     while((tempString=buffer1.readLine())!=null)  {         
		    		num+=tempString.length();
		    }    
		     buffer1.close();  
		     fileReader1.close();  
		}
		catch(IOException e){
			
		}
	 
    }
 	return num;
     }   

public String[] getAlltxtDe(String s,int num){
	String[] ss=new String[num];
	int temp=0;
	File file=new File(s);
	String files[];
	files=file.list();
	for(int i=0;i<files.length;i++)
	{
		if(files[i].endsWith(".txt")){
			  ss[temp++]=s+files[i];
		}
		else if(!files[i].contains(".")){
			int temp1=getAlltxt(s+files[i]+"/");
			String[] temps=getAlltxtDe(s+files[i]+"/",temp1);
			for(int j=0;j<temps.length;j++){
				 ss[temp++]=temps[j];
			}
		}
		else{
			
		}
	}  
	return ss;
}

public String[] getAlltxtName(String mulu,int num){
	String[] s=new String[num];
	int temp=0;
	File file=new File(mulu);
	String files[];
	files=file.list();
	for(int i=0;i<files.length;i++)
	{
		if(files[i].endsWith(".txt")){
			  s[temp++]=files[i];
		}
		else if(!files[i].contains(".")){
			int temp1=getAlltxt(mulu+files[i]+"/");
			String[] temps=getAlltxtName(mulu+files[i]+"/",temp1);
			for(int j=0;j<temps.length;j++){
				 s[temp++]=temps[j];
			}
		}
		else{
			
		}
	}  
	return s;
}

%>
<body>
<jsp:useBean id="bookService" class="service.imp.BookService" scope="session"></jsp:useBean>
<% User user=(User)session.getAttribute("user"); 
   if(user!=null){%>
<%@ include file="HeaderWithUser.jsp"%>
<%}else{ %>
<%@ include file="Header.jsp"%>
<%} %>

<%
String s=this.getServletContext().getRealPath("/");
String path="books/古代文献藏书13330种/古代文献藏书13330种/古代文献藏书13337种/";
 int num=getAlltxt(s+path);
 String[] allname=getAlltxtName(s+path, num);
 String[] de=getAlltxtDe(s+path, num);
 
 if(!bookService.isUpAllBooks()){
	 for(int i=0;i<allname.length;i++){
		 Book tempbook=new Book();
		 tempbook.setBookname(allname[i]);
		 tempbook.setAuthor(allname[i].split("-")[2]);
		 tempbook.setChaodai(allname[i].split("-")[1]);
		 tempbook.setZishu(getWordsNum(de[i]));
		 tempbook.setLujing(de[i]);
		 try
			{
				//调用业务逻辑层的方法完成注册功能，userService与上面的useBean元素中的id属性对应
		 bookService.addBook(tempbook);
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
	 }
 }
        String pages=request.getParameter("page");  
   if(pages==null)  
         pages="0";     
 int diPage=Integer.parseInt(pages);   
 int pageFileSize=24;//每页显示25行数据   
   int fileLineCount=num;//文件总行数   
   int fileCountPage=0;//文件页数 
   if(fileLineCount%pageFileSize==0)   
		fileCountPage=fileLineCount/pageFileSize; 
	else        
		fileCountPage=fileLineCount/pageFileSize+1;
   if(fileCountPage-1!=diPage){
	   for(int i=0;i<pageFileSize;i++) {
	   
	   %> <div class="col-lg-4 col-md-6 col-xs-12" >
		   <div class="panel panel-default">
			<div class="panel-body">
				<p>
		   <img src='image/timg.jpg' style='max-height:125px;max-width:100px;'>
				</p>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><% out.println("书名:<a href='fenye.jsp?book="+(diPage*pageFileSize+i)+"'>");
		   out.println(allname[diPage*pageFileSize+i].split("-")[0]+"</a><br>"); %></li>
				<li class="list-group-item"><% out.println("朝代:"+allname[diPage*pageFileSize+i].split("-")[1]+"<br>"); %></li>
				<li class="list-group-item"><% out.println("作者:"+allname[diPage*pageFileSize+i].split("-")[2]+"<br>"); %></li>
				<li class="list-group-item"><% out.println("字数:"+getWordsNum(de[diPage*pageFileSize+i])+"<br>"); %></li>
			</ul>
		</div>
		</div>
		<%
	   }
   }
   else{
	   for(int i=0;i<fileLineCount%pageFileSize;i++) {%>
	   
		   <div class="col-lg-4 col-md-6 col-xs-12">
		   <div class="panel panel-default">
			<div class="panel-body">
				<p>
		   <img src='image/timg.jpg' style='max-height:125px;max-width:100px;'>
				</p>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><% out.println("书名:<a href='fenye.jsp?book="+(diPage*pageFileSize+i)+"'>");
		   out.println(allname[diPage*pageFileSize+i].split("-")[0]+"</a><br>"); %></li>
				<li class="list-group-item"><% out.println("朝代:"+allname[diPage*pageFileSize+i].split("-")[1]+"<br>"); %></li>
				<li class="list-group-item"><% out.println("作者:"+allname[diPage*pageFileSize+i].split("-")[2]+"<br>"); %></li>
				<li class="list-group-item"><% out.println("字数:"+"<br>"); %></li>
			</ul>
		</div>
		</div>
		 <%   out.println("<a href='fenye.jsp?book="+(diPage*pageFileSize+i)+"'>");
		   out.println((i+1)+":"+allname[diPage*pageFileSize+i]+"</a><br>"); 
	   }
   }
%>
<div align="center">
<ul class="pagination">
    <li><a href="shuku.jsp?page=<%=(diPage-1)>0?diPage-1:0%>">&laquo;</a></li>
    <li class="active"><a href="shuku.jsp?page=<%=diPage/5*5+diPage%5+0 %>"><%=diPage/5*5+diPage%5+1 %></a></li>
    <li><a style="visibility:<%=(diPage/5*5+diPage%5+0)<fileCountPage-1?"":"hidden" %>;" href="shuku.jsp?page=<%=(diPage/5*5+diPage%5+1)<fileCountPage-1?(diPage/5*5+diPage%5+1):fileCountPage-1  %>"><%=diPage/5*5+diPage%5+2 %></a></li>
    <li><a style="visibility:<%=(diPage/5*5+diPage%5+1)<fileCountPage-1?"":"hidden" %>;" href="shuku.jsp?page=<%=(diPage/5*5+diPage%5+2)<fileCountPage-1?(diPage/5*5+diPage%5+2):fileCountPage-1  %>"><%=diPage/5*5+diPage%5+3 %></a></li>
    <li><a style="visibility:<%=(diPage/5*5+diPage%5+2)<fileCountPage-1?"":"hidden" %>;" href="shuku.jsp?page=<%=(diPage/5*5+diPage%5+3)<fileCountPage-1?(diPage/5*5+diPage%5+3):fileCountPage-1  %>"><%=diPage/5*5+diPage%5+4 %></a></li>
    <li><a style="visibility:<%=(diPage/5*5+diPage%5+3)<fileCountPage-1?"":"hidden" %>;" href="shuku.jsp?page=<%=(diPage/5*5+diPage%5+4)<fileCountPage-1?(diPage/5*5+diPage%5+4):fileCountPage-1  %>"><%=diPage/5*5+diPage%5+5 %></a></li>
    <li><a  href="shuku.jsp?page=<%=(diPage+1)<fileCountPage-1?diPage+1:fileCountPage-1 %>">&raquo;</a></li>
</ul>
</div>
<%@ include file="Footer.jsp"%>
</body>
</html>
<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
    <h1>登陆成功</h1>
    <hr>
    <br>
    <br> 
    <br>
    <%
        request.setCharacterEncoding("utf-8");
        String[] isUseCookies=request.getParameterValues("isUseCookie");
        if(isUseCookies!=null&&isUseCookies.length>0){
        	//把用户名和密码保存在Cookie对象里面
        	String username=URLEncoder.encode(request.getParameter("username"), "utf-8");
        	//使用URLEcode解决无法在Cookie中保存字符串的问题
        	String password=URLEncoder.encode(request.getParameter("password"), "utf-8");
        	Cookie usernameCookie=new Cookie("username",username);
        	Cookie passwordCookie=new Cookie("password",password);
        	usernameCookie.setMaxAge(86400);
        	passwordCookie.setMaxAge(86400);
        	response.addCookie(usernameCookie);
        	response.addCookie(passwordCookie);
        }
        else{
        	Cookie[] cookies=request.getCookies();
        	if(cookies!=null&&cookies.length>0){
        		for(Cookie c:cookies){
        			if(c.getName().equals("username")||c.getName().equals("password")){
        				c.setMaxAge(0);
        				response.addCookie(c);//重新保存
        			}
        		}
        	}
        }
    %>
    <a href="users.jsp" target="_blank">查看用户信息</a>
</body>
</html>
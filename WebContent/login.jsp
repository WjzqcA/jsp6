<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <%
        request.setCharacterEncoding("utf-8");
            String username="";
            String password="";
                Cookie[] cookies=request.getCookies();
	            if(cookies!=null&&cookies.length>0){
		            for(Cookie c:cookies){
			            if(c.getName().equals("password")){
				            username=URLDecoder.decode(c.getValue(), "utf-8");
			            }
			            if(c.getName().equals("password")){
			            	password=URLDecoder.decode(c.getValue(), "utf-8");
			            }
		            }
	            }
    %>  
        <form name="loginForm" action="dologin.jsp" method="post">
        <table>
          <tr>
             <td><label>用户名</label></td>
            <td><input name="username" value="<%=username %>" type="text"></td>
            </tr>
            <tr>
            <td><label>密码</label></td>
            <td><input name="password" value="<%=password %>" type="password"></td>
           </tr>
           <tr>
            <td colspan="2"><input type="checkbox" name="isUseCookie" checked="checked"><span>十天内记住我的登陆状态</span></td>
           </tr>
           <tr>
            <td colspan="2" align="center"><input type="submit" value="登录">&nbsp;<input type="reset" value="取消"></td>
           </tr>
        </table>
        </form>
    </div>
</body>
</html>
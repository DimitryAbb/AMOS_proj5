<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="de.amos.*"%> 
    
    <%
		User.init(getServletConfig());
	%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<%  
switch(User.exists(request.getParameter(Const.RequestParameters.LOGIN_USERNAME),request.getParameter(Const.RequestParameters.LOGIN_PASSWORD))){
case Const.UserReturns.SUCCESS:
	session.setAttribute(Const.SessionAttributs.LoginState.NAME,Const.SessionAttributs.LoginState.Valeus.LOGGED_IN);
	response.sendRedirect("intern/index.htlm");
	System.out.println("redirect");
	break;
}
out.println(""+User.exists(request.getParameter("username"),request.getParameter("password")));
%>

<%//session.setAttribute("loggedin","something"); %>
</body>
</html>
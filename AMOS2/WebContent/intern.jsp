<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="de.amos.Const"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%

	//calling for page request.getPathInfo()

	//is a user logged in to this session?
	if(Const.SessionAttributs.LoginState.Valeus.LOGGED_IN.equals(session.getAttribute(Const.SessionAttributs.LoginState.NAME))){
		//user is logged in -> can forward
		String forwardUrl=request.getPathInfo();
		while(forwardUrl.startsWith("/intern")||forwardUrl.startsWith("intern")){
			forwardUrl=forwardUrl.substring(forwardUrl.indexOf("/")+1);
		}
		forwardUrl="intern/"+forwardUrl;
		System.out.println("redirect to "+forwardUrl);
		if(!request.getPathInfo().startsWith("/")){
			request.getRequestDispatcher("/WEB-INF/"+request.getPathInfo()).forward(request,response);
		}else{
			request.getRequestDispatcher("/WEB-INF"+request.getPathInfo()).forward(request,response);
		}
	}else{
		//no user logged in
		if(request.getParameter(Const.RequestParameters.COMING_FROM_LOGINPAGE)!=null){
			//coming from loginPage -> forward to login.jsp
			request.getRequestDispatcher(Const.URL.LOGIN_JSP).forward(request,response);
		}else{
			//forward to loginPage
			request.getRequestDispatcher(Const.URL.LOGIN_PAGE).forward(request,response);
		}
		
		//request.getRequestDispatcher(Const.URL.LOGIN_PAGE).forward(request,response);
	}

%>
</body>
</html>
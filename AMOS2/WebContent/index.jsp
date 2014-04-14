<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="de.amos.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Example</title>
</head>
<body>

	<form method="post" action="intern/login">
		<table border="1" width="30%" cellpadding="3">
			<thead>
				<tr>
					<th colspan="2">
						<%
							String state = (String) session
													.getAttribute(Const.SessionAttributs.LoginState.NAME);
											if (state == null) {
												out.println("Welcome back!<br>Login Here");
											} else if (state
													.equals(Const.SessionAttributs.LoginState.Valeus.PASSWORD_WRONG)) {
												out.println("Password was wrong!<br>Try again");
											} else if (state
													.equals(Const.SessionAttributs.LoginState.Valeus.NOT_LOGGED_IN)) {
												out.println("Access denied!<br>Please login");
											} else if (state
													.equals(Const.SessionAttributs.LoginState.Valeus.LOGGED_IN)){
												request.getRequestDispatcher("/intern/a").forward(request,response);
											}
						%>

					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>User Name</td>
					<td><input type="text" name="username" value="" /></td>
					<td><input type="text" name="<%=Const.RequestParameters.LOGIN_USERNAME %>" value="" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="<%=Const.RequestParameters.LOGIN_PASSWORD %>" value="" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login" /></td>
					<td><input type="reset" value="Reset" /></td>
				</tr>
				<tr>
					<td colspan="2">Yet Not Registered? <a href="intern/reg.jsp">Register
							Here</a></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="<%=Const.RequestParameters.COMING_FROM_LOGINPAGE %>" value="true"/>
	</form>
	<%
	
	
	
		session.removeAttribute(Const.SessionAttributs.LoginState.NAME);
	%>
</body>
</html>
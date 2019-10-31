<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Page</title>
</head>
<style>
	::placeholder { /* Firefox, Chrome, Opera */
		color: black;
		font-size: 15px;
	}
	#login_box_layer {
		padding-top: 100px;
	}
	#login_box {
		border: 1px solid black;
		padding-top: 20px;
		padding-bottom: 20px;
		width: 350px;
		height: 120px;
	}
	#login_email_box {
		margin-bottom: 10px;
		border: 1px solid black;
		height: 30px;
		width: 240px;
		text-indent: 5px;
	}
	#login_pw_box {
		margin-bottom: 10px;
		border: 1px solid black;
		height: 30px;
		width: 240px;
		text-indent: 5px;
	}
	#login_btn {
		width: 115px;
		height: 30px;
		background-color: #F8AE1B;
		border-style: solid;
		font-size:15px;
	}
	#toJoin_btn {
		width: 115px;
		height: 30px;
		background-color: #F8AE1B;
		border-style: solid;
		font-size:15px;
	}
	#member_nav {
	
	}
	#logout_btn {
		width: 115px; 
		height: 30px; 
		margin-left: 5px; 
		background-color:#F8AE1B; 
		border-style: solid; 
		font-size:15px;
	}
	#write_done_btn {
		width: 115px; 
		height: 30px;
		background-color:#F8AE1B; 
		border-style: solid; 
		font-size:15px;
	}
	#write_cancel_btn {
		align: left; 
		width: 115px; 
		height: 30px; 
		background-color:#F8AE1B; 
		border-style: solid; 
		font-size:15px;
	}
	table {
		width: 1000px;
		margin-top: 50px;
		border-collapse: collapse;
	}
	td {
		border: 1px solid black;
		padding: 5px;
	}
	#title_box {
		width: 950px;
		text-indent: 5px;
		border: 1px solid black;
	}
	#content_box {
		width: 950px;
		height: 350px;
		text-indent: 5px;
		border: 1px solid black;
	}
</style>
<body>
	<%
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
	%>
	
	<%
		if (userEmail == null) {
	%>		
		<div id="login_box_layer" align="center">
			<div id="login_box">
				<form method="post" action="loginAction.jsp">
				<input id="login_email_box" type="text" placeholder="&nbsp;Email" name="userEmail" maxlength="20">
				<input id="login_pw_box" type="password" placeholder="&nbsp;Password" name="userPassword" maxlength="20">
				<div>
					<input id="login_btn" type="submit" value="Login">
					<input id="toJoin_btn" type="button" value="To Join" onclick="location.href='join.jsp'">
				</div>
				</form>
			</div>
		</div>
	<%		
		} else {
	%>		
		<div id="member_nav" align="right">
			<input id="logout_btn" type="button" value="Logout" onclick="location.href='logoutAction.jsp'">
		</div>
		<div>
			<div align="center">
				<div align="right" style="width: 1000px;">
					<form method="post" action="writeAction.jsp">
						<table>
							<thead>
								<tr align="center">
									<td><input id="title_box" type="text" placeholder="Title" name="boardTitle" maxlength="50"></td>
								</tr>
							</thead>
							<tbody>
								<tr align="center">
									<td><textarea id="content_box" placeholder="Content" name="boardContent" maxlength="2048"></textarea></td>
								</tr>
							</tbody>
						</table>
						<div align="right" style="margin-top: 10px;">
							<input id="write_cancel_btn" type="button" value="Cancel" onclick="location.href='list.jsp'">
							<input id="write_done_btn" type="submit" value="Done" onclick="location.href='write.jsp'">
						</div>
					</form>
				</div>
			</div>
		</div>
	<%		
		}
	%>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
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
	a, a:hover {
		color: #000000;
		text-decoration: none;
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
	#toList_btn {
		align: left; 
		width: 115px; 
		height: 30px; 
		background-color:#F8AE1B; 
		border-style: solid; 
		font-size:15px;
		margin-top: 20px
	}
	#edit_btn {
		align: left; 
		width: 115px; 
		height: 30px; 
		background-color:#F8AE1B; 
		border-style: solid; 
		font-size:15px;
		margin-top: 20px
	}
	#delete_btn {
		align: left; 
		width: 115px; 
		height: 30px; 
		background-color:#F8AE1B; 
		border-style: solid; 
		font-size:15px;
		margin-top: 20px
	}
	table {
		width: 1000px;
		margin-top: 50px;
		border-collapse: collapse;
	}
	td {
		border: 1px solid black;
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
	th {
		border: 1px solid black;
		background-color: #F8AE1B;
		padding: 5px;
	}
	#th_no {
		text-align: center;
		width: 30px;
	}
	#th_date {
		text-align: center;
		width: 200px;
	}
	#th_title {
		text-align: left;
		width: 500px;
	}
	#th_writer {
		text-align: left;
		width: 220px;
	}
	#th_view {
		text-align: center;
		width: 50px;
	}
</style>
<body>
	<%
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'list.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
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
					<table>
						<thead>
							<tr>
								<th id="th_no"><%= board.getBoardID() %></th>
								<th id="th_date"><%= board.getBoardDate().substring(0, 11) + board.getBoardDate().substring(11, 13) + "시 " + board.getBoardDate().substring(14, 16) + "분 " %></th>
								<th id="th_title"><%= board.getBoardTitle() %></th>
								<th id="th_writer"><%= board.getUserEmail() %></th>
								<th id="th_view">10</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="5" style="height: 350px; text-align: left; text-indent: 5px; border: 1px solid black;"><%= board.getBoardContent() %></td>
							</tr>
						</tbody>
					</table>
						<%
							if(userEmail != null && userEmail.equals(board.getUserEmail())) {
						%>
								<input id="toList_btn" type="button" value="To List" onclick="location.href='list.jsp'">
								<input id="edit_btn" type="button" value="Edit" onclick="location.href='edit.jsp?boardID=<%= boardID %>'">
								<input id="delete_btn" type="button" value="Delete" onclick="location.href='deleteAction.jsp?boardID=<%= boardID %>'">
						<%		
							}
						%>	
				</div>
			</div>
		</div>
	<%		
		}
	%>
	
</body>
</html>
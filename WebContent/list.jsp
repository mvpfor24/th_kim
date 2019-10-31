<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Page</title>
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
	#write_btn {
		width: 115px; 
		height: 30px;
		background-color:#F8AE1B; 
		border-style: solid; 
		font-size:15px;
		margin-top: 20px;
	}
	table {
		width: 1000px;
		margin-top: 50px;
		border-collapse: collapse;
	}
	th {
		border: 1px solid black;
		background-color: #F8AE1B;
		padding: 5px;
	}
	#th_no {
		text-align: center;
		width: 30px;
		font-weight: bold;
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
	td {
		border: 1px solid black;
		padding: 5px;
	}
	#td_no {
		text-align: center;
		font-weight: bold;
	}
	#td_date {
		text-align: center;
	}
	#td_title {
		text-align: left;
	}
	#td_writer {
		text-align: left;
	}
	#td_view {
		text-align: center;
	}
</style>
<body>
	<%
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<div style="width: 1000px;">
					<table>
						<thead>
							<tr>
								<th id="th_no">No</th>
								<th id="th_date">Date</th>
								<th id="th_title">Title</th>
								<th id="th_writer">Writer</th>
								<th id="th_view">View</th>
							</tr>
						</thead>
						<tbody>
							<%
								BoardDAO boardDAO = new BoardDAO();
								ArrayList<Board> list = boardDAO.getList(pageNumber);
								for(int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td id="td_no"><%= list.get(i).getBoardID() %></td>
								<td id="td_date"><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시 " + list.get(i).getBoardDate().substring(14, 16) + "분 " %></td>
								<td id="td_title"><a href="view.jsp?boardID=<%= list.get(i).getBoardID() %>"><%= list.get(i).getBoardTitle() %></a></td>
								<td id="td_writer"><%= list.get(i).getUserEmail() %></td>
								<td id="td_view">10</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>	
					<div align="right">
						<input id="write_btn" type="button" value="Write" onclick="location.href='write.jsp'">
					</div>
				</div>
						<%
							if(pageNumber != 1) {
						%>
								<div align="center">
									<a href="list.jsp?pageNumber=<%=pageNumber - 1 %>" style="font-weight: bold;">&lt;</a>
								</div>
						<%
							} if(boardDAO.nextPage(pageNumber + 1)) {
						%>
								<div align="center">
									<a href="list.jsp?pageNumber=<%=pageNumber + 1 %>" style="font-weight: bold;">&gt;</a>
								</div>
						<%
							}
						%>
			</div>
		</div>
	<%		
		}
	%>
	
</body>
</html>
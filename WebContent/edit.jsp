<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Page</title>
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
		if (userEmail == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
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
		if (!userEmail.equals(board.getUserEmail())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'list.jsp'");
			script.println("</script>");			
		}
	%>	
		<div id="member_nav" align="right">
			<input id="logout_btn" type="button" value="Logout" onclick="location.href='logoutAction.jsp'">
		</div>
		<div>
			<div align="center">
				<div align="right" style="width: 1000px;">
					<form method="post" action="editAction.jsp?boardID=<%= boardID %>">
						<table>
							<thead>
								<tr align="center">
									<td><input id="title_box" type="text" placeholder="Title" name="boardTitle" maxlength="50" value="<%= board.getBoardTitle() %>"></td>
								</tr>
							</thead>
							<tbody>
								<tr align="center">
									<td><textarea id="content_box" placeholder="Content" name="boardContent" maxlength="2048"><%= board.getBoardTitle() %></textarea></td>
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
	
	
</body>
</html>
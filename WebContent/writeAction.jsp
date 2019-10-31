<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Board</title>
</head>
<style>
	::placeholder { /* Firefox, Chrome, Opera */
		color: black;
		font-size: 15px;
	}
</style>
<body>
	<%
		String userEmail = null;
		if(session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
		if(userEmail == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (board.getBoardTitle() == null || board.getBoardContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 부분이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.write(board.getBoardTitle(), userEmail, board.getBoardContent());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글을 작성할 수 없습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'list.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>
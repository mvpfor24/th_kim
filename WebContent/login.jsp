<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
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
</style>
<body>
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
</body>
</html>
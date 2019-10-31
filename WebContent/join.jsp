<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Page</title>
</head>
<style>
	::placeholder { /* Firefox, Chrome, Opera */
		color: black;
		font-size: 15px;
	}
	#join_box_layer {
		padding-top: 100px;
	}
	#join_box {
		border: 1px solid black;
		padding-top: 20px;
		padding-bottom: 20px;
		width: 350px;
		height: 170px;
	}
	#join_name_box {
		margin-bottom: 10px;
		border: 1px solid black;
		height: 30px;
		width: 240px;
		text-indent: 5px;
	}
	#join_email_box {
		margin-bottom: 10px;
		border: 1px solid black;
		height: 30px;
		width: 240px;
		text-indent: 5px;
	}
	#join_pw_box {
		margin-bottom: 10px;
		border: 1px solid black;
		height: 30px;
		width: 240px;
		text-indent: 5px;
	}
	#join_btn {
		width: 115px;
		height: 30px;
		background-color: #F8AE1B;
		border-style: solid;
		font-size:15px;
	}
</style>
<body>
	<div id="join_box_layer" align="center">
		<div id="join_box" align="center">
			<form method="post" action="joinAction.jsp">
				<input id="join_name_box" type="text" placeholder="&nbsp;Name" name="userName" maxlength="20">
				<input id="join_email_box" style="margin-bottom: 10px; border: 1px solid black; height: 30px; width: 240px; text-indent: 5px;" type="email" placeholder="&nbsp;Email" name="userEmail" maxlength="20">
				<input id="join_pw_box" style="margin-bottom: 10px; border: 1px solid black; height: 30px; width: 240px; text-indent: 5px;" type="password" placeholder="&nbsp;Password" name="userPassword" maxlength="20">
				<div>
					<input id="join_btn" type="submit" value="Join">
				</div>	
			</form>
		</div>
	</div>
</body>
</html>
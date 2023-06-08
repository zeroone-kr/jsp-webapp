<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(session.isNew()){
		response.sendRedirect("login.html");
	}else{
		session.invalidate();
		out.println("<script>alert(\"성공적으로 로그아웃되었습니다.\")</script>");
	}

%>

<!DOCTYPE html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/font-awesome.min.css">
<link rel="stylesheet" href="./css/icon-font.min.css">
<link rel="stylesheet" href="./css/animate.css">
<link rel="stylesheet" href="./css/hamburgers.min.css">
<link rel="stylesheet" href="./css/animate.css">
<link rel="stylesheet" href="./css/select2.min.css">
<link rel="stylesheet" href="./css/daterangepicker.css">
<link rel="stylesheet" href="./css/util.css">
<link rel="stylesheet" href="./css/main.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<body>
    <div class="container-login100" style="background-image: url('./images/sky.jpg');">
        <div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
            <form method="post" action="login.jsp" class="login100-form validate-form flex-sb flex-w">

                <span class="login100-form-title p-b-32 d-flex justify-content-center">
                    Account login
                </span>

                <span class="txt1 p-b-11">
                    UserId
                </span>

                <div class="wrap-input100 validate-input m-b-12">
                    <input class="input100" name="userId">
                    <span class="focus-input100"></span>
                </div>

                <span class="txt1 p-b-11">
                    Password
                </span>
                <div class="wrap-input100 validate-input m-b-12">
                    <input class="input100" type="password" name="userPassword">
                    <span class="focus-input100"></span>
                </div>

                <span>
                    <input class="btn btn-dark" type="submit" value="로그인">
                </span>
            </form>
        </div>
    </div>
</body>
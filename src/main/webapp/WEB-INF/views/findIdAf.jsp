<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>

<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color : #E2F0F7;
	margin: 0;
}
.div {
	width: 550px;
	height: 700px;
	border: 0;
	background-color : white;
}
.content{
	font-family: sans-serif;
	font-size: 30px;
	margin-top: 100px;
	margin-bottom: 80px;
	text-align: center;
}
.foundId{
	font-family: sans-serif;
	font-size: 20px;
	margin-top: 100px;
	margin-bottom: 100px;
	text-align: center;
}
.loginBtn{
	width: 407px;
	height: 54px;
	background-color: #505567;
	color: white;
	margin-top: 50px;
	margin-left: 75px;
	font-size: 24px;
}
hr{
     border: none;
     height: 3px;
     background-color: #DDDDDD;
}
</style>
</head>
<body>
<div class="div">
	<p class="content">
		입력한 정보와 일치하는<br>
		계정을 확인해 주세요.
	</p>
    <%-- model에 담긴 "foundId"를 가져와서 출력 --%>
    <hr>
    <c:if test="${not empty foundId}">
        <p class="foundId">${foundId}</p>
    </c:if>
	<hr>
    <button class="loginBtn" onclick="location.href='<c:url value="/login.do"/>';">로그인</button>
</div>
</body>
</html>

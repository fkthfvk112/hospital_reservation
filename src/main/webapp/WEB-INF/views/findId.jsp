<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
#name, #email {
	width: 400px;
	height: 50px;
	border: 0;
	background-color: #DDDDDD;
	margin-left: 75px;
	font-size: 24px;
}
#name{
	margin-bottom: 10px;

}
.content{
	font-family: sans-serif;
	font-size: 30px;
	margin-top: 100px;
	margin-bottom: 80px;
	text-align: center;
}

.findIdBtn{
	width: 407px;
	height: 54px;
	background-color: #505567;
	color: white;
	margin-top: 130px;
	margin-left: 75px;
	font-size: 24px;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="div">
	<p class="content">
		이름과 이메일로<br>
	    아이디를 찾습니다.
	</p>
	<br>
	
	<!-- 서버에서 전달한 에러 메시지가 있다면 경고창 띄우기 -->
    <c:if test="${not empty error}">
        <script>
            alert("${error}");
        </script>
    </c:if>
	
	<form action="findIdAf.do" method="post">
        <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
        <br><br>
        <input type="text" id="email" name="email" placeholder="이메일을 입력하세요" required>
        <br>
        <button type="submit" class="findIdBtn">아이디 찾기</button>
    </form>
</div>
</body>
</html>
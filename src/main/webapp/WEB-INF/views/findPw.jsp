<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String error = (String) request.getAttribute("error");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
	font-size: 15px;
	text-align: left;
	margin-left: 30px;
	margin-top: 80px;
	margin-bottom: 60px;
	color: #7F7F7F;
}
.content b {
    font-weight: bold;
    color: black;
}
.text{
	width: 400px;
	height: 50px;
	border: 0;
	background-color: #DDDDDD;
	margin-left: 75px;
	margin-top : 20px;
	font-size: 24px;
}

.findPwBtn{
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
<!-- 비밀번호 찾기 양식 -->
<div class="div">

	<p class="content">비밀번호의 경우 <b>암호화</b> 저장되어 분실 시 찾아드릴 수 없는 정보 입니다.<br>
	<b>본인 확인을</b>을 통해 비밀번호를 재설정 하실 수 있습니다.</p>

    <form action="findPwAf.do" id="findPasswordForm" method="post">
        <table>
            <tr class="centerTr">
                
                <td><input type="text" size="20" id="name" name="name" class="text" placeholder="이름을 입력하세요" required></td>
            </tr>
            <tr class="centerTr">
                
                <td><input type="text" size="20" id="id" name="id" class="text" placeholder="아이디를 입력하세요" required></td>
            </tr>
            <tr class="centerTr">
                
                <td><input type="text" size="20" id="email" name="email" class="text" placeholder="이메일을 입력하세요" required></td>
            </tr>
            <tr class="centerTr">
                <td>
                    <input type="submit" value="비밀번호 찾기" class="findPwBtn">
                </td>
            </tr>
        </table>
    </form>
</div>

<%-- 에러 메시지가 있을 경우 JavaScript 함수 호출 --%>
    <% if (error != null) { %>
        <script>
        	alert('<%= error %>');
        </script>
    <% } %>


</body>
</html>
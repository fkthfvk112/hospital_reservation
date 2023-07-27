<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증번호 확인</title>
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
.centerTr{
	display: flex;
	justify-content: center;
}
.content{
	font-family: sans-serif;
	font-size: 20px;
	text-align: center;
	margin-top: 170px;
	margin-bottom: 110px;
}
.email{
	color: blue;
}
th {
	display: flex;
    align-items: center;
    justify-content: center;
    background-color: #D9D9D9;
    width: 135px;
    height: 50px;
    font-size: 15px;
    margin-left: 75px;
}
.text{
	width: 265px; 
	height: 49px;
	background-color: #E8F0FE;
	font-size: 15px;
	border: 0;
}

.successVerifyBtn{
	width: 407px;
	height: 54px;
	background-color: #505567;
	color: white;
	margin-top: 150px;
	margin-left: 75px;
	font-size: 24px;
	cursor: pointer;
}

</style>
</head>
<body>
	<div class="div">
		<p class="content"><span class="email">${email}</span>으로 인증번호를 보냈습니다.</p>
		<form action="verifyCodeAf.do" method="post">
	        <input type="hidden" name="id" value="${id}">
	        <table>
	        <tr class="centerTr">
	            <th><label for="code">인증번호 입력</label></th>
	            <td><input type="text" id="code" name="code" class="text" required></td>
	        </tr>
	        <tr>
	            <td colspan="2"><input type="submit" value="인증 완료" class="successVerifyBtn"></td>
	        </tr>
	    </table>
	    </form>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
.centerTr{
	display: flex;
	justify-content: center;
}
.content{
	font-family: sans-serif;
	font-size: 20px;
	text-align: center;
	margin-top: 100px;
	margin-bottom: 70px;
}
th {
	display: flex;
    align-items: center;
    justify-content: center;
    background-color: #D9D9D9;
    width: 135px;
    height: 50px;
    font-size: 15px;
    margin-top: 40px;
    margin-left: 75px;
}
.text{
	width: 265px; 
	height: 49px;
	background-color: #E8F0FE;
	font-size: 15px;
	margin-top: 40px;
	border: 0;
}
.resetPwBtn{
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
	<p class="content">새 비밀번호를 입력해주세요.</p>
	<form action="resetPasswordAf.do" method="post">
		<input type="hidden" name="id" value="${id}">
        <table>
            <tr class="centerTr">
                <th><label for="newPassword">새 비밀번호 입력</label></th>
                <td><input type="password" id="newPassword" name="newPassword" class="text" required></td>
            </tr>
            <tr class="centerTr">
                <th><label for="confirmNewPassword">새 비밀번호 확인</label></th>
                <td><input type="password" id="confirmNewPassword" name="confirmNewPassword" class="text" required>
                <br>
				<p id="pwcheck" style="font-size: 8px"></p></td>
            </tr>
            <tr class="centerTr">
                <td colspan="2"><input type="submit" value="확인" class="resetPwBtn"></td>
            </tr>
        </table>
    </form>
    </div>
    
    <script>
    
    	// 비밀번호 확인
		$("form").submit(function(event) {
			var pw = $("#newPassword").val().trim();
			var chkPw = $("#confirmNewPassword").val().trim();

			if (pw !== chkPw) {
				event.preventDefault(); // 폼 제출을 막음
				$("#pwcheck").css("color", "#ff0000");
				$("#pwcheck").text("비밀번호가 일치하지 않습니다.");
				$("#newPassword").focus();
			} else {
		        // 비밀번호가 일치할때 형식 확인
		        var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*])[A-Za-z\d@$!%*#?&]{9,}$/;
		        if (!pwPattern.test(pw)) {
		        	event.preventDefault(); // 폼 제출을 막음
		            $("#pwcheck").css("color", "#ff0000");
		            $("#pwcheck").text("유효하지 않은 비밀번호 형식입니다.");
		            $("#newPassword").focus();	

		        } else {
		            $("#pwcheck").css("color", "#0000ff");
		            $("#pwcheck").text("올바른 비밀번호 형식입니다.");
		          }
		   		}
		});
    </script>
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 쿠키 -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>
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

.table {
	width: 100%;
}

.idpw {
	width: 400px;
	height: 50px;
	border: 0;
	background-color: #E8F0FE;
	font-size: 26px;
}

#chk_save_id {
	margin-left: 70px;
	float: left;
	font-size: 8px;
	margin-bottom: 28px;
}

.login {
	width: 407px;
	height: 54px;
	background-color: #505567;
	color: white;
	margin-bottom: 18px;
	font-size: 26px;
}

.kakao{
	width: 407px;
	height: 54px;
	background-color: #FEEA33;
	color: black;
	border: 0;
	margin-top: 28px;
	font-size: 26px;
}

.regi {
	float: left;
	margin-left: 70px;
	color: black;
	text-decoration: none;
	font-size: 18px;
}

.findIdPw {
	float: right;
	color: black;
	text-decoration: none;
	font-size: 18px;
}
#findPw{
	margin-right: 70px;
}
#findId{
	margin-right: 10px;
}

.logo {
	display: block;
	margin: 0 auto;
	width: 540px;
	height: 180px;
	margin-bottom: 60px;
}
#id{
	margin-bottom: 18px;
}
#pw{
	margin-bottom: 13px;
}
</style>

</head>
<body>
	<div class="div">
		<form action="loginAf.do" method="post">
			<table class="table">
				<tr class="centerTr">
					<td><img src="img/logo1.PNG" alt="로고" class="logo"></td>
				</tr>
				<tr class="centerTr">
					<td><input type="text" id="id" name="id"
						placeholder="아이디를 입력하세요." class="idpw"></td>
				</tr>
				<tr class="centerTr">
					<td><input type="password" id="pw" name="pw" value=""
						placeholder="비밀번호를 입력하세요." class="idpw"></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="chk_save_id">아이디 기억</td>
				</tr>
				<tr class="centerTr">
					<td><input type="submit" value="로그인" class="login"></td>
				</tr>
				<tr>
					<td>
						<a href="regi.do" class="regi">회원가입</a>
						<a href="findPw.do" id="findPw" class="findIdPw">비밀번호 찾기</a>
						<a href="findId.do" id="findId" class="findIdPw">아이디찾기</a>
					</td>
				</tr>
				<tr class="centerTr">
					<td><a href="javascript:kakaoLogin();">
					<input type="button" class="kakao" value="카카오톡 계정으로 로그인"></a></td>
				</tr>
			</table>
		</form>
	</div>




	<script type="text/javascript">
	let user_id = $.cookie("user_id");
	
	if(user_id != null){	// 저장한 id가 있을 시
		$("#id").val(user_id);
		$("#chk_save_id").prop("checked", true);
	}

	$("#chk_save_id").click(function(){
		if($("#chk_save_id").is(":checked") == true){	// id를 cookie에 저장 
			if( $("#id").val().trim() == "" ){			// 빈문자열이였을 경우 
				alert("id를 입력하세요.");
				$("#chk_save_id").prop("checked",false);
				$("#id").focus();
			}else{
				// cookie에 저장
				$.cookie("user_id", $("#id").val().trim(), {expires:7, path:"./"});
			}
		}else{	// cookie에 저장하지 않음(삭제)
			$.removeCookie("user_id", { path:'./' });
		}
	});
	</script>
	
	<!-- 카카오 로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		window.Kakao.init("0f68cc5f7d6a8996495dbcd980cb7595");
		
		function kakaoLogin() {
	        window.Kakao.Auth.login({
	            scope: 'profile_nickname, account_email',
	            success: function(authObj){
	                // 카카오 로그인 성공 시, 액세스 토큰을 서버로 전송
	                var accessToken = authObj.access_token;
	                $.ajax({
	                    url: "kakaoLogin.do",
	                    type: "post",
	                    data: { "access_token": accessToken },
	                    success: function() {
	                        // 로그인 성공 후 메인 페이지로 이동
	                        window.location.href = "main.do";
	                    },
	                    error: function() {
	                        alert("카카오 로그인에 실패했습니다.");
	                    }
	                });
	            }
	        });
	    }
	</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
#idTr, #emailTr{
	margin-left: 70px;
}
th {
    display: flex;
    align-items: center;
    float: left;
    background-color: #D9D9D9;
    width: 120px;
    height: 48px;
    font-size: 15px;
    padding-left: 5px;
    margin-bottom: 10px;
}
table {
	width: 100%;
	border-collapse: collapse;
}
.text{
	width: 250px; 
	height: 47px;
	background-color: #E8F0FE;
	font-size: 15px;
	border: 0;
}
.logo {
	display: block;
	margin: 0 auto;
	width: 540px;
	height: 180px;
	margin-bottom: 30px;
}
#id_chk_btn, #email_chk_btn{
	background-color: #D9D9D9;
    width: 65px;
    height: 50px;
    border: 0;
    cursor: pointer;
}
.regi{
	width: 385px;
	height: 45px;
	background-color: #505567;
	color: white;
	margin-top: 30px;
	font-size: 24px;
	cursor: pointer;
}
</style>

</head>
<body>
	<div class="div">
		<form action="regiAf.do" id="regiForm" method="post">
			<table>
				<tr>
					<td colspan="2"><img src="img/logo1.PNG" alt="로고" class="logo"></td>
				</tr>
				<tr id="idTr" class="centerTr">
					<th>아이디</th>
					<td><input type="text" size="20" id="id" name="id"
						class="text" required>
						<input type="button" id="id_chk_btn" value="중복확인">
						<br>
						<p id="idcheck" style="font-size: 8px"></p></td>

				</tr>
				<tr class="centerTr">
					<th>비밀번호</th>
					<td><input type="password" size="20" id="pw" name="pw"
						class="text" placeholder="영문, 숫자, 특수문자 조합 9자리 이상" required></td>
				</tr>
				<tr class="centerTr">
					<th>비밀번호 확인</th>
					<td><input type="password" size="20" id="chk_pw"
						name="chk_pw" class="text" required>
						<br>
						<p id="pwcheck" style="font-size: 8px"></p></td>
				</tr>
				<tr class="centerTr">
					<th>이름</th>
					<td><input type="text" size="20" id="name" name="name"
						class="text" required></td>
				</tr>
				<tr id="emailTr" class="centerTr">
					<th>이메일</th>
					<td><input type="text" size="20" id="email" name="email"
						class="text" required>
						<input type="button" id="email_chk_btn" value="중복확인">
						<br>
						<p id="emailcheck" style="font-size: 8px"></p></td>
				</tr>
				<tr class="centerTr">
					<td colspan="2"><input type="submit" value="회원가입" class="regi">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script>
		$(document).ready(function(){
			// 아이디 중복확인
			$("#id_chk_btn").click(function(){
				$.ajax({
					url:"idcheck.do",
					type:"post",
					data:{ "id":$("#id").val() },
					success:function(answer){
						if(answer == "id_YES"){
							$("#idcheck").css("color", "#0000ff");
							$("#idcheck").text("사용할 수 있는 아이디입니다.");
						}else{
							$("#idcheck").css("color", "#ff0000");
							$("#idcheck").text("사용할 수 없는 아이디입니다.");
							$("#id").val("");
						}
					},
					error:function(){
						alert("error");
					}
				});
			});
			
			$("#email_chk_btn").click(function(){
	            $.ajax({
	                url:"emailcheck.do",
	                type:"post",
	                data:{ "email":$("#email").val() },
	                success:function(answer){
	                    if(answer == "email_YES"){
	                        $("#emailcheck").css("color", "#0000ff");
	                        $("#emailcheck").text("사용할 수 있는 이메일입니다.");
	                    }else{
	                        $("#emailcheck").css("color", "#ff0000");
	                        $("#emailcheck").text("사용할 수 없는 이메일입니다.");
	                        $("#email").val("");
	                    }
	                },
	                error:function(){
	                    alert("error");
	                }
	            });
	        });
			
			
			$("#regiForm").submit(function(event) {
				var pw = $("#pw").val().trim();
				var chkPw = $("#chk_pw").val().trim();
				
				// 비밀번호 확인
				if (pw !== chkPw) {
					event.preventDefault(); // 폼 제출을 막음
					$("#pwcheck").css("color", "#ff0000");
					$("#pwcheck").text("비밀번호가 일치하지 않습니다.");
					$("#pw").focus();
				} else {
			        // 비밀번호가 일치할때 형식 확인
			        var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*])[A-Za-z\d@$!%*#?&]{9,}$/;
			        if (!pwPattern.test(pw)) {
			        	event.preventDefault(); // 폼 제출을 막음
			            $("#pwcheck").css("color", "#ff0000");
			            $("#pwcheck").text("유효하지 않은 비밀번호 형식입니다.");
			            $("#pw").focus();
			          
			        } else {
			            $("#pwcheck").css("color", "#0000ff");
			            $("#pwcheck").text("올바른 비밀번호 형식입니다.");
			          }
			   		}
				
				// id 중복확인 버튼을 안눌렸을떄
				if (!$("#idcheck").text()) {
		            event.preventDefault();
		            $("#idcheck").css("color", "red");
		            $("#idcheck").text("아이디 중복을 확인해주세요.");
		            $("#id_chk_btn").focus();
		        }
				
				// email 중복확인 버튼을 안눌렸을떄
				if ($("#emailcheck").text() !== "사용할 수 있는 이메일입니다.") {
		            event.preventDefault();
		            $("#emailcheck").css("color", "red");
		            $("#emailcheck").text("이메일 중복을 확인해주세요.");
		            $("#email_chk_btn").focus();
		        }
			});
			
			// 이메일 형식 확인
			$("#email").on("input", function(){
				var email = $("#email").val().trim();
				var emailPattern = /^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
				
				if(!emailPattern.test(email)){
					$("#emailcheck").css("color", "#ff0000");
					$("#emailcheck").text("유효하지 않은 이메일 형식입니다.");
					// 이메일 형식이 올바르지 않으면 이메일 중복확인 버튼 비활성화
		            $("#email_chk_btn").prop("disabled", true);
				} else{
					$("#emailcheck").css("color", "#0000ff");
					$("#emailcheck").text("올바른 이메일 형식입니다.");
					// 이메일 형식이 올바르면 이메일 중복확인 버튼 활성화
		            $("#email_chk_btn").prop("disabled", false);
				}
			});
		});
		
		
		
	</script>
</body>
</html>
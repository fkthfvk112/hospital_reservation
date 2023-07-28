<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	UserDto dto = (UserDto)session.getAttribute("login");
	System.out.println(dto.getId()); // ID는 찍힘
	System.out.println(dto.getPw()); // PW는 NULL이라 찍힘..
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
	#modal{
		display : none; /* 처음 profile파일 들어왔을 땐 모달창이 안 보이게 하기 */
		z-index : 1;
		background-color: rgba(0,0,0,.3); /* 바탕창에 투명도 주기 */
		/* modal 영역이 브라우저 전체를 차지 */
		position:fixed;
		left:0;
		top: 0;
		width:100%;
		height:100%;
	}
	
	/* #modal css처리만 하면 바탕에 있는 내용과 모달 내용이 겹쳐져서 표시됨 그래서 #modal>#content 처리 해줌*/
	#modal>#content{
		width:300px;
		margin:100px auto;
		padding:20px;
		position: relative;
		background-color:#fff; /* 모달 배경색 줘서 겹쳐진 바탕창의 내용은 안 보이게 함 */
	}
	
	/* 종료 버튼을 오른쪼 상단으로, 종료 버튼의 배경색을 모달창 색과 같게 하여 x만 뜨게 */
	#modal .close{
	  position:absolute;
	  top:4px;
	  right:4px;	
	  font-size:20px;
	  border:0;
	  background-color: #fff;
	} 
	/* 마우스가 올려지면 마우스 포인터를 바꿔줌 */
	#modal .close:hover,
	#modal .close:focus {
	  color : #000;
	  text-decoration: none;
	  cursor :pointer;
	}	

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 
</head>
<body>
 
<div>
	<div> 아이디 : <%=dto.getId() %></div>
	<div> 이름 : <%=dto.getName() %></div>
	<div> 이메일 : <%=dto.getEmail() %></div>
	<div> 비밀번호 <button type="button" id="modalOpen">변경하기</button></div>
	<!-- <div> <button id = "delUser" type="button" onclick="delUser()">회원 탈퇴하기</button></div> -->
</div>

<div id="modal">
	<div id="content">
		<form action="changepw.do" method="post">
			<input type='button' value='X' class="close" id='modalClose'/>
			<p> 비밀번호 변경 </p>
			현재 비밀번호 : <input type="password" id="originpw"/>
			바꿀 비밀번호 : <input type="password" id="newpw"/>
			비밀번호 확인 : <input type="password" id="checkpw"/>
			<button type="button" value='open' onClick="pwCheck()">비밀번호 변경하기</button>
		</form>
	</div>
</div>
<script type="text/javascript">
	var modalOpen  = document.getElementById('modalOpen');
	var modalClose = document.getElementById('modalClose');
	
	var originpw = document.getElementById('originpw');
	var newpw = document.getElementById('newpw');
	var checkpw = document.getElementById('checkpw');
	
	// modal 창을 감춤
	var closeRtn = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'none';
	}
	
	// 비밀번호 체크
	function pwCheck(){
		$(document).ready(function() {
			$.ajax({
				url: "checkoriginpw.do",
				type:"post",
				data:{originpw: originpw.value, userid:"<%=dto.getId()%>"},
				success:function(result){

					if(result=="No"){
						alert('잘못된 비밀번호입니다.');
						outCondition = true;
						console.log(originpw.value);
						console.log("<%=dto.getPw()%>");
						// 입력받은 값들 다시 초기화
						originpw.value = null; 
						newpw.value = null;
						checkpw.value = null;
						return; // 비번 틀리면 함수 나감
					}
				}
			})
		})
		
		
		
		// 변경할 비번과 확인 비번이 같은지 확인
		if(newpw.value != checkpw.value){ 
			alert('새 비밀번호가 일치하지 않습니다.');
			// 입력받은 값들 다시 초기화
			originpw.value = null; 
			newpw.value = null;
			checkpw.value = null;
			return; // 비번 틀리면 함수 나감
		}
		
		
		$(document).ready(function() {
			// newpw 비밀번호 조합 확인 해야함
			$.ajax({
				url: "checknewpw.do",
				type:"post",
				data:{pw:newpw.value}, // pw에 새 비번 대입
				success:function(result){					
					if(result == false){
						alert("비밀번호는 하나 이상의 영문자+숫자+특문(특수문자는 ~!@#$%^&* 중 하나)로 구성되어야합니다.");
						originpw.value = null; 
						newpw.value = null;
						checkpw.value = null;
						return; // 조합 안 맞으면 함수 나감
					}
				}, error: function(){
					alret("error");
				}				
			})
			
			// ajax로 화면 전환 없이 디비에 접근해서 비밀번호 변경 처리
			$.ajax({
				url: "changepw.do",
				type:"post",
				data:{id:<%=dto.getId()%>, pw:newpw.value}, // pw에 새 비번 대입
				success:function(result){
					alert('success');
					
					if(result == true){
						alert("비밀번호가 변경되었습니다.");
					}else{
						alert("비밀번호가 변경을 실패했습니다.");
					}
					
					// 모달 창 꺼짐
					closeRtn;
				}, error: function(){
					alret("error");
				}				
			})
		})
	}
	
	// modal 창을 보여줌
	modalOpen.onclick = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'block';
	}
	
	// pwCheck.onclick = closeRtn;
	modalClose.onclick = closeRtn;	
	
	// 회원 탈퇴하기 <- ajax로 구현
</script>


</body>
</html>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	UserDto dto = (UserDto)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
		border-radius:0.5em;
		padding:1em;
		width:350px;
		margin:100px auto;
		padding:20px;
		position: relative;
		background-color:#fff; /* 모달 배경색 줘서 겹쳐진 바탕창의 내용은 안 보이게 함 */
		text-align:center;
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

	.clickitem{
		margin-top:0.5em;
		cursor: pointer;
		border: none;
	    background-color: #EDDEA4;
	    border-radius: 0.5em;
	    padding: 0.5em;
	    color: black;
	    transition: 0.2s;
		
	}
	.clickitem:hover{
		background-color: black;
		color: white;
	}
	
	.profileTable{
		border-collapse : collapse;
		border-spacing : 0;
		border:1px solid #e1e1e1;
		background-color: white;
	}
	
	.profileTable th{
		 background-color: #EDDEA4;
	}

	.profileTable td{
		padding:0.5em;
	}
	
	#mymenuitemA{
		background-color: #EDDEA4;
	}
	
	#mymenuitemA > .myPageNavA{
		color:black;
	}
	
	.managerBtn{
		background-color: #0FA3B1;
	    border: none;
	    border-radius: 1em;
	    color: white;
	    padding: 0.5em 1.3em 0.5em 1.3em;
	    margin:1em;
	}
	
	#managerModal{
		display:none; <!--flex-->
		justify-content:center;
		flex-direction:column;
		align-items:center;
		background-color:white;
		border:1px solid #e1e1e1;
		border-radius: 0.5em;
		padding:0em 2em 2em 2em;
		
		position:fixed;
		top:10vh;
	}
	
	#managerModalCloseBtn{
		background-color: transparent;
		border:none;
		font-size: 1.2em;
		  cursor: pointer;
	}
	
	#managerForm{
		display:flex;
		flex-direction: column;
	}
	
	#applyBtn {
	    border: none;
	    color: white;
	    font-weight: 400;
	    border-radius: 0.5em;
	    padding: 0.5em 1em 0.5em 1em;
	    background-color: #F7A072;
	    transition: 0.2s;
	}
	
	#applyBtn:hover{
		background-color: orange;
	}

	#changePwComBtn{
		border: none;
	    color: white;
	    font-weight: 400;
	    border-radius: 0.5em;
	    padding: 0.5em 1em 0.5em 1em;
	    background-color: #F7A072;
	    transition: 0.2s;
	}
	
	#changePwComBtn:hover{
		background-color: orange;
	}
	
	
	#changepwFrom{
		justify-content:center;
		flex-direction:column;
		align-items:center;
		background-color:white;
		border-radius: 0.5em;
	}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 
</head>
<body>
 <h2 style="margin:2em;">사용자 정보</h3>
 <div style="text-align: right; width:100%;">
 	<%if(dto !=null && dto.getAuth() != 2) {%>
 	<button type="button" class="managerBtn" id="managerAppliBtn">병원 관리자 신청</button>
 	<%} else{%>
 	<button type="button" class="managerBtn" id="toManagerPage">병원 관리자 페이지</button>
 	<%} %>
 </div>
 <table class="profileTable">
 	<col width="100"/><col width="300"/>
 	<tr>
 		<th>아이디</th>
 		<td><%=dto.getId() %></td>
 	</tr>
 	<tr>
 		<th>이름</th>
 		<td><%=dto.getName() %></td>
 	</tr>
 	<tr>
 		<th>이메일</th>
 		<td><%=dto.getEmail() %></td>
 	</tr>
 </table>
<button class = "clickitem" class="cpBtn" type="button" id="modalOpen">비밀번호 변경</button>

<div id="modal">
	<div id="content">
		<form action="changepw.do" method="post" id="changepwFrom">
			<input type='button' value='X' class="close" id='modalClose'/>
			<h2> 비밀번호 변경 </h2>
			<div style="margin-top:0.5em;">
				<div style="text-align: left">현재 비밀번호 </div>
				<input class="form-control" type="password" id="originpw"/>
			</div>
			<div style="margin-top:0.5em;">
				<div style="text-align: left">새 비밀번호</div>
				<input class="form-control" type="password" id="newpw" placeholder="영문, 숫자, 특수문자 조합 9자리 이상"/>
			</div>
			<div style="margin-top:0.5em;">
				<div style="text-align: left">비밀번호 확인</div>
				<input class="form-control" type="password" id="checkpw"/>
			</div>
			<button id="changePwComBtn" style="margin-top:1em;" type="button" value='open' onClick="pwCheck()">비밀번호 변경</button>
		</form>
	</div>
</div>

<!-- 매니저 신청 모달 -->
		<div id="managerModal">
			<div style="text-align: right; width:100%; margin:0.5em;">
				<button type="button" id="managerModalCloseBtn">X</button>
			</div>
			<h3 style="margin:0.5em;">병원 관리자 신청</h3>
			<p>병원 이름, 간략한 설명 등을 포함해 관련 서류를 동봉해주세요.</br>
			승인이 완료된 후 자신의 병원 페이지를 생성할 수 있습니다.</p>
			<form id="managerForm" action="applyManager.do" method="post" enctype="multipart/form-data">
				<input name="userId" type="hidden" value="<%=dto.getId() %>"/>
				<input name="title" id="managerInputTitle" class="form-control mb-3" type="text" placeholder="제목"></input>
				<textarea name="content" id="managerInputContent" placeholder="내용을 입력하세요." type="text" name="content" class="form-control mb-3" ></textarea>
				<input type="file" id="managerFile" name="file" title="관련 서류를 업로드해주세요." class="mb-3" multiple="multiple"></input>
				<button type="button" id="applyBtn">신청</button>
			</form>
			
		</div>
<script>
			let managerModal =  document.querySelector("#managerModal");
			let closeModal = ()=>{
				  managerModal.style.display = "none";
			}
			let openModal = ()=>{
				  managerModal.style.display = "flex";
			}
			
			let managerModalCloseBtn = document.querySelector("#managerModalCloseBtn");
			managerModalCloseBtn.addEventListener('click', ()=>{
				closeModal();
			})
			
			let managerAppliBtn = document.querySelector("#managerAppliBtn");
			if(managerAppliBtn != null && managerAppliBtn != undefined){
				managerAppliBtn.addEventListener("click", ()=>{
					openModal();
				})
			}
			
			$("#applyBtn").on("click", ()=>{
				if($("#managerInputTitle").val().length <3){
					alert("제목을 3자 이상 입력해주세요.");
					return;
				}
				if($("#managerInputContent").val().length < 10){
					alert("신청 내용을 10자 이상 입력해주세요.");
					return;
				}
				if(!$("#managerFile").val()){
					alert("관련 파일(증명서 등)을 등록해주세요.");
					return;
				}
				$("#managerForm").submit();	
			})
			
			$("#toManagerPage").on("click", ()=>{
				location.href = "ownerPage.do";
			})
			
</script>
		
<script type="text/javascript">
	var modalOpen  = document.getElementById('modalOpen');
	var modalClose = document.getElementById('modalClose');
	
	var originpw = document.getElementById('originpw');
	var newpw = document.getElementById('newpw');
	var checkpw = document.getElementById('checkpw');

	
	// modal 창을 보여줌
	modalOpen.onclick = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'block';
	}
	
	
	// modal 창을 감춤
	var closeRtn = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'none';
	  initPw();
	}
	
	function initPw() { // 잘못 입력시 초기화 시키는 기능은 유저가 선호하지 않음
		originpw.value = null; 
		newpw.value = null;
		checkpw.value = null;
	}
	
	
	// 비밀번호 체크
	function pwCheck(){
		let userID = "<%=dto.getId()%>";
		var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*])[A-Za-z\d@$!%*#?&]{9,}$/;
		
		if (originpw.value==="" || newpw.value==="" || checkpw.value=="") {
			alert("모든 정보를 입력해주세요.");
		} else if (newpw.value!=checkpw.value) {
			alert("변경할 새 비밀번호와 확인 비밀번호가 일치하지 앖습니다.");
		} else if (!pwPattern.test(newpw.value)) {
        	alert("새 비밀번호가 유효하지 않은 비밀번호 형식입니다.");
        }else {
			$.ajax({ 
				url: "changePassword.do",
				type:"post",
				data:{ userId:userID, originPw: originpw.value , newPw: newpw.value},
				success:function(result){
					if(result == "originErr"){
						alert("기존 비밀번호를 잘 못 입력하였습니다.");
					}else if(result == "success"){
						alert("비밀번호가 변경되었습니다.");
						// initPw(); <- 해당 메소드를 closeRtn()안에 넣음
						// 모달 창 꺼짐
						closeRtn();
					}else {
						alert("비밀번호 변경 실패");
						initPw();
					}
					
				},
				error: function(){
					alert("ajax error");
				}
			})
		}
	}
	
	modalClose.onclick = closeRtn;	
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
<style>
 #profileContainer{
 	background-color:#e1e1e1;
 	padding:2em;
 	margin:1px solid black;
 	border-radius:0.5em;
 	
 }
</style>
</html>
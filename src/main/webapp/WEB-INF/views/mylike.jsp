<%@page import="component.dto.HospitalDto"%>
<%@page import="java.util.List"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String logid = ((UserDto)session.getAttribute("login")).getId();

	List<HospitalDto>  likeHospitalList = (List<HospitalDto>)request.getAttribute("likeHospitalList");
	if(likeHospitalList == null || likeHospitalList.size() == 0){
		%>
		<div> 찜한 병원이 없습니다.</div>
		<% 
	} else {
			%>
			<!DOCTYPE html>
			<html>
			<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			
			<style type="text/css">
			.hospital{
			 	display: flex;
			}
			
			.ho-left{
				margin-right: 1em;
			}
			
			</style>
			
			 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
			
			</head>
			<body>
			
			<div>
				<%
					for( HospitalDto dto: likeHospitalList){
						%>
						
						<div class = "hospital">
							<div class= "ho-left">
								이미지<br> 
								<button type="button" onclick="moveHospitalDetail()">병원 상세 보기</button>
								<%--1.jquery로 클릭이벤트 처리
								 <button type="button" id = "canclelike" value="<%=dto.getId() %>">찜 해제</button> --%>
								<button type="button" onclick="cancleLike(<%=dto.getId() %>)">찜 해제</button>
							</div>
							
							<div class= "ho-right">
								<div class="hosinfo">
									병원명 &nbsp;&nbsp; <%= dto.getTitle() %>
								</div>
								<div class="hosinfo">
									종류 &nbsp;&nbsp; <%= dto.getSort() %>
								</div>
								<div class="hosinfo">
									운영시간 &nbsp;&nbsp; <%= dto.getOpertime() %>
								</div>
								<div class="hosinfo">
									설명 &nbsp;&nbsp; <%= dto.getDescription() %>
								</div>
							</div>
						</div>
						<br><br>
						<%
					}
				%>
			</div>
			
			<script type="text/javascript">
			<%-- 1.jquery로 클릭이벤트 처리
			       근데 클릭된 병원 아이디를 어케 받아올 수 있는지 몰겠 아래 처럼 하니까 $("#canclelike").value는 null 뜸
			$(document).ready(function() {
				
				$("#canclelike").click(function cancleLike(){
				    alert('찜 해제를 클릭하셨습니다.');  
				    console.log("클릭한 병원 아이디 : " + $("#canclelike").value);
				    $.ajax({
						url: "canclelike.do",
						type:"get",
						data:{userId:<%=logid%>, hospitalId:$("#canclelike").value}, 
						success:function(result){
							alert('success');
							
							if(result == true){
								alert("찜이 해제되었습니다.");
							}else{
								alert("찜 해제를 실패했습니다.");
							}
						}, error: function(){
							alret("error");
						}
					})
				})
			});
			 --%>	
			<%--  해당 코드로도 해제는 가능하나 ajax로 하면 찜 해제 직후 찜한 병원 목록이 바로 업데이트가 안 됨
			function cancleLike(hospId){
				console.log("클릭한 병원 아이디 : " + hospId);
				$(document).ready(function() {
					
					 $.ajax({
							url: "canclelike.do",
							type:"get",
							data:{userId:"<%=logid%>", hospitalId: hospId}, 
							success:function(result){
								alert('success');
								
								if(result == true){
									alert("찜이 해제되었습니다.");
								}else{
									alert("찜 해제를 실패했습니다.");
								}
							}, error: function(){
								alret("error");
							}
						})
				});
				
			}
			 --%>
			function cancleLike(hospId){
				console.log("클릭한 병원 아이디 : " + hospId);
				
				location.href = "canclelike.do?userId="+"<%=logid%>"+"&hospitalId="+hospId;
			}
			</script>
			</body>
			</html>
			<% 
	}
	
%>

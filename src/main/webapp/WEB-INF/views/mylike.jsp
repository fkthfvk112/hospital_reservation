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
				margin-right: auto;
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
								<button type="button" id = "canclelike" value="<%=dto.getId() %>">찜 해제</button>
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
			$(document).ready(function() {
				
				$("#canclelike").click(function cancleLike(){
				    alert('찜 해제를 클릭하셨습니다.');  
				    console.log("클릭한 병원 아이디 : " + $("#canclelike").value);
				    $.ajax({
						url: "changepw.do",
						type:"post",
						data:{userId:<%=logid%>, hospitalId:$("#canclelike").value}, // pw에 새 비번 대입
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
				
				
			</script>
			</body>
			</html>
			<% 
	}
	
%>

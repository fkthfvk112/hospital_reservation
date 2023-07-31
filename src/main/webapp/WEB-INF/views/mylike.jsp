<%@page import="component.dto.HospitalDto"%>
<%@page import="java.util.List"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String logid = ((UserDto)session.getAttribute("login")).getId();

	List<HospitalDto>  likeHospitalList = (List<HospitalDto>)request.getAttribute("likeHospitalList");
	List<String> hosphotos = (List<String>)request.getAttribute("hosphotos");
	System.out.println("마이라이크.jsp hosphotos : "+hosphotos);
			
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
			
			#toDetailBtn{
				border:none;
				background-color:#9adafc;
				border-radius:0.5em;
				padding:0.5em;
				color:white;
				transition:0.2s;
			}
			
			#toDetailBtn:hover{
				background-color:blue;
			}
			
			#likeDelBtn{
				border:none;
				background-color:#8f8f8f;
				border-radius:0.5em;
				padding:0.5em;
				color:white;
				transition:0.2s;
			}
			
			#likeDelBtn:hover{
				background-color:black;
			}
				
			.hospital{
			 	display: grid;
			 	grid-template-columns: 1fr 1fr;
			 	background-color: white;
			 	border:1px solid black;
			 	border-radius:0.5em;
			 	padding:1em;
			}
			
			.ho-left{
				margin-right: 1em;
				
			}
			.ho-left-down{
				text-align:center;
				grid-column: span 2;
				border-top:1px solid #e1e1e1;
				padding:0.5em;
			}
			img{
				width: 12em;
				height:7em;
			}
			
			.hosinfo{
				margin:0.3em;
			}
			
			.hosinfo >strong{
				margin-right:0.5em;
			}
			.clickitem{
				cursor: pointer;
			}
			

			#mymenuitemC{
				background-color: #EDDEA4;
			}
			
			#mymenuitemC > .myPageNavA{
				color:black;
			}
			</style>
			
			 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
			
			</head>
			<body>
			 <h2 style="margin:2em;">내 찜 목록</h3>
			<div>
				<%
					for( int i = 0; i <likeHospitalList.size(); i++){
						HospitalDto dto = likeHospitalList.get(i);
						%>
						<div class = "hospital">
							<div class= "ho-left">
								<%
									if(hosphotos.get(i)==null || hosphotos.get(i).equals("")){
										%>
										<img src="./images/no_img.jpg" alt="병원 이미지"><br>
										<%
									}else{
									%>
									<img src=<%=hosphotos.get(i) %> alt="병원 이미지"><br> 
									<%
									}
								%>
							</div>
							
							<div class= "ho-right">
								<div class="hosinfo" >
									<strong>병원명</strong>
									<%= dto.getTitle() %>
								</div>
								<div class="hosinfo">
									<strong>진료과</strong>
									<select class = "clickitem">
										<% 
											String[] sort= dto.getSort().split(",");
										System.out.println("sort: "+sort);
											
											for(int j = 0; j <sort.length; j++){
												if(j == 0){
													%>
													<option  selected disabled ><%= sort[j] %></option>
													<%	
												}else{
													%>
													<option  disabled><%= sort[j] %></option>
													<%
														System.out.println("srot:"+sort[j]);
												}
											}
										%>
										</select>
								</div>
								<div class="hosinfo">
									<%
										String time[] = dto.getOpertime().split(",");
									%>
									<strong>운영시간</strong><%= time[0] %>:00시 ~ <%= time[1] %>:00시
								</div>
								<div class="hosinfo">
									<strong>병원 설명</strong> <%= dto.getDescription() %>
								</div>
							</div>
							<div class = "ho-left-down" >
								<button id="toDetailBtn" class = "clickitem" type="button" onClick="location.href='hospitalDetail.do?id='+<%=dto.getId()%>">병원 상세 보기</button>
								<button id="likeDelBtn"class = "clickitem" type="button" onclick="cancleLike(<%=dto.getId() %>)">찜 해제</button>
							</div>
						</div>
						
						<br><br>
						<%
					}
				%>
			</div>
			
			<script type="text/javascript">

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

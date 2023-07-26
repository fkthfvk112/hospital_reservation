<%@page import="utils.HosUtils"%>
<%@page import="component.dto.UserDto"%>
<%@page import="component.dto.HospitalDto"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
List<HospitalDto> dtoList = (List<HospitalDto>) request.getAttribute("hospitalDtoList");
for(HospitalDto dto:dtoList){
	System.out.println(dto.toString());
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="m-3" style="text-align: center;">
	<div style="text-align: left;">
		<select>
			
		</select>
	</div>
	<input type="text" />
	<button>검색</button>
</div>
<section>
<% for(HospitalDto dto:dtoList){ %>
	<a href="hospitalDetail.do?id=<%=dto.getId()%>">
		<div id="card">
			<div id="upperSide"> <!-- 위쪽 영역 -->
				<img src="" alt="no img" class="hosImg"/>
				<div id="upperSideRight">
					<strong class="mt-1"><%=dto.getTitle() %></strong>
					<div class="mt-2">
						<span style="color:#FFCB12; font-size:1.2em">★</span>
						<sapn">평점(리뷰 점수 취합)</sapn>
					</div>
					<div class="mt-3">
						<div>영업시간</div>
						<div><%=HosUtils.passOperationTime(dto.getOpertime())  %></div>
					</div>
					<div id="sortContainer" class="mt-3">
						<% for(String sort:HosUtils.getStringList_seperByDelim(dto.getSort(), ",")){ %>
							<span class="sortBadge" style="border:2px solid <%=HosUtils.getColorFromAscii(sort) %>"><%=sort %></span>
						<%} %>
					</div>
	
				</div>
			</div>
			<div><!-- 아래쪽 영역 -->
				<div id="descriptionContainer">
					<%=dto.getDescription() %>
				</div>
			</div>
		</div>
	</a>
<%} %>	
</section>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>

<style>
	body{
		background-color: #E2F0F7;
	}
	a{
		text-decoration: none;
		color:black;
		transition: transform 0.2s ease;
	}
	a:hover {
	  transform: scale(1.02);
	}
	section{
		background-color:white;
		margin:2em 0em 2em 0em;
		display: flex;
		justify-content: center;
		align-content: center;
		flex-direction: row;
		flex-wrap: wrap;
	}
	#card{
		background-color:white;
		border:1.5px solid #B0B0B0;
		box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
		display:inline-block;
		border-radius: 10px;
		width:550px;
		padding:0.5em;
		margin:1em;
	}
	
	#upperSide{
		display:flex;
		flex-direction: row;
		
	}
	
	#upperSideRight{
		display: flex;
		flex-direction: column;
		width:300px;
		margin-left:1.3em;
	}
	
	.hosImg{
		width:150px;
		height:100px;
		min-width:300px;
		min-height:200px;
		background-color: gray;
	}
	
	.sortBadge{
		padding:0.3em;
		border-radius:1em;
		white-space: nowrap;
		margin:0.2em;
		font-size:0.8rem;
	}
	#sortContainer{
		display:flex;
		flex-wrap: wrap;
		justify-content: flex-start;
		align-items: flex-start;
	}
	
	#descriptionContainer{
		padding:1em;
	}
</style>
</html>
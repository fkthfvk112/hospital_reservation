<%@page import="utils.HosUtils"%>
<%@page import="component.dto.UserDto"%>
<%@page import="component.dto.HospitalDto"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
 <jsp:include page="header.jsp" flush="false"/>
 <jsp:include page="nav.jsp" flush="false"/>
<div class="m-3" style="text-align: center;">
	<div>
		<div id="searchContainer">
			<form action="searchHospital.do" method="get" id="searchFrom" accept-charset="UTF-8">
					<input type="hidden" id ="userLocation" name="userLocation"/>

					<div>
						<input id="conditionThreeInput" placeholder='이름, 진료과, 설명' type="text" name="conditionThree""/>
						<button type="button" id="filterBtn">검색</button>
						<div style="text-align:left; margin-left:0.3em;">
							<select name="conditionOne" id="conditionOne">
								<option value="default" selected>최신순</option>
								<option value="highScore">평점 높은 순</option>
								<option value="lowScore">평점 낮은 순</option>
								<option value="highReview">리뷰 많은 순</option>
								<option value="lowReview">리뷰 적은 순</option>
							</select>
							<select name="conditionTwo" id ="conditionTwo">
								<option value="-1" selected>상관 없음</option>
								<option value="1">거리 1km 이하</option>
								<option value="3">거리 3km 이하 </option>
								<option value="10">거리 10km 이하</option>
								<option value="30">거리 30km 이하</option>
								<option value="100">거리 100km 이하</option>
							</select>
						</div>
					</div>
			</form>
		</div>
	</div>

</div>
<section>
<%if(dtoList != null) {%>

<% for(HospitalDto dto:dtoList){ %>
<%-- 	<a href="hospitalDetail.do?id=<%=dto.getId()%>">
 --%>		<div id="card">
			<div id="upperSide"> <!-- 위쪽 영역 -->
				<img src="" alt="no img" class="hosImg"/>
				<div id="upperSideRight">
					<a style="padding:0.3em 0.3em 0em 0.3em;" href="hospitalDetail.do?id=<%=dto.getId()%>">
						<strong class="mt-1"><%=dto.getTitle() %></strong>
					</a>
					<div class="mt-2">
						<span style="color:#FFCB12; font-size:1.2em">★</span>
						<%if(dto.getStarAvg() != null){ %>
						<sapn><%=Math.round(dto.getStarAvg() * 100.0) / 100.0 %></sapn>
						<%}else{ %>
						<sapn">평점 없음</sapn>
						<%} %>
					</div>
					<div class="mt-3">
						<div>영업시간</div>
						<div><%=HosUtils.passOperationTime(dto.getOpertime())  %></div>
					</div>
					<div id="sortContainer" class="mt-3">
						<% for(String sort:HosUtils.getStringList_seperByDelim(dto.getSort(), ",")){ %>
							<a class="sortAtag" href="searchHospital.do?userLocation=&conditionOne=default&conditionTwo=-1&conditionThree=<%=sort %>">
								<span class="sortBadge" style="border:2px solid <%=HosUtils.getColorFromAscii(sort) %>"><%=sort %></span>
							</a>
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
<!-- 	</a>
 -->	<%} %>	
<%}%>
</section>


<jsp:include page="footer.jsp" flush="false"/>
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
	
	.sortAtag{
		margin:0.2em 0em 0.2em 0em;
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
	
	#searchFrom{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	#conditionThreeInput{
		border:5px solid #F7A072;
		margin:0.5em 0em 0em 0em;
		width:23em;
		padding:0.5em 1.3em 0.5em 1.3em;
	}
	
	#filterBtn{
		border:none;
		color:white;
		font-weight:400;
		border-radius: 0.5em;
		padding:0.5em 1em 0.5em 1em;
		background-color: #F7A072;
		transition:0.2s;
	}
	
	#filterBtn:hover{
		background-color: orange;
	}
	
	#conditionOne{
		padding:0.3em;
		border:none;
				background-color: transparent;
		
	}
	#conditionTwo{
		padding:0.3em;
		border:none;
		background-color: transparent;
		
	}
</style>

<script>
const conditionTwo = document.querySelector("#conditionTwo");
const userLocation = document.querySelector("#userLocation");
const searchFrom = document.querySelector("#searchFrom");

filterBtn.addEventListener('click', async()=>{
    if(conditionTwo.value != -1){
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
      } else {
        alert("브라우저에서 현재 위치 정보를 지원하지 않습니다.")
        console.log("Geolocation is not supported by this browser.");
      }

       function successCallback(position) {
        const location = {
          latitude:position.coords.latitude,
          longitude:position.coords.longitude
        }
        console.log("Latitude: " + position.coords.latitude +
        ", Longitude: " + position.coords.longitude);
        console.log(JSON.stringify(location));
        userLocation.value = JSON.stringify(location);
        searchFrom.submit();
      }

      function errorCallback(error) {
        console.log("Unable to retrieve your location due to " + error.code + ": " + error.message);
      }
    }
    else{
    	searchFrom.submit();
    }
  })</script>
</html>
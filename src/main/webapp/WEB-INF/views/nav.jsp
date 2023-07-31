<%@page import="java.util.List"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">
/* navbar */
        .allNav{

            background-color:#0FA3B1;
        }
        

</style>
</head>
<body>
<%-- <nav class="allNav">
        <div class="navLeft">
            <ul>
                <a href="home.do"><li>Hosital Mate 소개</li></a>
                <a href="hosList.do"><li>병원찾기</li></a>
                <!-- 임시로 병원번호를 설정함 -->
                <!-- <a href="hospitalDetail.do"><li>병원디테일</li></a> -->
                <a href="toHosCreate.do"><li>병원등록</li></a>
            </ul>
        </div>
        	<%	
	        	UserDto login = (UserDto)session.getAttribute("login");
		        if(login != null){
	        	%>
	        	<div class="navRight">
            		<ul>
		                <a href="mypage.do"><li>마이페이지</li></a>
		                <a href="logout.do"><li>로그아웃</li></a>
		            </ul>
        		</div>
	        	<%
	        	}else{	// 세션이 존재하지 않으면 == 로그인안됨
	        		%>
	        	<div class="navRight">
            		<ul>
		                <a href="login.do"><li>로그인</li></a>
		            </ul>
        		</div>
	        	<%	
	        	}
			%>
</nav>
 --%>
<nav class="allNav navbar navbar-expand-lg">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item m-3">
          <a href="home.do">Hosital Mate 소개</a>
        </li>
        <li class="nav-item m-3">
          <a href="hosList.do">병원찾기</a>
        </li>
        <li class="nav-item m-3">
          <a href="toHosCreate.do">병원등록</a>
        </li>
      </ul>
      <div class="d-flex" role="search">
                  	<%	
	        	UserDto login = (UserDto)session.getAttribute("login");
		        if(login != null){
	        	%>
		        	<a class="m-3" href="mypage.do">마이페이지</a>
		        	<a class="m-3" href="logout.do">로그아웃</a>
	        	<%
	        	}else{	// 세션이 존재하지 않으면 == 로그인안됨
	        		%>
		        	<a class="m-3" href="login.do">로그인</a>
	        	<%	
	        	}
			%>
      </div>
    </div>
  </div>
</nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>
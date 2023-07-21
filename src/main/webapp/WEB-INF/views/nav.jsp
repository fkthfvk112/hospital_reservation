<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/* navbar */
        nav{
            display: flex;
            align-items: center;
            justify-content: space-around;
            background-color: #0FA3B1;
            
        }
        .navLeft li, .navRight li{
            display: inline-block;
            margin: 20px;   
        }
</style>
</head>
<body>
<nav>
        <div class="navLeft">
            <ul>
                <a href="home.do"><li>Hosital Mate 소개</li></a>
                <a href="#"><li>병원찾기</li></a>
                <a href="askBoard.do"><li>질문게시판</li></a>
            </ul>
        </div>
        <%
 			UserDto login = (UserDto)session.getAttribute("login");	// dto, DB 만들어야됨 -> 되는거 확인함
	        if(login != null){	// 세션이 존재하면 == 로그인됨
	        
	        	%>
	        	<div class="navRight">
            		<ul>
		                <a href="#"><li>마이페이지</li></a>
		                <a href="#"><li>로그아웃</li></a>
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
</body>
</html>
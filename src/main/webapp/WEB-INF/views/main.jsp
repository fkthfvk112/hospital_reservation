<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	UserDto dto = (UserDto)session.getAttribute("login");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>


<script>
    // 세션 정보를 콘솔에 출력하는 함수
    function showSession() {
        <%-- 세션 정보를 JavaScript 변수에 저장 --%>
        /* 카카오 */
        var userId = "<%= session.getAttribute("userId") %>";
        var nickname = "<%= session.getAttribute("nickname") %>";
        var email = "<%= session.getAttribute("email") %>";
        var accT = "<%= session.getAttribute("accessToken") %>";
        /* 로컬 */
        var dto = "<%= (UserDto)session.getAttribute("login")%>";

        <%-- 콘솔에 세션 정보 출력 --%>
        /*
        console.log("카카오 로그인시")a
        console.log("User ID: " + userId);
        console.log("Nickname: " + nickname);
        console.log("Email: " + email);
         */
        console.log("로그인 된 세션");
        console.log("dto: " +dto);
        console.log("토큰 확인 : " + accT);
    }
    // request.getSession().getAttribute("login")
    	// 세션 겟어트리뷰트로 로그인
    	// 페이지 로드 시 세션 정보 출력
		showSession();
    
</script>

    
    <button onclick="location.href='logout.do'">로그아웃</button>
    
    <button onclick="location.href='login.do'">로그인</button>

</body>
</html>
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
<h1>메인 페이지 입니다~~</h1>
<h2>콘솔에 세션 확인됩니다</h2>


<script>
    // 세션 정보를 콘솔에 출력하는 함수
    function showSession() {
        <%-- 세션 정보를 JavaScript 변수에 저장 --%>
        var userId = "<%= session.getAttribute("userId") %>";
        var nickname = "<%= session.getAttribute("nickname") %>";
        var email = "<%= session.getAttribute("email") %>";
        
        var dto = "<%= (UserDto)session.getAttribute("login")%>";

        <%-- 콘솔에 세션 정보 출력 --%>
        console.log("카카오 로그인시")
        console.log("User ID: " + userId);
        console.log("Nickname: " + nickname);
        console.log("Email: " + email);
        
        console.log("로컬 로그인시")
        console.log("dto: " +dto);
    }
    // request.getSession().getAttribute("login")
    	// 세션 겟어트리뷰트로 로그인
    	// 페이지 로드 시 세션 정보 출력
		showSession();
    
    
</script>

</body>
</html>
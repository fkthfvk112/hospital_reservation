<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
=======
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDto dto = (UserDto)session.getAttribute("login");
	String siteId = dto.getId();
	String siteName = dto.getName();
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

    	// 카카오톡

        <%-- 세션 정보를 JavaScript 변수에 저장 --%>
        var userId = "<%= session.getAttribute("userId") %>";
        var nickname = "<%= session.getAttribute("nickname") %>";
        var email = "<%= session.getAttribute("email") %>";

        <%-- 콘솔에 세션 정보 출력 --%>
        console.log("User ID: " + userId);
        console.log("Nickname: " + nickname);
        console.log("Email: " + email);

        
        console.log("siteId: " + "<%= siteId %>");
        console.log("siteName: " + "<%= siteName %>"); // session을 우리가 톰캣에 저장하는거라? 브라우저 개발자 도구에 session Storage에는 안 보임
        
       
       

    }

    // 페이지 로드 시 세션 정보 출력
    showSession();
</script>

</body>
</html>
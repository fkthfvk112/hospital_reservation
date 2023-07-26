<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String message = (String)request.getAttribute("message");
if(message != null && message.equals("") == false){
	if(message.equals("USER_YES")){
		%>
		<script>
		alert("환영합니다. 가입을 축하드립니다 !");
		location.href = "login.do";
		</script>
		<%	
	}else{
		%>
		<script>
		alert("가입되지 않았습니다. 다시 가입해 주세요");
		location.href = "regi.do";
		</script>
		<%
	}	
}
%>

<%
String kakaologinmsg = (String)request.getAttribute("kakaologinmsg");
if(kakaologinmsg != null && kakaologinmsg.equals("") == false){
	if(kakaologinmsg.equals("kakao_YES")){
		%>
		<script>
		alert("카카오 로그인이 되었습니다 !");
		location.href = "main.do";
		</script>
		<%	
	}else{
		%>
		<script>
		alert("카카오 로그인에 실패하였습니다 ..........");
		location.href = "login.do";
		</script>
		<%
	}	
}
%>

<%
String loginmsg = (String) request.getAttribute("loginmsg");
if (loginmsg != null && !loginmsg.isEmpty()) {
    if (loginmsg.equals("LOGIN_YES")) {
%>
    <script>
        alert("로그인 되었습니다");
        location.href = "main.do";
    </script>
<%
    } else {
%>
    <script>
        alert("아이디나 비밀번호를 확인해 주십시오");
        location.href = "login.do";
    </script>
<%
    }
}
%>
<%
String NewPwmsg = (String) request.getAttribute("NewPwmsg");
if (NewPwmsg != null && !NewPwmsg.isEmpty()) { %>
        <script>
            alert("비밀번호가 재설정 되었습니다.");
            location.href = "login.do";
        </script>
    <% } %>







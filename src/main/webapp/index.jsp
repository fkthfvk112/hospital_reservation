<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
System.out.println(session.getAttribute("login"));
%>
<!-- <html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<<<<<<< HEAD
<h1>
	hello world2
</h1>

<h1>로그인으로</h1>
<form action="login.do" method="get">
	<button>버튼</button>
</form>

<h1>병원 목록으로</h1>
<form action="hosList.do" method="get">
	<button>버튼</button>
</form>

<h1>병원 디테일로</h1>
<form action="hospitalDetail.do" method="get">
	<input type="text" name="id" placeholder="병원ID"/>
	<button>버튼</button>
</form>


<a href="toHosCreate.do">병원 생성 페이지로</a> -->
<%
response.sendRedirect("home.do");
%>

</body>
</html>
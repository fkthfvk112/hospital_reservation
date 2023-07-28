<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String content = (String)request.getAttribute("content");
	if(content == null){
		content = "profile";	
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
	#mytotal{
		display: flex;
      	flex-wrap: wrap;
		flex-direction: row;
	
	}
	#mysidemenubar{
		margin-top: 20px;
		background: #EDDEA4; /* 영어랑 숫자 조합으로 색깔 표기하는게 HEX인 듯? -> 따로 ""없이 그냥 앞에 # 붙이면 됨 */
		width: 10%;
		height: 170px;
		border-radius: 5px;
		
		position: -webkit-sticky; 
		position: sticky;
		top:50px;
		
	}
	#mycontent{
		margin: 20px;
	}
</style>
</head>
<body>

<jsp:include page="header.jsp" flush="false"/>
<jsp:include page="nav.jsp" flush="false"/>
 
<div id="mytotal">
	<div id="mysidemenubar">
		<jsp:include page="mypagemenu.jsp" flush="false"/>
	</div>
	<div id="mycontent">
		<jsp:include page='<%= content + ".jsp" %>' flush="false"/>
	</div>
</div>

<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
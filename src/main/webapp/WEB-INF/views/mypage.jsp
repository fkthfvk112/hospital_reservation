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
	#total{
		display: flex;
      	flex-wrap: wrap;
		flex-direction: row;
	}
	#sidemenubar{
		background: #EDDEA4; /* 영어랑 숫자 조합으로 색깔 표기하는게 HEX인 듯? -> 따로 ""없이 그냥 앞에 # 붙이면 됨 */
		width: 10%;
	}
	#content{
		margin: 20px;
	}
</style>
</head>
<body>
 
<div id="total">
	<div id="sidemenubar">
		<jsp:include page="mypagemenu.jsp" flush="false"/>
	</div>
	<div id="content">
		<jsp:include page='<%= content + ".jsp" %>' flush="false"/>
	</div>
</div>


</body>
</html>
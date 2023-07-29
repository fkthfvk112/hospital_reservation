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
	#contents{
		display: flex;
		width:100%;
		height:100%;
      	flex-wrap: wrap;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		padding:5em;
		
	
	}
	#mysidemenubar{
		top:30vh;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
		align-self: flex-start;
		background-color: white; /* 영어랑 숫자 조합으로 색깔 표기하는게 HEX인 듯? -> 따로 ""없이 그냥 앞에 # 붙이면 됨 */
		width: 15%;
		height: 200px;
		position: -webkit-sticky; 
		position: sticky;
		border-radius: 0.5em;
	}

	
	#myPageContainer{
		display:flex;
		justify-content: start;
		align-items: start;
	}
	

</style>
</head>
<body>
<jsp:include page="header.jsp" flush="false"/>
<jsp:include page="nav.jsp" flush="false"/>
<div id="myPageContainer">
<div id="mysidemenubar">
	<jsp:include page="mypagemenu.jsp" flush="false"/>
</div>
<div id="contents">
	<jsp:include page='<%= content + ".jsp" %>' flush="false"/>
</div>
</div>
<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
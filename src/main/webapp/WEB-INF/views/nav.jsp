<%@page import="java.util.List"%>
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
                <a href="home.do"><li>Hosital Mate �Ұ�</li></a>
                <a href="#"><li>����ã��</li></a>
                <a href="askBoard.do"><li>�����Խ���</li></a>
                <!-- �ӽ÷� ������ȣ�� ������ -->
                <a href="review.do?hospital_id=1"><li>����</li></a>
                <!-- <a href="hospitalDetail.do"><li>����������</li></a> -->
                <!-- <a href="toHosCreate.do"><li>�������</li></a> -->
            </ul>
        </div>
        <%	
	        	UserDto login = (UserDto)session.getAttribute("login");
		        if(login != null){
	        	%>
	        	<div class="navRight">
            		<ul>
		                <a href="myPage.do"><li>����������</li></a>
		                <a href="logout.do"><li>�α׾ƿ�</li></a>
		            </ul>
        		</div>
	        	<%
	        	}else{	// ������ �������� ������ == �α��ξȵ�
	        		%>
	        	<div class="navRight">
            		<ul>
		                <a href="login.do"><li>�α���</li></a>
		            </ul>
        		</div>
	        	<%	
	        	}
		%>
</nav>
</body>
</html>
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
            </ul>
        </div>
        <%
 			UserDto login = (UserDto)session.getAttribute("login");	// dto, DB �����ߵ� -> �Ǵ°� Ȯ����
	        if(login != null){	// ������ �����ϸ� == �α��ε�
	        
	        	%>
	        	<div class="navRight">
            		<ul>
		                <a href="#"><li>����������</li></a>
		                <a href="#"><li>�α׾ƿ�</li></a>
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
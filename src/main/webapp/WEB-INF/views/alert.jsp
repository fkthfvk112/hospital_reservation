<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	System.out.println("alert.jsp 실행");
	String target = (String)request.getAttribute("target");
	String result = (String)request.getAttribute("result");
	String  NP= (String)request.getAttribute("nextpage"); 
	
	System.out.println("alert result : "+result);
	if(result != null && result.equals("")==false){
		System.out.println("alert if문 실행 ");
		if(result.equals("YES")){
			%>
			<script>
				<%-- alert(<%=target%> +" 성공");  <%= 값 %> + "문자열"이 아니고 "안에 "<%= 값 %> 문자열"이라고 적어야 돌아감--%>
				alert( "<%=target%> 성공");
				<%-- location.href = <%=NS %>+"?param="+<%=NP%>; 제대로 안 돌아감--%>
				location.href = "<%=NP%>";
			</script>
			<%
		} else {
			System.out.println("alert else문 실행 ");
			%>
			<script>
				console.log("else문 실행됨")
				alert("<%=target%>  실패");
				location.href = "<%=NP%>";
			</script>
			<%
		}
	}
%>
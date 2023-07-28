<%@page import="component.dto.MyReviewDto"%>
<%@page import="component.dto.ReviewDto"%>
<%@page import="component.dto.UserDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String logid = ((UserDto)session.getAttribute("login")).getId();

	List<MyReviewDto>  likeReviewDtoList = (List<MyReviewDto>)request.getAttribute("likeReviewDtoList");
	System.out.println("likeReviewDtoList : "+likeReviewDtoList);
	System.out.println("likeReviewDtoList.size() : "+likeReviewDtoList.size());
	
	if(likeReviewDtoList == null || likeReviewDtoList.size() == 0){
		%>
		<div> 작성한 리뷰가 없습니다.</div>
		<% 
	} else {
		%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		
		<style type="text/css">
			.clickitem{
				cursor: pointer;
			}
		</style>
		</head>
		<body>
		
		<div>
		<table>
			<col width="50"><col width="150"><col width="100"><col width="100"><col width="40"><col width="300">
			<thead>
				<th>번호</th><th>병원명</th><th>종류</th>
				<th>작성일</th><th>평점</th><th>내용</th><th>삭제</th> <!-- 위치 어케 표기? -->
			</thead>
			<%
				for(int i=0; i< likeReviewDtoList.size(); i++){
					MyReviewDto reviewDto = likeReviewDtoList.get(i);
					System.out.println("likeReviewDtoList "+i+"번 돌음");
					%>
					<tbody>
						<tr> 
							<td><%= i+1 %></td>
							<td id="hospitalName" class = "clickitem" onClick="location.href='hospitalDetail.do?id='+<%=reviewDto.getHospital_id()%>"><%=reviewDto.getHtitle()%></td> <!-- 병원 상세 페이지로 링크 수정하기 -->
							<td>
								<select class = "clickitem">
								<% 
									String[] sort= reviewDto.getHsort().split(",");
								System.out.println("sort: "+sort);
									
									for(int j = 0; j <sort.length; j++){
										if(j == 0){
											%>
											<option selected disabled><%= sort[j] %></option>
											<%	
										}else{
											%>
											<option disabled><%= sort[j] %></option>
											<%
												System.out.println("srot:"+sort[j]);
										}
									}
								%>
								</select>
							</td>
							<td><%=reviewDto.getRwdate().substring(0,10)%></td>
							<td><%=reviewDto.getRscore()%></td>
							<td class = "clickitem" onClick="location.href='hospitalDetail.do?id='+<%=reviewDto.getHospital_id()%>"><%=reviewDto.getRcontent()%></td>
							<td><button class = "clickitem" onclick="delreview(<%=reviewDto.getRid()%>)">삭제</button></td>
						</tr>
							
					</tbody>
					<%
				}
			%>
			</table>

		</div>
		
		<script type="text/javascript">
			function delreview(reviewid){
				$.ajax({
					url:"reviewDelete.do?id="+reviewid,
					success:function(result){
						
						if(JSON.parse(result).success == "success"){
							alert("리뷰 삭제 성공");
						}else{
							alert("리뷰 삭제 실패");
						}
						
					},error: function(){
						alert("error");
					}
					
				})
			}
		</script>
		</body>
		</html>
	<%
	}
%>
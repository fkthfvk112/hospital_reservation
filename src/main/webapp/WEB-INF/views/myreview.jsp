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
			
			.reviewTable{
				border-collapse : collapse;
				border-spacing : 0;
			}
			
			.reviewTable td{
				padding:1em;
			}
			.reviewBody{
				background-color: white;
				padding:2em;
				border: solid 1px #e1e1e1;
			}
			
			#reviewDelBtn{
				border: none;
			    background-color: #8f8f8f;
			    border-radius: 0.5em;
			    padding: 0.5em;
			    color: white;
			    transition: 0.2s;
			}
			#reviewDelBtn:hover{
				background-color: black;
			}
			
			#mymenuitemD{
				background-color: #595a5c;
			}
			
			#mymenuitemD > .myPageNavA{
				color:white;
			}
		</style>
		</head>
		<body>
		<h2 style="margin:2em;">내가 쓴 리뷰</h2>
		<div>
		<table class="reviewTable">
			<col width="50"><col width="200"><col width="130"><col width="50"><col width="300"><col width="80">
			<thead>
				<th>번호</th><th>병원명</th><!-- <th>종류</th> -->
				<th>작성일</th><th>평점</th><th>내용</th><th>삭제</th> <!-- 위치 어케 표기? -->
			</thead>
			<%
				for(int i=0; i< likeReviewDtoList.size(); i++){
					MyReviewDto reviewDto = likeReviewDtoList.get(i);
					System.out.println("likeReviewDtoList "+i+"번 돌음");
					%>
					<tbody class="reviewBody">
						<tr> 
							<td><%= i+1 %></td>
							<td id="hospitalName" class = "clickitem" onClick="location.href='hospitalDetail.do?id='+<%=reviewDto.getHospital_id()%>"><%=reviewDto.getHtitle()%></td> <!-- 병원 상세 페이지로 링크 수정하기 -->
<%-- 							<td>
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
							</td> --%>
							<td><%=reviewDto.getRwdate().substring(0,10)%></td>
							<td><%=reviewDto.getRscore()%></td>
							<td class = "clickitem" onClick="location.href='hospitalDetail.do?id='+<%=reviewDto.getHospital_id()%>"><%=reviewDto.getRcontent()%></td>
							<td><button id="reviewDelBtn" class = "clickitem" onclick="delreview(<%=reviewDto.getRid()%>)">삭제</button></td>
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
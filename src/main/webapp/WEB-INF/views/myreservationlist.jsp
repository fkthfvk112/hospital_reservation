<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@page import="java.time.LocalDate"%>
<%@page import="component.dto.ReservationDetailDto"%>
<%@page import="component.dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="util.reservationUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	UserDto dto = (UserDto)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 예약 내역</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">
	.clickitem{
		cursor: pointer;
	}
	#mymenuitemB{
		background-color: #EDDEA4;
	}
	
	#mymenuitemB > .myPageNavA{
		color:black;
	}
	
	.myReservTable{
		border-collapse : collapse;
		border-spacing : 0;
	}
	.myReservTable td{
		padding:0.5em;
		border:1px solid #e1e1e1;
	}
	
	.myReservTable th{
		background-color: gray;
		color:white;
	}
	
	#reservTableContainer{
		display:flex;
		justify-content:center;
		flex-direction:column;
		align-items:center;
		background-color:white;
		border:1px solid #e1e1e1;
		border-radius: 0.5em;
		padding:0em 2em 2em 2em;
		
		position:fixed;
		top:30vh;
	}
	
	#modalCloseBtn{
		background-color: transparent;
		border:none;
		font-size: 1.2em;
		  cursor: pointer;
	}
	
	#removeReserv{
	    border: none;
	    background-color: #8f8f8f;
	    border-radius: 0.5em;
	    padding: 0.5em;
	    color: white;
	    transition: 0.2s;
	    cursor: pointer;
	}
	
	#removeReserv:hover{
		background-color: black;
	}
	
</style>
		
</head>
<body>

<%
	//예약 목록에서 필요한 데이터
	List<ReservationDto>  reservlist = (List<ReservationDto>)request.getAttribute("reservlist");

	int year = (Integer)request.getAttribute("year");
	int month = (Integer)request.getAttribute("month");
	int dayOfWeek = (Integer)request.getAttribute("dayOfWeek");
	Calendar cal = (Calendar)request.getAttribute("cal");
						
	// 예약 내역 상세에서 필요한 데이터
	int reservationId = (int)request.getAttribute("reservationId"); // reservationId auto-increasement는 1부터 시작 0인 건 넘어온 값이 없음(컨트롤러 메소드 매개변수의 디폴트값)을 의미
	ReservationDetailDto rDto = (ReservationDetailDto)request.getAttribute("reservationDetailDto");
	
	// << year--
	String pp = String.format("<a href='myreservation.do?year=%d&month=%d' style='text-decoration:none'>"
								+ "<img src='./images/left.png' width='20px' height='20px'>"
								+"</a>", 
								year-1, month);
	// < month-
	// prev? 이전?
	String p = String.format("<a href='myreservation.do?year=%d&month=%d' style='text-decoration:none'>"
								+ "<img src='./images/prev.png' width='20px' height='20px'>"
								+"</a>", 
								year, month-1);
	// > month+
	// next
	String n = String.format("<a href='myreservation.do?year=%d&month=%d' style='text-decoration:none'>"
								+ "<img src='./images/next.png' width='20px' height='20px'>"
								+"</a>", 
								year, month+1);
	
	// >> year++
	String nn = String.format("<a href='myreservation.do?year=%d&month=%d' style='text-decoration:none'>"
								+ "<img src='./images/last.png' width='20px' height='20px'>"
								+"</a>", 
								year+1, month);
	
	
%>
<div align="center">
	<h2 style="margin:2em;">내 예약</h2>
	<table border="1" class="table table-bordered"s>
		<col width="120"><col width="120"><col width="120"><col width="120"><col width="120"><col width="120"><col width="120">
		<tr height="80">
			<td colspan='7' align='center'>
			<%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;&nbsp;&nbsp;
			<font style="color:#3c3c3c; font-size:40px; font-family:fantasy">
				<%=String.format("%d년&nbsp;&nbsp;%2d월",year,month)%>
			</font>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=n %>&nbsp;<%=nn %>
		</tr>
		<tr height="30" style="background-color:#000; color: white;">
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr  height="120" align="left" valign="top">
			<%
				// 위쪽 빈칸( 잘린 전월 날짜 )
				for(int i=1; i < dayOfWeek; i++){
					%>
					<td style="background-color: #eeeeee">&nbsp;</td>
					<%
				}
			
				// 날짜
				int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 월의 마즈막 날짜 반환함?
				for(int i = 1; i <= lastday; i++){
					%>
					<td style="color: #3c3c3c; padding-top:5px">
						<!-- 예약 한달 일정표 안에 날짜칸 안에 그 날짜의 일정 리스트 -->
						<%=reservationUtil.daylist(year, month, i) %>
						<%
						if(reservlist != null || reservlist.size() != 0){
						%>
						<!-- 캘린더 리스트 페이지 안 날짜칸에서 해당 날짜의 일정들을 리스트로 보여주는 코드 -->
						<%=reservationUtil.makeTable(year, month, i, reservlist) %>
						<%
						}
						%>
					</td>
					<!-- 일주일 단위로 한 줄에 날짜칸을 띄우다가 다른 주로 넘어갈 때 다음 줄로 넘어가게 하는 코드 -->
					<%
						if((i + dayOfWeek - 1 )%7 == 0 && i != lastday){
							%>
							</tr><tr height="100" align="left" valign="top">
							<% 
						}
				}
				
				// 아래쪽 빈칸 ( 다음달 이어지는 날짜)
				cal.set(Calendar.DATE, lastday);
				int weekday = cal.get(Calendar.DAY_OF_WEEK);
				
				for(int i = 0; i<7 - weekday; i++){
					%>
					<td style="background-color: #eeeeee">&nbsp;</td>
					<%
				}
			%>
		</tr>
		
	</table>
</div>
     
     

<%
	if( reservationId != 0){
		%>
		<div id="reservTableContainer">
			<div style="text-align: right; width:100%; margin:0.5em;">
				<button type="button" id="modalCloseBtn">X</button>
			</div>
			<h2 style="margin:0.5em;">예약 정보</h2>
			<table class="myReservTable" align="center" valign="middle">
				<col width="100" height="80"><col width="500" height="80">
				<tr><th>예약 병원</th><td><%=rDto.getHtitle() %>[<%=rDto.getHsort() %>]</td></tr>
				<tr><th>예약 날짜</th><td><%=rDto.getRdate().substring(0,10)%>  
										<% 
										   	int clickyear =  Integer.parseInt(rDto.getRdate().substring(0,4));
										   	int clickmonth = Integer.parseInt(rDto.getRdate().substring(5,7));
										   	int clickday = Integer.parseInt(rDto.getRdate().substring(8,10));
										   	
										   	int eday = LocalDate.of(clickyear, clickmonth, clickday).getDayOfWeek().getValue();
										   	
										   	String[] kday = {"", "월", "화", "수", "목", "금", "토", "일"};
										   %>
										&nbsp;<%=kday[eday]%></td></tr>
				<tr><th>일정 시간</th><td><%=rDto.getRdate().substring(11,16) %></td></tr>
				<tr><th>예약 내용</th><td><%=rDto.getRdescription() %></td></tr>
				<tr><td colspan="2" style="text-align: center;" class="btnTd">
						<%
						if(rDto.getRstate() == 1){
							%>
							<button type="button" id="removeReserv" onclick="deleteReserv(<%=rDto.getRid()%>)">예약 취소</button>
							<%
						}else{
							%>
							<button type="button" id="alreadyremove" disabled>취소된 예약</button>
							<%
						}%>
					</td>	
				</tr>
			</table>
		</div>
		
		<script type="text/javascript">
			function deleteReserv(reservId){
				location.href="deletereserv.do?reservId="+reservId;
			}
			
			let reservTableContainer =  document.querySelector("#reservTableContainer");
			let closeModal = ()=>{
				  reservTableContainer.style.display = "none";
			}
			
			let modalCloseBtn = document.querySelector("#modalCloseBtn");
			modalCloseBtn.addEventListener('click', ()=>{
				closeModal();
			})
		</script>
		<%
	}
%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>
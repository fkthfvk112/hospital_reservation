<%@page import="java.net.URLEncoder"%>
<%@page import="utils.HosUtils"%>
<%@page import="component.dto.UserDto"%>
<%@page import="component.dto.HospitalDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%
	HospitalDto hosDto = (HospitalDto)request.getAttribute("hospitalDto");
	String latitude = hosDto.getLocation_latitude();
	String longitude = hosDto.getLocation_longitude();
	int hosId= hosDto.getId();
	
	
	String ownerId = hosDto.getStaff_id();
	UserDto userDto =  (UserDto)session.getAttribute("login");
	System.out.println("디티오" + userDto);
	String userId = null;
	if(userDto != null){
		userId = userDto.getId();
	}
	
	//System.out.println(hosDto.toString());
	
	String operationTime = hosDto.getOpertime();
	String[] times = operationTime.split(",");
	operationTime = times[0] + "시부터 " +  (Integer.parseInt(times[1]) +1) + "시까지";

	//------------for validation-------------------
	boolean isOwner = false;
	if(userId != null){
		isOwner = userId.equals(ownerId)?true:false;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36ae5291fff272f636c29f53ee0e5ad5&libraries=services,clusterer"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
 <jsp:include page="header.jsp" flush="false"/>
 <jsp:include page="nav.jsp" flush="false"/>
	<!-- userId 발리데이션 수정 -->
    <div id="mainSection">
            <div class="mainContents">
            <div class="imgAndMapSection">
                <div class="imgOne">이미지</div>
                <div class='mt-3' id="map" style="width:25em;height:25em;"></div>
            </div>
            <div class="contentSection">
                <div class="content">
                    <div style="text-align: right;">
                        <button class="m-3">
                        	<object style="cursor:pointer;" data="resorces/kakao.svg" width="38" height="38" type="image/svg+xml"></object>
                        </button>
                        <button type="button" onclick="likeSet()" class="m-3 heartBtn">
                        	<object data="resorces/heart.svg" width="38" height="38" type="image/svg+xml"></object>
                        </button>
                    </div>
                    <div><%=hosDto.getTitle() %></div>
                    <div>
                    	<span style="color:#FFCB12;">★</span>
                    	<span class="starAvg"></span>
                    </div>
                    <div>
                    	<span style="color:red">♥</span>
                    	<span class="likeCnt"></span>
                    </div>
                </div>
                <hr />
                <div class="content">
                    <div>
                    	<%=hosDto.getDescription() %>
                    	<%if(isOwner){ %>
                    	<button type="button" class="editBtn" id="descEditBtn">수정</button>
                    	<%} %>
                    	<div id="descEditContainer" class="mt-3 editContainer" style="display:none;"> <!-- display none으로 수정 -->
                    		<textarea cols="50" id="descEditTextAtrea" placeholder="수정 사항 입력"></textarea>
                    		<br />
                    		<button class="editCompleteBtn" id="descCompleteBtn">수정 완료</button>
                    	</div>
                    </div>
                </div>
                <hr />
                <div class="content">
                  	<%if(isOwner){ %>
                    <div>영업시간<button type="button" class="editBtn" id="timeEditBtn">수정</button></div>
                    <%} %>
                    <div><%=HosUtils.passOperationTime(hosDto.getOpertime()) %></div>
                    <div id="timeEditContainer" class="mt-3 editContainer" style="display:none;"> <!-- display none으로 수정 -->
                  			<select id="startTime" class="mt-3">
								<option value="9">09:00</option>
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="13">13:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
								<option value="17">17:00</option>
							</select> 부터
							<select id="closeTime">
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="13">13:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
								<option value="17">17:00</option>
								<option value="18">18:00</option>
							</select> 까지
							<br />
                    	<button class="editCompleteBtn" id="timeCompleteBtn">수정 완료</button>
                   	</div>
                </div>
                 <hr />
                <div class="content">
                    <div>
                    	진료과목
                    	<%if(isOwner){ %>
                    	<button type="button" class="editBtn" id="sortEditBtn">수정</button>
                    	<%} %>
                    	<div id="sortEditContainer" class="mt-3 editContainer" style="display:none;"> <!-- display none으로 수정 -->
                   	
			               <div class="mt-3" style="width:100%">
								<lable>진료과</lable>
								<input type="text" class="form-control" name="sort" id="sort" readonly/>
								<button class="editCompleteBtn" id="sortCompleteBtn">수정 완료</button>	
								
								 <!-- 안보이도록 프로세싱 -->
								<details class="text-center" id="sortDetail">
								<summary>진료과 선택</summary>
								<div id="sortSection">
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="가정의학과" id="s1">
										  <label class="form-check-label" for="s1">
										    가정의학과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="감염내과" id="s2">
										  <label class="form-check-label" for="s2">
										    감염내과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="치과" id="s3">
										  <label class="form-check-label" for="s3">
										    치과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="비뇨기과" id="s4">
										  <label class="form-check-label" for="s4">
										    비뇨기과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="산부인과" id="s5">
										  <label class="form-check-label" for="s5">
										    산부인과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="병리과" id="s6">
										  <label class="form-check-label" for="s6">
										    병리과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="성형외과" id="s7">
										  <label class="form-check-label" for="s7">
										    성형외과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="소아기내과" id="s8">
										  <label class="form-check-label" for="s8">
										    소아기내과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="신경과" id="s9">
										  <label class="form-check-label" for="s9">
										    신경과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="안과" id="s10">
										  <label class="form-check-label" for="s10">
										    안과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="이비인후과" id="s11">
										  <label class="form-check-label" for="s11">
											이비인후과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="재활의학과" id="s12">
										  <label class="form-check-label" for="s12">
										    재활의학과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="정형외과" id="s13">
										  <label class="form-check-label" for="s13">
										    정형외과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="피부과" id="s14">
										  <label class="form-check-label" for="s14">
										    피부과
										  </label>
										</div>
										
										<div class="form-check">
										  <input class="form-check-input" type="checkbox" value="흉부외과" id="s15">
										  <label class="form-check-label" for="s15">
										    흉부외과
										  </label>
										</div>
										<button type="button" id="sBtn" class="btn btn-success m-3">선택 완료</button>
									</div>
								</details>
							</div>     
                    	</div>                    	
                    </div>
					<div id="sortContainer" class="mt-3">
						<% for(String sort:HosUtils.getStringList_seperByDelim(hosDto.getSort(), ",")){ %>
							<span class="sortBadge" style="border:2px solid <%=HosUtils.getColorFromAscii(sort) %>"><%=sort %></span>
						<%} %>
					</div>
                </div>
                <div class="p-3 m-3" align="center" >
                <% if(userId != null){ %>
                    <button type="button" class="btn reservBtn m-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">진료 예약</button>
                <%}else{ %>
                	<button type="button" onclick="handleNotLogin()" class="btn notWorkBtn m-3">진료 예약</button>
                <%} %>
                </div>
            </div>
        </div>
        <!-- 리뷰 -->
        <jsp:include page="review.jsp"></jsp:include>
    </div>
    
    
    <!-- Modal -->
    
    <!-- Button trigger modal -->

	<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <form action=reservation.do method="post" accept-charset="UTF-8">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">진료 예약</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-center">
	      		<input type="text" value="<%=hosId %>" id="hosId" name="hospitalId"  style="display:none;"/> <!-- 수정 -->
	      		<input type="text" value="<%=userId %>" id = "userId" name="userId"  style="display:none;"/>
	      		
	        날짜를 선택해주세요. <input class="dateInput" type="date" name="reservDate" value=null/>
	        <div class="mt-3">
	        	예약 시간 : <input class="startingTime" readonly="true" name="reservTime"></input>
	        </div>
	        <hr />
	        <table class="timeTable" border="1">
	        	<col width="300" ><col width="500">
		        	<tr class="t9" accessable="true">
		        		<td>09:00 ~ 10:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        	<tr class="t10" accessable="true">
		        		<td>10:00 ~ 11:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        	<tr class="t11" accessable="true">
		        		<td>11:00 ~ 12:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        	<tr class="t13" accessable="true">
		        		<td>13:00 ~ 14:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        	<tr class="t14" accessable="true">
		        		<td>14:00 ~ 15:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        	<tr class="t15" accessable="true">
		        		<td>15:00 ~ 16:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        	<tr class="t16" accessable="true">
		        		<td>16:00 ~ 17:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        	<tr class="t17" accessable="true">
		        		<td>17:00 ~ 18:00</td>
		        		<td>예약 가능</td>
		        	</tr>
		        </table>
		        <hr />
	          <textarea class="form-control" placeholder="예약 내용을 입력해주세요." rows="3" name="description"></textarea>
	      </div>
      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="submimt" class="btn btn-primary">예약하기</button>	        
	      </div>
	    </div>
	  </div>
	</form>	
</div>
<jsp:include page="footer.jsp" flush="false"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
<script>
	$(document).ready(()=>{
		countHosLike();
		avgHosStar();
	})


	//데이터 받아와서 예약 가능한지 표시하기
	const dateInput = document.querySelector(".dateInput");
	
	function reSetRows(){
	    const rows = document.querySelectorAll('.timeTable tr');
		rows.forEach(row=>{//초기화
			row.setAttribute("accessable", true);
			row.querySelector('td:last-child').innerText ="예약 가능";
			row.style.backgroundColor = "white";
		
		})
	}
	
	function setRows(){
	    const rows = document.querySelectorAll('.timeTable tr');
		rows.forEach(row=>{//초기화
			let accessability = row.getAttribute("accessable");
			if(accessability == "false"){
				console.log("여기여기")
	            row.style.backgroundColor = "gray";
				row.setAttribute("disabled", true);
				row.querySelector('td:last-child').innerText ="예약 불가";
			}
		})
	}
	
	function setScheduleList(res){
		console.log("res값", res);
		/*
		res는 reservdto속성의 js 객체 가진 배열
		*/
		reSetRows();
		res.forEach((ele)=>{
			let time_s = ele.wdate.slice(11, 13);
			console.log("시간", time_s);
			
			let time = Number(time_s);
			switch(time){
				case 9:
					document.querySelector(".t9").setAttribute("accessable", false);
					break;
				case 10:
					document.querySelector(".t10").setAttribute("accessable", false);
					break;
				case 11:
					document.querySelector(".t11").setAttribute("accessable", false);
					break;
				case 12:
					document.querySelector(".t12").setAttribute("accessable", false);
					break;
				case 13:
					document.querySelector(".t13").setAttribute("accessable", false);
					break;
				case 14:
					document.querySelector(".t14").setAttribute("accessable", false);
					break;
				case 15:
					document.querySelector(".t15").setAttribute("accessable", false);
					break;
				case 16:
					document.querySelector(".t16").setAttribute("accessable", false);
					break;
				case 17:
					document.querySelector(".t17").setAttribute("accessable", false);
					break;
			}
		})
		setRows();
	}

	dateInput.addEventListener("input", function(event) {
	  const inputValue = event.target.value;
	  console.log("Input 값이 변경되었습니다:", inputValue);
		$.ajax({
            url: 'getReservByDate.do',
            type: 'GET',
            data: { date_s: event.target.value, hosId: <%=hosId%>},
            dataType: 'json',
            success: function(response) {
            	console.log("데이터 응답 성공");
            	setScheduleList(response);
            },
            error: function(error) {
                
                console.error("실패", error);
            }
        });
	});

    const rows = document.querySelectorAll('.timeTable tr');//예약 가능 불가능
    let selectedTime = null;
    rows.forEach(row => {
      row.addEventListener('click', function() {
	        const time = row.querySelector('td:first-child').innerText;
	        const status = row.querySelector('td:last-child').innerText;
	        let startingTime = time.substr(0, 2);
	        if(status == "예약 불가"){
	        	alert("예약 불가능한 시간입니다. 다른 시간을 선택해주세요.");
	        }
	        else{
	        	selectedTime = startingTime;
	        	console.log("선택한 시간", selectedTime);
	        	 document.querySelector(".startingTime").value = (String(selectedTime) + ":00");
	        }
	        console.log(time, status);
	        // 이곳에 클릭 시 동작할 코드를 작성합니다.
	        // 예를 들어, 특정 시간대를 클릭하면 예약을 진행하거나 상세 정보를 표시할 수 있습니다.
      });
    });
	
	function likeSet(){
		let hosId = Number(<%=hosDto.getId()%>);
		<%-- let userId = <%=userDto.getId()%> 수정 --%>
		let userId = "<%=userId%>";
		//로그인 안 했을 때 처리
		if(userId == 'null' || userId == 'undefined'){
			console.log(userId == 'null');
			handleNotLogin();
			return;
		}

		let likeData = {
			userId:userId,
			hospitalId:hosId
		};
		
		$.ajax({
            url: 'handleLike.do',
            type: 'POST',
            data: likeData,
            dataType: 'json',
            success: function(response) {
                console.log("성공", response);
                countHosLike();//좋아요 띄우기
            },
            error: function(error) {
                
                console.error("실패", error);
            }
        });
	}
	//--------------------로그인 안 했을 시 처리-----------
	function handleNotLogin(){
		alert("로그인을 해주세요!");
		console.log(location.href);
		<%
			HosUtils.setCurrentURLtoSession(request, session);
		%>
		location.href = "login.do";
	}
	
	//-----맵 띄우기-------------
	let container = document.getElementById('map');
	let options = {
		center: new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>),
		level: 3,
        draggable: true
	};

	let map = new kakao.maps.Map(container, options);
    let places = new kakao.maps.services.Places();
    map.setLevel(2);
    places.setMap(map);

    const markers = [];

    let clusterer = new kakao.maps.MarkerClusterer({
        map: map,
        markers: markers,
        gridSize: 35,
        averageCenter: true,
        minLevel: 6,
        disableClickZoom: true,
        styles: [{
            width : '53px', height : '52px',
            background: 'url(cluster.png) no-repeat',
            color: '#fff',
            textAlign: 'center',
            lineHeight: '54px'
        }]
    });
    let marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>)
    });
    clusterer.addMarker(marker);
    
    
    
    //---------------------
    
    	//like 집계
	function countHosLike(){
    	let hosId = <%=hosDto.getId()%>
  
		console.log("here")
		$.ajax({
            url: 'countHosLike.do',
            type: 'GET',
            data:{ hosId: hosId },
            dataType: 'json',
            success: function(response) {
                console.log("성공", response);
                $(".likeCnt").html(Number(response));
            },
            error: function(error) {
                
                console.error("실패", error);
            }
        });
	}
    
    function avgHosStar(){
    	let hosId = <%=hosDto.getId()%>
    	  
		console.log("here")
		$.ajax({
            url: 'hosStarAvg.do',
            type: 'GET',
            data:{ hosId: hosId },
            dataType: 'json',
            success: function(response) {
                console.log("성공", response);
                $(".starAvg").html(response.toFixed(2));
            },
            error: function(error) {
                
                console.error("실패", error);
            }
        });
    }
</script>
<script src="./jsComponents/hospitalDetailEdit.js" type="text/javascript"></script>

<style>
	body{
		background-color: #E2F0F7;
	}
	object {
    	pointer-events: none;
	}
	#mainSection{
		border:3px solid #e1e1e1;
		border-radius: 18px;
		margin:2em;
		padding-top:2em;
		background-color:white;
	}
	.mainContents{
		display: flex;
		justify-content: center;
		align-items:center;
		flex-direction: row;
		flex-wrap: wrap;
		width:100%;
	}
	.imgAndMapSection{
		display: flex;
		justify-content: center;
		align-items:center;
		flex-direction:column;
		margin:1em;
		flex-basis: 400px;
	}
	
	.contentSection{
		align-self: flex-start;
		margin:1em;
		flex-basis: 400px;
	}
	.imgOne{
		width:250px;
		height:250px;
		background-color: green;
		margin:10px;
	}
	.map{
		width:250px;
		height:250px;
		background-color: green;
		margin:10px;
	}
	
	.contentSection > .content{
		padding:0.5em;
	}
	
	.contentSection > .content:nth-child(3){
		padding:0.5em;
		padding-bottom:2em;
	}
	.contentSection > .content:nth-child(4){
		padding:0.5em;
		padding-bottom:2em;
	}
	
	.reviewBar{
		width:100%;
		height:38px;
		background-color: #B5E2FA;
	}

    .reservBtn{
        background-color: #0FA3B1;
        border:none;
        border-radius: 1em;
        color:white;
        padding:0.5em 1.3em 0.5em 1.3em;
    }
    
    .notWorkBtn{
    	background-color: #e1e1e1;
        border:none;
        border-radius: 1em;
        color:black;
        padding:0.5em 1.3em 0.5em 1.3em;
    }

    .timeTable tr:hover{
    	border:1px solid red;
    	cursor: pointer;
    	padding: 5px;
    }
    
    .sortBadge{
		padding:0.3em;
		border-radius:1em;
		white-space: nowrap;
		margin:0.2em;
		font-size:0.8rem;
	}
	
	#sortContainer{
		display:flex;
		flex-wrap: wrap;
		justify-content: flex-start;
		align-items: flex-start;
	}
   
   
   .editBtn{
	   	border-radius: 2em;
	   	background-color: white;
	   	border:1.2px solid skyblue;
	   	margin:0em 0.3em 0em 0.3em;
   }
   
   .editCompleteBtn{
   	   	border-radius: 0.5em;
	   	background-color: blue;
	   	border:none;
	   	margin:0.3em 0.3em 0em 0.3em;
	   	color:white;
   }
   
   .editContainer{
   	background-color: #e1e1e1;
   	padding:1em;
   	text-align: center;
   }
</style>
</html>
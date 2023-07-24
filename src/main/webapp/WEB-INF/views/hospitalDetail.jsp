<%@page import="component.dto.UserDto"%>
<%@page import="component.dto.HospitalDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%
	HospitalDto hosDto = (HospitalDto)request.getAttribute("hospitalDto");
	String latitude = hosDto.getLocation_latitude();
	String longitude = hosDto.getLocation_longitude();
	int hosId= hosDto.getId();
	UserDto userDto =  (UserDto)session.getAttribute("login");
	String userId = userDto.getId();
	
	System.out.println(hosDto.toString());
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
                    <div>평점</div>
                    <div>찜 횟수</div>
                </div>
                <hr />
                <div class="content">
                    <div><%=hosDto.getDescription() %></div>
                </div>
                <hr />
                <div class="content">
                    <div>영업시간</div>
                    <hr />
                    <div>영업시간입니다.</div>
                </div>
                <div class="content">
                    <div>진료과목</div>
                    <hr />
                    <div><%=hosDto.getSort() %></div>
                </div>
                <div class="p-3 m-3" align="center" >
                    <button type="button" class="btn btn-primary reservBtn m-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">진료 예약</button>
                </div>
            </div>
        </div>
        <div style="width:90%; margin:1em;">
            <div class="reviewBar"></div>
            <div class="p-3">
                <div>리뷰단 사람</div>
                <div>평점</div>
                <div>리뷰 제목</div>
                <div>리뷰 내용 ㅁㅁㅇㅁㄴㅇㅁㄴㅇ</div>
            </div>
            
        </div>
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
	      		<input type="text" value="<%=hosId %>" name="hospitalId"/> <!-- 수정 -->
	      		<input type="text" value="<%=userId %>" name="userId" />
	      		
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
<script>
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
		let userId = "abc123";
		let likeData = {
			userId:"abc123",
			hospitalId:hosId
		};
		
		$.ajax({
            url: 'handleLike.do',
            type: 'POST',
            data: likeData,
            dataType: 'json',
            success: function(response) {
                
                console.log("성공", response);
            },
            error: function(error) {
                
                console.error("실패", error);
            }
        });
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
</script>

<style>

	object {
    	pointer-events: none;
	}
	#mainSection{
		border:3px solid red;
		border-radius: 18px;
		margin:2em;
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

    .timeTable tr:hover{
    	border:1px solid red;
    	cursor: pointer;
    	padding: 5px;
    }
   
</style>
</html>
<%@page import="utils.HosUtils"%>
<%@page import="java.util.List"%>
<%@page import="component.dto.ReservDto"%>
<%@page import="component.dto.HospitalDto"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
UserDto userDto =  (UserDto)session.getAttribute("login");
HospitalDto hosDto = (HospitalDto)request.getAttribute("myHospitalDto");
int hosId = 0;
if(userDto == null ){//로그인 안 했을 시 처리하는 코드 추가
	%>
	<script>
		alert("병원을 생성해주세요!");
		location.href = "toHosCreate.do";
	</script>
	<% 
}
else{
	if(hosDto != null){
		hosId = hosDto.getId();
	}
}
List<ReservDto> reservDtos = (List<ReservDto>)request.getAttribute("myHospitalReservDtos");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
    <div class="ownerPageContainer">
        <div class="p-3" id="titleContainer">
            <a href="hospitalDetail.do?id=<%=hosId %>" class="ms-3">내 병원 페이지</a>
        </div>
        <section id="reservShowSection">
            <div id="reservDateSection">
                <h3>예약 확인</h3>
                <div>
                	<input id="reserDateInput" type="date">
                	<button id="reserDateShowBtn" type="button">확인</button>
                </div>
                
                <div class="mt-3" id="reserCntInfo" >n개의 예약이 있습니다.</div>
            </div>
            <div id="parentOfReserOne" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                
<!--                 <div id="reserOne">
                    <div style="padding:1em;">
                        <div>예약자명</div>
                        <hr>
                        <div>예약 시간</div>
                    </div>
                    <div style=" text-align: left; padding:1em; border-left: 1.8px solid #e1e1e1;">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Error iste dicta cumque repudiandae laudantium et odio, minima facere, quo ea dolor at! Delectus, illo tempora optio perspiciatis velit accusantium provident!</div>
                    <div style="grid-column-end: span 2; text-align: center; padding: 0.3em;">
                        <button  class="btn" type="button" id="reservConfirmBtn">예약 확정</button>
                        <button  class="btn" type="button" id="reservCancleBtn">예약 취소</button>
                    </div>
                </div> -->
                
            </div>
        </section>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
<style>

    #titleContainer{
    	width:100%;
        text-align: right;
    }
    #reservConfirmBtn{
        border-radius: 1em;
        background-color: skyblue;
        transition: 0.3s;
    }
    #reservConfirmBtn:hover{
        background-color: #0FA3B1;
    }
    #reservCancleBtn{
        border-radius: 1em;
        background-color: #e1e1e1;
        transition: 0.3s;
    }
    #reservCancleBtn:hover{
        background-color: #878181;
    }
    .ownerPageContainer{
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    #reservDateSection{
        background-color: #F7A072;
        padding:1em;
        width:300px;
        text-align: center;
        border-radius: 1em;
    }
    #reservShowSection{
        display: flex;
        width:95%;
        flex-direction: row;
        justify-content: center;
        align-items: start;
        background-color: #F9F7F3;
        padding: 2em;
        min-width: 300px;
        min-height: 300px;
    }

    @media (max-width: 700px) {
            #reservShowSection{
                flex-direction: column;
                justify-content: start;
                align-items: center;
            }
        }

    #reserOne{
        background-color: white;
        border: 1.5px solid #0FA3B1;
        border-radius:1.5em;
        margin:2em;
        display: grid;
        grid-template-columns: 10rem 3fr;
    }
    #reserDateInput{
        border:1px solid black;
        border-radius: 2em;
        padding: 0.3em 1em 0.3em 1em;
        font-size: 1.3em;
    }
    
    a{
    	text-decoration: none;
    	color:black;
    }
</style>
<script>

	//오늘 날짜로 date input set
    const reserDateInput = document.querySelector("#reserDateInput");
    const today = new Date();
    const formattedDate = today.toISOString().slice(0, 10);
    reserDateInput.value = formattedDate;
    
    let NewReservElement = (data)=>{
     	let userId = data&&data.userId;
    	let description = data&&data.description;
		let wdate = data&&data.wdate;
		let wdateArr = wdate.split(" ");
		let time = wdateArr[1];
		let ele = "<div id='reserOne'>" +
					    "<div style='padding: 1em;'>" +
					        "<div>작성자 <strong>" + userId + "</strong></div>" +
					        "<hr>" +
					        "<div>작성 시간 " + time + "</div>" +
					    "</div>" +
					    "<div style='text-align: left; padding: 1em; border-left: 1.8px solid #e1e1e1;'>" + description + "</div>" +
					    "<div style='grid-column-end: span 2; text-align: center; padding: 0.3em;'>" +
					    "</div>" +
					"</div>";
		

		return ele;
    }
    
    let getReservData = ()=>{
    	let date = $("#reserDateInput").val()
    	
		$.ajax({
            url: 'getReservByDate.do',
            type: 'GET',
            data: { date_s: date, hosId: <%=hosId%>},
            dataType: 'json',
            success: function(response) {
            	for(data of response){
                	$("#parentOfReserOne").append(NewReservElement(data));
            	}
            	let todaysReservCnt = response.length;
               	$("#reserCntInfo").html(todaysReservCnt + "개의 예약이 있습니다.");
            },
            error: function(error) {
                
                console.error("실패", error);
            }
        });
    }
    
    $(document).ready(() => {
    	console.log("온");
    	//----초기값 받아옴
    	getReservData();
    	
    	$("#reserDateShowBtn").on("click", ()=>{
        	$("#parentOfReserOne").empty();
    		getReservData();
    	})
    	
    });
    
</script>
</html>

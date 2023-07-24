<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = "abc123";//세션 받아오게 수정 //폼 validation check하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36ae5291fff272f636c29f53ee0e5ad5&libraries=services,clusterer"></script>

</head>
<body>
	<div class="createContainer">
		<h1 class="m-3">병원 생성 페이지</h1>
		<form id="createForm" class="createFrom" action="createHospital.do" method="post">
			<input type="hidden" name="staff_id" value="<%=userId %>" />
			<div style="width:100%">
				<lable class="mt-3">병원 이름</lable>
				<input id="hosNameInput" class="form-control" data-bs-toggle="modal" data-bs-target="#locationModal"  type="text" name="title"  required>
			    <br />
			    <lable class="mt-3">병원 위치</lable>
			    <input id="hosLocationInput" class="form-control" data-bs-toggle="modal" data-bs-target="#locationModal" type="text"  required>
				<div class='mt-3' id="map" style="width:100%;height:10rem;"></div>
				<input type="hidden" id="inputLatitude" name="location_latitude" />
				<input type="hidden" id="inputlongitude" name="location_longitude" />
			</div>
			<div class="mt-3" algin="left" style="width:100%">
				<lable class="mt-3">병원 소개</lable>
				<textarea  class="form-control" rows="3" name="description"></textarea>
			</div>
			<div class="mt-3" style="width:100%">
				<lable>진료과</lable>
				<input type="text" class="form-control" name="sort" id="sort" readonly/>
				
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
						<button type="button" id="sBtn" class="btn btn-success m-3">확인</button>
					</div>
				</details>
			</div>
			<hr />

			<div class="m-3 p-3 text-center">
				<label for="">운영 시간</label>
				<br />
				<input type="hidden" id="timeAll" name="opertime" readonly/><!-- 안보이도록. 프로세싱해서 보내기 -->
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
			</div>
			<hr />
			<button type="button" id="creatBtn" class="btn btn-primary">생성</button>
		</form>
	</div>
	
	<!-- 위치 찾기 모달 -->
	<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">주소 검색</h1>
          <button id="closeModalBtn" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form id="modalFrom" class="text-center">
                <input id="locationSearch" type="text">
                <button id="locationSearchBtn" type="button"  class="btn btn-primary">검색</button>
                <div id="locationSearchContainer" class="scroll-container" style="height: 200px; overflow: auto;">

                </div>
                  
            </form>
        </div>
        <div class="modal-footer">
          <button id="closeLocationBtn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button id="saveLocationBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">저장</button>
        </div>
      </div>
    </div>
  </div>
	
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
<style>
	.createContainer{
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		
		border: 2px solid #F9F7F3;
		margin:2em;
		padding:2em;
	}
	
	.createFrom{
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	#sortSection{
		border:2px solid #e1e1e1;
		border-radius: 1em;
	}
	
	#sortSection div{
		margin:1em;
	}
	
	#sortSection div:hover{
		background-color: #e1e1e1;
	}
</style>
<script>
	$("#creatBtn").on("click", () => {
	    // Validation Check
	    if (Number($("#startTime").val()) >= Number($("#closeTime").val())) {
	        alert("진료 시작 시간이 진료 종료 시간보다 크거나 같습니다.");
	        return;
	    }
	    
	    //--------
	    //process time
	    let startTime = $("#startTime").val();
	    let closeTime =  Number($("#closeTime").val());
	    let processedTime = startTime + "," + (closeTime-1);
	   	$("#timeAll").val(processedTime);
	   	
	   	//---submit form---
		 $("#createForm").submit();

	});
	
	$("#sBtn").on("click", ()=>{
		let sortString ="";
		 $("#sortDetail div input:checked").each(function () {
		        // 페이지 로딩 시 체크된 input 요소들의 값을 리스트로 얻음
		        let checkedValue = $(this).val();
		        console.log(checkedValue); // 여기서 리스트로 원하는 작업 수행
		        if(checkedValue)sortString += "," + checkedValue;
		 });
		 console.log(sortString)
		 if(sortString.length >=1){
			 let processedSort = sortString.slice(1);
			 $("#sort").val(processedSort);
		 }
		 
	})


	//--------------위치 찾기 -------------------
	let container = document.getElementById('map');
	let options = {
		center: new kakao.maps.LatLng(35.23278717517533, 129.082898448971),
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
    

    /* location / map처리 */
    let locationTags = [];
    let locationObjectArr = [];
    let result_locationObject = {};
    
    const saveLocationBtn = document.querySelector('#saveLocationBtn');
    const locationSearchContainer = document.querySelector('#locationSearchContainer');
    const locationSearch = document.querySelector('#locationSearch');
    const locationSearchBtn = document.querySelector('#locationSearchBtn');
    const hosNameInput = document.querySelector('#hosNameInput');
    const hosLocationInput = document.querySelector('#hosLocationInput');

    const inputLatitude = document.querySelector('#inputLatitude');
    const inputlongitude = document.querySelector('#inputlongitude');

    function childIndex(child){
        const children = child.parentElement.children;
        let i = 0;
        for(i = 0; i < children.length; i++){
            if(children[i] == child){
                break;
            }
        }
        return i;
    }

    locationSearchBtn.addEventListener('click', async e=>{
        e.preventDefault();
        locationSearchContainer.innerHTML = '';
        var places = new kakao.maps.services.Places();
        var callback = await function(result, status) {
            locationObjectArr = [];
            locationTags = [];
            if (status === kakao.maps.services.Status.OK) {
                for(element of result){
                    let temp = document.createElement("div");
                    let tempObj = {
                        name : element.place_name,
                        location : element.road_address_name,
                        x : element.x,
                        y : element.y
                    };
                    locationObjectArr.push(tempObj);
                    temp.innerText = element.place_name;//태그 설정
                    temp.setAttribute('class', 'mb-1')
                    locationTags.push(temp);
                    locationSearchContainer.appendChild(temp);
                };
                locationTags.forEach(e=>{
                    e.addEventListener('click', evt=>{
                        result_locationObject =  locationObjectArr[childIndex(e)];
                        locationSearch.value = result_locationObject?result_locationObject.name:"";

                        clusterer.clear();
                        let marker = new kakao.maps.Marker({
                            position: new kakao.maps.LatLng(result_locationObject.y, result_locationObject.x)
                        });
                        map.setCenter(new kakao.maps.LatLng(result_locationObject.y , result_locationObject.x));
                        clusterer.addMarker(marker);
                    })

                    e.addEventListener('mouseenter', ()=>{
                        e.classList.add('hover_changeBg');
                    })

                    e.addEventListener('mouseleave', ()=>{
                        e.classList.remove('hover_changeBg');
                    })
                })
            }
        };
        places.keywordSearch(locationSearch.value, callback);
    })

    const resetModalInputs = ()=>{
        locationSearchContainer.innerHTML = '';
        locationSearch.value = '';
    }

    saveLocationBtn.addEventListener('click', e=>{
        e.preventDefault();
        hosNameInput.value =  result_locationObject.name?result_locationObject.name:"";
        hosLocationInput.value = result_locationObject.location?result_locationObject.location:"";
        inputLatitude.value = result_locationObject?result_locationObject.y:"";
        inputlongitude.value = result_locationObject?result_locationObject.x:"";
        resetModalInputs();
    })
    


    closeLocationBtn.addEventListener('click', ()=>{
        resetModalInputs();
    })

    closeModalBtn.addEventListener('click', ()=>{
        resetModalInputs();
    })



</script>
</html>
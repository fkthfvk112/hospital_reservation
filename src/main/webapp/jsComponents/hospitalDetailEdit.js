
function doAjax(obj){
	$.ajax({
	    url: 'updateHospital.do', // 요청을 보낼 URL
	    type: 'POST', // HTTP 요청 메서드 (GET, POST 등)
	    data: obj,
	    dataType: 'json',
	    success: function(response) {
	        console.log('성공', response);
	        location.reload();

	    },
	    error: function(error) {
	        console.error('실패', error);
	    }
	});
}

let updateSelector = {
	hosId:$("#hosId").val(),
	content: null,
	selection: null
}
//------------------설명---------------------

let descEditBtn = document.querySelector("#descEditBtn");
let descEditContainer = document.querySelector("#descEditContainer");
let descCompleteBtn = document.querySelector("#descCompleteBtn");



let descState = 0;//disable
let setDescState = (num)=>{
	descState = num;
}


descEditBtn.addEventListener('click', ()=>{//토글
	if(descState === 0){
		setDescState(1);
	}
	else{
		setDescState(0);
	}
	
	if(descState ===1){
		descEditContainer.style.display = "";
	}
	else{
		descEditContainer.style.display = "none";
	}
})

descCompleteBtn.addEventListener('click', ()=>{
	console.log("0")
	updateSelector.selection = 0;
	updateSelector.content = $("#descEditTextAtrea").val();
	console.log(updateSelector.content);
	doAjax(updateSelector);
	console.log(updateSelector)
})


//------------------운영 시간---------------------

let timeEditBtn = document.querySelector("#timeEditBtn");
let timeEditContainer = document.querySelector("#timeEditContainer");
let timeCompleteBtn = document.querySelector("#timeCompleteBtn");

let timeState = 0;//disable
let setTimeState = (num)=>{
	timeState = num;
}
timeEditBtn.addEventListener('click', ()=>{//토글
	if(timeState === 0){
		setTimeState(1);
	}
	else{
		setTimeState(0);
	}
	
	if(timeState ===1){
		timeEditContainer.style.display = "";
	}
	else{
		timeEditContainer.style.display = "none";
	}
})

timeCompleteBtn.addEventListener('click', ()=>{
	console.log("1")
	let timeString = $("#startTime").val() + "," + $("#closeTime").val()
	updateSelector.selection = 1;
	updateSelector.content = timeString;
	
	doAjax(updateSelector);
	console.log(updateSelector)
})


//------------------- 진료과
let sortEditBtn = document.querySelector("#sortEditBtn");
let sortEditContainer = document.querySelector("#sortEditContainer");
let sortCompleteBtn = document.querySelector("#sortCompleteBtn");

let sortState = 0;//disable
let setSortState = (num)=>{
	sortState = num;
}
sortEditBtn.addEventListener('click', ()=>{//토글
	if(sortState === 0){
		setSortState(1);
	}
	else{
		setSortState(0);
	}
	
	if(sortState ===1){
		sortEditContainer.style.display = "";
	}
	else{
		sortEditContainer.style.display = "none";
	}
})


$("#sBtn").on("click", ()=>{
	console.log("실행")
	let sortString ="";
	 $("#sortDetail div input:checked").each(function () {
	        let checkedValue = $(this).val();
	        console.log(checkedValue);
	        if(checkedValue)sortString += "," + checkedValue;
	 });
	 console.log(sortString)
	 if(sortString.length >=1){
		 let processedSort = sortString.slice(1);
		 $("#sort").val(processedSort);
	 }
	 
	$("#sort")[0].scrollIntoView({ behavior: "smooth" });
	 
})

sortCompleteBtn.addEventListener('click', ()=>{
	console.log("2")
	updateSelector.selection = 2;
	updateSelector.content = $("#sort").val()
	if(updateSelector.content.length === 0){
		alert("진료과를 선택해주세요.");
		return;
	} 
	doAjax(updateSelector);
	console.log(updateSelector)
})
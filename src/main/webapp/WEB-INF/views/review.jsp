<%@page import="org.codehaus.jackson.map.util.JSONPObject"%>
<%@page import="component.dto.HospitalDto"%>
<%@page import="component.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	UserDto login = (UserDto)session.getAttribute("login");
	String userId = null;
	if(login != null){
		userId = login.getId();
	}
	
	HospitalDto hosDto = (HospitalDto)request.getAttribute("hospitalDto");
	String sortType = (String)request.getAttribute("sort_type");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<style>

#reviewContainer{
	display:grid;
	grid-template-columns: 10em 1fr 1fr;
	padding:2em;
	width:95%;
}

.deleteBtn{
	border:none;
	border-radius:1em;
	padding:0.2em 1em 0.2em 1em;
	transition:0.2s;
}

.deleteBtn:hover{
	background-color:black;
	color:white;
}

.reviewContent{
	grid-column: span 3;
	background-color: #f0f0f0;
	border-radius:1em;
	padding:1em;
	margin:0.3em;
}

.reviewDate{
	font-size:0.6rem;
	color:##bfbdbd;
}

.reviewScore{
	grid-column: span 3;
	font-size: 1.5rem;
	margin-bottom: 0.3em;
	color:#FFCB12;
}

.reviewBtnContainer{
	text-align: right;
	margin-right:1em;
}

.reviewUserId{
	font-weight:bold;
	padding:0.2em;
}



a{
	text-decoration: none;
	color:black;
}

.reviewWrap{
	display: flex;
    flex-direction: column;
    align-items: center;
}

/* 리뷰상단 */
.reviewTitle{
	height: 50px;
	width: 95%;
	background-color: #B5E2FA;
	margin-top: 20px;
    display: flex;
    align-items: center;
}

.reviewTitle a{
    outline: none;
    border: none;
    text-align: center;
	margin-left: 20px;
    
}

/* 리뷰목록 */
.review{
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
    width: 80%;
    height: 100%;
    
}
/* 구분선 */
.jb-division-line { 
  border-top: 1px solid #444444;
  margin: 10px 0px;
}

/* 리뷰 별구현 */
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 1.5rem;
  line-height: 5rem;
  justify-content: space-around;
  padding: 0.3em;
  text-align: center;
  width: 5em;
  margin-bottom:0.3em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: #FFCB12;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #f7db8d;
}


/* 리뷰등록 */
.reviewAddWrap{
    margin-top: 30px;
    margin-bottom: 30px;
    width: 70%;
    height: 100%;
/*     border: 1px solid #444444;
    border-radius:1em; */
   
    background-color: white;
    padding:0.5em;
}
.reviewAddTop{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px;
    height: 20px;
   
}
.scoreWrap{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    
}
.scoreWrap h3{
    margin-top: 15px;
}

.addBtn{
    border: none;
    background-color: #0FA3B1;
    border-radius: 10px;
    width: 100px;
    height: 30px;
    color:white;    
}
.addBtn button{
	color: white;
}
.reviewAddContent textarea{
    width:100%; 
	height:100px; 
    resize:none;/* 크기고정 */ 
    outline: none;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    text-align: left;
    background-color: white;
    
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body>

<!-- 리뷰전체맵 -->
<div class="reviewWrap">
		
		<!-- 리뷰 타이틀 -->
        <div class="reviewTitle">
            <div class=""><a href=<%="hospitalDetail.do?id="+hosDto.getId()+"&type=recent" %>>최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</div>   
            <div class=""><a href=<%="hospitalDetail.do?id="+hosDto.getId()+"&type=scoreup" %>>평점높은순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</div>
            <div class=""><a href=<%="hospitalDetail.do?id="+hosDto.getId()+"&type=scoredown" %>>평점낮은순</a></div>
            
           <%--  <a href="" onclick="recentReview(<%=hosDto.getId() %>)">최신순</a> --%>
     
        </div>  
          
        <script> 
        function scoreUplist(id) {
			alert("id" + id);
        	//var hospitalId = 1; // 임시로 설정한 아이디
            $.ajax({
              url: "scoreUplist.do?hosId="+id, 
              success: function(data) {
                // 성공적으로 응답을 받았을 때 실행할 콜백 함수
                console.log("서버에서 받은 데이터: ", data);
              },
              error: function(xhr, status, error) {
                // 요청이 실패했을 때 실행할 콜백 함수
                console.error("에러 발생: ", status, error);
              }
            });
		}
        
        function scoreDownlist(id) {
			//alert("test");
        	//var hospitalId = 1; // 임시로 설정한 아이디
            $.ajax({
              url: "scoreDownlist.do?hosId="+id, 
              success: function(data) {
                // 성공적으로 응답을 받았을 때 실행할 콜백 함수
                console.log("서버에서 받은 데이터: ", data);
              },
              error: function(xhr, status, error) {
                // 요청이 실패했을 때 실행할 콜백 함수
                console.error("에러 발생: ", status, error);
              }
            });
		}
</script>

    
        <!-- 리뷰목록 -->
        <div class="review" id="result">
        
        </div>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
		  $(document).ready(function() {
		    // AJAX 요청을 보낼 URL을 설정합니다.
		    var url = `<%="review.do?hosId="+hosDto.getId() +"&type="+sortType%>`; // 병원ID에 실제 값을 넣어주어야 합니다.
		    //alert(url);
			var htmlContent = "";
			let userId = "<%=userId %>";
			//alert(userId);
		    $.getJSON(url, function(data) {
		      console.log(data);
		      
		      if(!data){
		    	  htmlContent += "<p>아직 입력된 리뷰가 없습니다.</p>";
		    	  
		      }else{
		    	  //console.log("data" + data[0].id);
		    	  for (var i = 0; i < data.length; i++) {	  
			   			htmlContent += "<div id='reviewContainer'>";
			    			 
			    		//리뷰아이디
			    	      htmlContent += "<input type='hidden' name='id' value='" + data[i].id + "'>";
			    	      
			    	      
			    	      //병원아이디
			    	      htmlContent += "<input type='hidden' name='hospital_id' value='" + data[i].hospital_id + "'>";
			    	      
			    	      //작성자
			    	      htmlContent += "<div class='reviewUserId'>" + data[i].user_id + "</div>";
			    	      //작성일
			    	      htmlContent += "<div class='reviewDate'>" + data[i].wdate + "</div>";
			    	     
			    	      //삭제버튼
			    	      if(userId==data[i].user_id){
				    	      htmlContent += "<div class='reviewBtnContainer'>";
				    	      htmlContent += "<button type='button' class='deleteBtn' data-id='" + data[i].id + "'>삭제</button>";
				    	      // 여기에 글번호 등 추가적인 데이터를 data[i]에서 가져와서 삽입 가능
				    	      htmlContent += "</div>";	  
			    	      }
			    	      else{
				    	      htmlContent += "<div class='reviewBtnContainer'>";
				    	      htmlContent += "</div>";
			    	      }
			    	      
			    	      //평점
			    	      htmlContent += "<div class='reviewScore'>";
			    	      let starS ="";
			    	      for(let j = 0; j < data[i].score; j++){
			    	    	  starS += "★";
			    	      }
			    	      
			    	      htmlContent += starS;			    	      
			    	      htmlContent += "</div>";
			    	      
			    	      //내용
			    	      htmlContent += "<div class='reviewContent'>" + data[i].content + "</div>";
	
		    	      
			    		htmlContent += "</div>";

		    	      // 구분선 추가
		    	      //htmlContent += "<div class='jb-division-line'></div>";
		    	      
		    	    }
		    	  
		    	    // 결과를 해당 HTML 요소에 붙입니다.
		    	    $("#result").html(htmlContent);
		      }
		    });
		    
		    $(document).on("click", ".deleteBtn", function() {
		    	var reviewId = $(this).data("id");
		    	if(reviewId){
		    		if (confirm("정말로 이 리뷰를 삭제하시겠습니까?")) {
			            // 확인 버튼을 눌렀을 때 삭제를 진행하는 AJAX 요청
			            $.ajax({
			                url: "reviewDelete.do",
			                type: "GET",
			                data: { id: reviewId },
			                success: function(data) {
			                	console.log(data);
			                	location.href="hospitalDetail.do?id="+"<%=hosDto.getId() %>";
			                },
			                error: function(error) {
			                    console.error("리뷰 삭제 에러:", error);
			                }
			            });
			        }
		    	}
    		  });
		    
		  });
		</script>

		<!-- 리뷰등록 OK -->
			<div class="reviewAddWrap">
				<form action="reviewWriteAf.do" method="post" accept-charset="UTF-8" class="mb-3" name="myform" id="myform">
				<input type="hidden" name="hospital_id" value="<%=hosDto.getId() %>"><!-- 임시: 원래 병원번호가 따라와야됨 -->
				<input type="hidden" name="user_id" value="<%=userId %>"><!-- 임시: 원래 유저아디가 따라와야됨 -->
				
	            <div class="reviewAddTop">
	            	<!-- 평점 -->
	            	<div class="scoreWrap">
	                    <div class="star-rating space-x-4 mx-auto ">
	                        <input type="radio" id="5-stars" name="score" value="5" v-model="ratings"  checked="checked"/>
	                        <label for="5-stars" class="star pr-4">★</label>
	                        <input type="radio" id="4-stars" name="score" value="4" v-model="ratings"/>
	                        <label for="4-stars" class="star">★</label>
	                        <input type="radio" id="3-stars" name="score" value="3" v-model="ratings"/>
	                        <label for="3-stars" class="star">★</label>
	                        <input type="radio" id="2-stars" name="score" value="2" v-model="ratings"/>
	                        <label for="2-stars" class="star">★</label>
	                        <input type="radio" id="1-star" name="score" value="1" v-model="ratings"/>
	                        <label for="1-star" class="star">★</label>
	                    </div>
	                </div>
					<button type="button" class="addBtn" onclick="checkLogin()">리뷰 등록</button>
	            </div>
	            
	            <div class="reviewAddContent" >
	                <textarea id="contetnArea" placeholder="리뷰내용을 입력해주세요" name="content"></textarea>
	            </div>
	         
	        </form>
        </div> 
        
<!-- 로그인 체크하는 JavaScript 함수 -->
<script>
	
  function checkLogin() {
    let userId = "<%=userId %>";
    console.log("유저 아이디", userId);
    if (userId == null || userId == undefined || userId == "null" || userId == "undefined") {
      	alert("로그인 후 이용할 수 있는 서비스입니다. 로그인해주세요.");
    } else {
    	if($("#contetnArea").val().length >=5 ){
        	console.log("폼 제출");
          	document.getElementById("myform").submit();
    	}
    	else{
    		alert("댓글을 5글자 이상 입력해주세요!");
    	}
    }
  }
</script>   
</div>
</html>
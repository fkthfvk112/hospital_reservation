<%@page import="org.codehaus.jackson.map.util.JSONPObject"%>
<%@page import="component.dto.HospitalDto"%>
<%@page import="component.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	UserDto login = (UserDto)session.getAttribute("login");
	
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
    margin-top: 30px;
    margin-bottom: 30px;
    width: 50%;
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
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: #F7A072;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #EDDEA4;
}


/* 리뷰등록 */
.reviewAddWrap{
    margin-top: 30px;
    margin-bottom: 30px;
    width: 50%;
    height: 100%;
    border: 1px solid #444444;
    background-color: white;
   
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
    margin-top: 10px;
    
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
    text-align: center;
    padding-top: 50px;
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
			let userId = `<%=((UserDto)session.getAttribute("login")).getId() %>`;
			//alert(userId);
		    $.getJSON(url, function(data) {
		      console.log(data);
		      
		      if(!data){
		    	  htmlContent += "<p>아직 입력된 리뷰가 없습니다.</p>";
		    	  
		      }else{
		    	  //console.log("data" + data[0].id);
		    	  for (var i = 0; i < data.length; i++) {	  
		    		  
		    		//리뷰아이디
		    	      htmlContent += "<div>";
		    	      htmlContent += "<input type='hidden' name='id' value='" + data[i].id + "'>";
		    	      htmlContent += "</div>";
		    	      
		    	      
		    	      //병원아이디
		    	      htmlContent += "<div>";
		    	      htmlContent += "<input type='hidden' name='hospital_id' value='" + data[i].hospital_id + "'>";
		    	      htmlContent += "</div>";
		    		  
		    	      //리뷰아이디
		    	      htmlContent += "<div>";
		    	      htmlContent += "<input type='text' name='id' value='" + data[i].id + "'>";
		    	      htmlContent += "</div>";
		    	      
		    	      //작성자
		    	      htmlContent += "<div class='reviewUserId'>작성자 " + data[i].user_id + "</div>";
		    	      
		    	      //평점
		    	      htmlContent += "<div class='reviewScore'>평점 " + data[i].score + "</div>";
		    	      
		    	      //작성일
		    	      htmlContent += "<div class='reviewDate'>작성일 " + data[i].wdate + "</div>";
		    	      
		    	      //내용
		    	      htmlContent += "<div class='reviewContent'>" + data[i].content + "</div>";

		    	      //삭제버튼
		    	      if(userId==data[i].user_id){
		    	      htmlContent += "<div>";
		    	      htmlContent += "<button type='button' class='deleteBtn' data-id='" + data[i].id + "'>삭제</button>";
		    	      // 여기에 글번호 등 추가적인 데이터를 data[i]에서 가져와서 삽입 가능
		    	      htmlContent += "</div>";	  
		    	      }

		    	      // 구분선 추가
		    	      htmlContent += "<div class='jb-division-line'></div>";
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
				<input type="hidden" name="user_id" value="<%=login.getId() %>"><!-- 임시: 원래 유저아디가 따라와야됨 -->
				
	            <div class="reviewAddTop">
	            	<!-- 평점 -->
	            	<div class="scoreWrap">
	                    <div><h3>평점</h3></div>
	                    <div class="star-rating space-x-4 mx-auto">
	                        <input type="radio" id="5-stars" name="score" value="5" v-model="ratings"/>
	                        <label for="5-stars" class="star pr-4">★</label>
	                        <input type="radio" id="4-stars" name="score" value="4" v-model="ratings"/>
	                        <label for="4-stars" class="star">★</label>
	                        <input type="radio" id="3-stars" name="score" value="3" v-model="ratings"/>
	                        <label for="3-stars" class="star">★</label>
	                        <input type="radio" id="2-stars" name="score" value="2" v-model="ratings"/>
	                        <label for="2-stars" class="star">★</label>
	                        <input type="radio" id="1-star" name="score" value="1" v-model="ratings" />
	                        <label for="1-star" class="star">★</label>
	                    </div>
	                </div>
	                
	                 <div>
	                        <button type="button" class="addBtn" onclick="checkLogin()">리뷰등록</button>
	                </div>
	            </div>
	            
	            <div class="reviewAddContent" >
	                <textarea placeholder="리뷰내용을 입력해주세요" name="content"></textarea>
	            </div>
	         
	        </form>
        </div> 
        
<!-- 로그인 체크하는 JavaScript 함수 -->
<script>
	
  function checkLogin() {
    var isLoggedIn = <%= (session.getAttribute("login") != null) %>;
    if (!isLoggedIn) {
      alert("로그인 후 이용할 수 있는 서비스입니다. 로그인해주세요.");
    } else {
      document.getElementById("myform").submit();
    }
  }
</script>   
</div>


<%-- 
<button id = "loadDataBtn">버튼</button> 
</body>
<script>
  $(document).ready(()=>{
	  let reviewDatas = [];
	  
	  $.ajax({
          url: 'review.do',
          type: 'GET',
          data: { hosId: <%=hosDto.getId()%>},
          dataType: 'json',
          success: function(response) {
          	console.log("데이터 응답 성공", response);
          	reviewDatas = response;
          },
          error: function(error) {
             console.error("실패", error);
          }
      });
  })
</script> --%>

</html>
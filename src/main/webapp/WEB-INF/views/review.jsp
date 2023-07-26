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
<title>����</title>
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

/* ������ */
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

/* ������ */
.review{
    margin-top: 30px;
    margin-bottom: 30px;
    width: 50%;
    height: 100%;
    
}
/* ���м� */
.jb-division-line { 
  border-top: 1px solid #444444;
  margin: 10px 0px;
}

/* ���� ������ */
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


/* ������ */
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
    resize:none;/* ũ����� */ 
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

<!-- ������ü�� -->
<div class="reviewWrap">
		
		<!-- ���� Ÿ��Ʋ -->
        <div class="reviewTitle">
            <div class=""><a href=<%="hospitalDetail.do?id="+hosDto.getId()+"&type=recent" %>>�ֽż�</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</div>   
            <div class=""><a href=<%="hospitalDetail.do?id="+hosDto.getId()+"&type=scoreup" %>>����������</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</div>
            <div class=""><a href=<%="hospitalDetail.do?id="+hosDto.getId()+"&type=scoredown" %>>����������</a></div>
            
           <%--  <a href="" onclick="recentReview(<%=hosDto.getId() %>)">�ֽż�</a> --%>
     
        </div>  
          
        <script> 
        function scoreUplist(id) {
			alert("id" + id);
        	//var hospitalId = 1; // �ӽ÷� ������ ���̵�
            $.ajax({
              url: "scoreUplist.do?hosId="+id, 
              success: function(data) {
                // ���������� ������ �޾��� �� ������ �ݹ� �Լ�
                console.log("�������� ���� ������: ", data);
              },
              error: function(xhr, status, error) {
                // ��û�� �������� �� ������ �ݹ� �Լ�
                console.error("���� �߻�: ", status, error);
              }
            });
		}
        
        function scoreDownlist(id) {
			//alert("test");
        	//var hospitalId = 1; // �ӽ÷� ������ ���̵�
            $.ajax({
              url: "scoreDownlist.do?hosId="+id, 
              success: function(data) {
                // ���������� ������ �޾��� �� ������ �ݹ� �Լ�
                console.log("�������� ���� ������: ", data);
              },
              error: function(xhr, status, error) {
                // ��û�� �������� �� ������ �ݹ� �Լ�
                console.error("���� �߻�: ", status, error);
              }
            });
		}
</script>

    
        <!-- ������ -->
        <div class="review" id="result">
        
        </div>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
		  $(document).ready(function() {
		    // AJAX ��û�� ���� URL�� �����մϴ�.
		    var url = `<%="review.do?hosId="+hosDto.getId() +"&type="+sortType%>`; // ����ID�� ���� ���� �־��־�� �մϴ�.
		    //alert(url);
			var htmlContent = "";
			let userId = `<%=((UserDto)session.getAttribute("login")).getId() %>`;
			//alert(userId);
		    $.getJSON(url, function(data) {
		      console.log(data);
		      
		      if(!data){
		    	  htmlContent += "<p>���� �Էµ� ���䰡 �����ϴ�.</p>";
		    	  
		      }else{
		    	  //console.log("data" + data[0].id);
		    	  for (var i = 0; i < data.length; i++) {	  
		    		  
		    		//������̵�
		    	      htmlContent += "<div>";
		    	      htmlContent += "<input type='hidden' name='id' value='" + data[i].id + "'>";
		    	      htmlContent += "</div>";
		    	      
		    	      
		    	      //�������̵�
		    	      htmlContent += "<div>";
		    	      htmlContent += "<input type='hidden' name='hospital_id' value='" + data[i].hospital_id + "'>";
		    	      htmlContent += "</div>";
		    		  
		    	      //������̵�
		    	      htmlContent += "<div>";
		    	      htmlContent += "<input type='text' name='id' value='" + data[i].id + "'>";
		    	      htmlContent += "</div>";
		    	      
		    	      //�ۼ���
		    	      htmlContent += "<div class='reviewUserId'>�ۼ��� " + data[i].user_id + "</div>";
		    	      
		    	      //����
		    	      htmlContent += "<div class='reviewScore'>���� " + data[i].score + "</div>";
		    	      
		    	      //�ۼ���
		    	      htmlContent += "<div class='reviewDate'>�ۼ��� " + data[i].wdate + "</div>";
		    	      
		    	      //����
		    	      htmlContent += "<div class='reviewContent'>" + data[i].content + "</div>";

		    	      //������ư
		    	      if(userId==data[i].user_id){
		    	      htmlContent += "<div>";
		    	      htmlContent += "<button type='button' class='deleteBtn' data-id='" + data[i].id + "'>����</button>";
		    	      // ���⿡ �۹�ȣ �� �߰����� �����͸� data[i]���� �����ͼ� ���� ����
		    	      htmlContent += "</div>";	  
		    	      }

		    	      // ���м� �߰�
		    	      htmlContent += "<div class='jb-division-line'></div>";
		    	    }
		    	  
		    	    // ����� �ش� HTML ��ҿ� ���Դϴ�.
		    	    $("#result").html(htmlContent);
		      }
		    });
		    
		    $(document).on("click", ".deleteBtn", function() {
		    	var reviewId = $(this).data("id");
		    	if(reviewId){
		    		if (confirm("������ �� ���並 �����Ͻðڽ��ϱ�?")) {
			            // Ȯ�� ��ư�� ������ �� ������ �����ϴ� AJAX ��û
			            $.ajax({
			                url: "reviewDelete.do",
			                type: "GET",
			                data: { id: reviewId },
			                success: function(data) {
			                	console.log(data);
			                	location.href="hospitalDetail.do?id="+"<%=hosDto.getId() %>";
			                },
			                error: function(error) {
			                    console.error("���� ���� ����:", error);
			                }
			            });
			        }
		    	}
    		  });
		    
		  });
		</script>

		<!-- ������ OK -->
			<div class="reviewAddWrap">
				<form action="reviewWriteAf.do" method="post" accept-charset="UTF-8" class="mb-3" name="myform" id="myform">
				<input type="hidden" name="hospital_id" value="<%=hosDto.getId() %>"><!-- �ӽ�: ���� ������ȣ�� ����;ߵ� -->
				<input type="hidden" name="user_id" value="<%=login.getId() %>"><!-- �ӽ�: ���� �����Ƶ� ����;ߵ� -->
				
	            <div class="reviewAddTop">
	            	<!-- ���� -->
	            	<div class="scoreWrap">
	                    <div><h3>����</h3></div>
	                    <div class="star-rating space-x-4 mx-auto">
	                        <input type="radio" id="5-stars" name="score" value="5" v-model="ratings"/>
	                        <label for="5-stars" class="star pr-4">��</label>
	                        <input type="radio" id="4-stars" name="score" value="4" v-model="ratings"/>
	                        <label for="4-stars" class="star">��</label>
	                        <input type="radio" id="3-stars" name="score" value="3" v-model="ratings"/>
	                        <label for="3-stars" class="star">��</label>
	                        <input type="radio" id="2-stars" name="score" value="2" v-model="ratings"/>
	                        <label for="2-stars" class="star">��</label>
	                        <input type="radio" id="1-star" name="score" value="1" v-model="ratings" />
	                        <label for="1-star" class="star">��</label>
	                    </div>
	                </div>
	                
	                 <div>
	                        <button type="button" class="addBtn" onclick="checkLogin()">������</button>
	                </div>
	            </div>
	            
	            <div class="reviewAddContent" >
	                <textarea placeholder="���䳻���� �Է����ּ���" name="content"></textarea>
	            </div>
	         
	        </form>
        </div> 
        
<!-- �α��� üũ�ϴ� JavaScript �Լ� -->
<script>
	
  function checkLogin() {
    var isLoggedIn = <%= (session.getAttribute("login") != null) %>;
    if (!isLoggedIn) {
      alert("�α��� �� �̿��� �� �ִ� �����Դϴ�. �α������ּ���.");
    } else {
      document.getElementById("myform").submit();
    }
  }
</script>   
</div>


<%-- 
<button id = "loadDataBtn">��ư</button> 
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
          	console.log("������ ���� ����", response);
          	reviewDatas = response;
          },
          error: function(error) {
             console.error("����", error);
          }
      });
  })
</script> --%>

</html>
<%@page import="component.dto.HospitalDto"%>
<%@page import="component.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="component.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	UserDto login = (UserDto)session.getAttribute("login");
	List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<style>
.reviewWrap{
	display: flex;
    flex-direction: column;
    align-items: center;
    

}

/* ������ */
.reviewTitle{
	height: 50px;
	width: 50%;
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

<jsp:include page="header.jsp" flush="false"/>
 <jsp:include page="nav.jsp" flush="false"/>


<!-- ������ü�� -->
<div class="reviewWrap">
		
		<!-- ���� Ÿ��Ʋ -->
        <div class="reviewTitle">
            <div class=""><a href="review.do?hospital_id=1">�ֽż�</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</div>   
            <div class=""><a href="scoreUplist.do?hospital_id=1">����������</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp</div>
            <div class=""><a href="scoreDownlist.do?hospital_id=1">����������</a></div>  	  
        </div>
    
        <!-- ������ -->
        <%
        if(list == null || list.size() == 0){
        	%>
        	�ۼ��� ���䰡 �����ϴ�.
        	<%
        }else{
        	for(int i=0; i<list.size(); i++){
        		ReviewDto review = list.get(i);
        		%>
            	<div class="review">
            		<div>
		                <input type="hidden" name="<%=review.getId() %>">
				        <input type="hidden" name="<%=review.getHospital_id() %>">  
		            </div>
				    <div class="reviewUserId"><%=review.getUser_id() %></div>
				    <div class="reviewScore"><%=review.getScore() %></div>
				    <div class="reviewDate"><%=review.getWdate() %></div>
				    <div class="reviewContent">
				        <%=review.getContent() %>
				    </div>
				    <div class="jb-division-line"></div>
		        </div>
            	<%
        	}
        }
        
        %>

		<!-- ������ -->
		<%
		
		if(login != null){ // �α��� �� ���¿����� �����ۼ� �����ϰ�
			%>
			<div class="reviewAddWrap">
				<form action="reviewWriteAf.do" method="post" accept-charset="UTF-8" class="mb-3" name="myform" id="myform">
				<input type="hidden" name="hospital_id" value="2"><!-- �ӽ�: ���� ������ȣ�� ����;ߵ� -->
				<input type="hidden" name="user_id" value="asdf1"><!-- �ӽ�: ���� �����Ƶ� ����;ߵ� -->
				<input type="hidden" value="<%=login.getId() %>">
	
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
	                        <button type="submit" class="addBtn">������</button>
	                </div>
	            </div>
	            
	            <div class="reviewAddContent" >
	                <textarea placeholder="���䳻���� �Է����ּ���" name="content"></textarea>
	            </div>
	         
	        </form>
        </div> 
			<%
		}
		%>

    </div>
    

<jsp:include page="footer.jsp" flush="false"/>  
</body>
</html>












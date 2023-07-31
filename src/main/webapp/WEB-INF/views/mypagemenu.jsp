<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mysidebar {
		padding: 0px; /* padding 기본값으로 우측에 40이 잡혀서 자꾸 li가 ul 디브 밖으로 나감 */
	}
	.mymenuitem {
		margin: 10px; /* li끼리 띄우기 */
		list-style-type: none; /* ul의 li 점 지우기 */
	  	text-align: left;
	  	cursor:pointer;
	}
	.myPageNavA{
	  	text-decoration-line: none; /* 밑줄 제거 */
	  	color: black; /* a태그 기본값으로 파란글자인거를 검정으로 */
	  	padding:0.3em 2em 0.3em 0.5em;
	  	white-space: nowrap;
	  	
  	}
  	
  	.mysidebar{
  		display:block;
  		width:100%;
  		background-color: white;
  		padding:1em 0em 1em 0em;
  	}
</style>
</head>
<body>

<div id="sidebar">
	
		<ul class="mysidebar">
			<li class="mymenuitem" id="mymenuitemA">
				<!-- 현재 선택된 메뉴의 글자색을 다르게 하고 싶음
				     클릭이 한 번 됬다고 기록마냥 바뀌는 게 아니라 
				     다른 메뉴가 클릭되면 다시 검정색으로 바뀌어야함 
				     -> jqurey 사용해서 on()으로 클릭되면 해당 태그 css 글자색 바꿔주고
				         나머지 태그의 글자색 다 검정으로 바꿔주고 그래야하나?-->
				<a class="myPageNavA" href="myprofile.do">프로필</a>
			</li>
			<li class="mymenuitem" id="mymenuitemB">
				<a class="myPageNavA" href="myreservation.do">예약</a>
			</li>
			<li class="mymenuitem" id="mymenuitemC">
				<a class="myPageNavA" href="mylike.do">찜</a>
			</li>
			<li class="mymenuitem" id="mymenuitemD">
				<a class="myPageNavA"  id="mymenuitemE" href="myreview.do">리뷰</a>
			</li>
		</ul>
	
</div>
</body>
</html>
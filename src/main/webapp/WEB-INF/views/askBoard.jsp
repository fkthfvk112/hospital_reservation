<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
        /* 공통 */
        *{
            margin: 0;
            padding: 0;
            box-sizing: 0;
        }

        a{
            text-decoration: none;
            color: black;
        }

        body{
            margin: 0 auto;
            background-color: #F9F7F3;
        }

        ul{
            list-style: none;
        }

        select, input, button{
            outline: none;
        }

     
        /* body */
        main{
            display: flex;
            flex-direction: column;
            align-items: center;
            
        }
        
        .searchWrapp{
            margin-top: 30px;
            margin-bottom: 30px;
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
       
        .searchSelect{
            width: 100px;
            height: 30px;
            
        }

        .searchInput{
            width: 200px;
            height: 30px;
        }

        .searchBtn button{
            width: 50px;
        }

        .contentWrap{
            display: flex;
            justify-content: space-between;
            width: 80%;
            /* height: 100%; */
        }



    </style>
</head>
<body>
 
 <jsp:include page="header.jsp" flush="false"/>
 <jsp:include page="nav.jsp" flush="false"/>
 
    <main>
        <!-- 메인 상단 -->
        <div class="searchWrapp">
            <div class="searchSelect">
                <select>
                    <option>제목</option>
                    <option>내용</option>
                    <option>작성자</option>
                </select>
            </div>
            <div class="searchInput">
                <input type="text" />
            </div>
            <div class="searchBtn">
                <button>검색</button>
            </div>
        </div>
        <!-- 메인 -->
        <div class="contentWrap">
            <div class="contentLeft">
                <div>지도</div>
                <div>내예약정보</div>
            </div>
            <div class="contentCenter">
                게시판
            </div>
            <div class="contentRight">
                <div>버튼들</div>
            </div>

        </div>
    </main>

<jsp:include page="footer.jsp" flush="false"/>


</body>
</html>
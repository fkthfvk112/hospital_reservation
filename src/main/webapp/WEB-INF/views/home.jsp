<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HOSPITAL MATE</title>
<style>
        /* ���� */
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
            background-color: #F9F7F3;
        }

        ul{
            list-style: none;
        }


        /* body */
        .contentWrap{
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        .content{
            margin-bottom: 30px;
        }

</style>
</head>
<body>

 
 <jsp:include page="header.jsp" flush="false"/>
 <jsp:include page="nav.jsp" flush="false"/>
 
    <main class="contentWrap">
        <div class="content">
            <img src="./image/����1-1.jpg" >
        </div>
        <div class="content">
            <img src="./image/����1-2.jpg" >
        </div>
        <div class="content">
            <img src="./image/����1-3.jpg" >
        </div>
        <div class="content">
            <img src="./image/����1-4.jpg" >
        </div>
    </main>

<jsp:include page="footer.jsp" flush="false"/>

</body>
</html>

















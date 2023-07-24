<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
        <!-- ���� ��� -->
        <div class="searchWrapp">
            <div class="searchSelect">
                <select>
                    <option>����</option>
                    <option>����</option>
                    <option>�ۼ���</option>
                </select>
            </div>
            <div class="searchInput">
                <input type="text" />
            </div>
            <div class="searchBtn">
                <button>�˻�</button>
            </div>
        </div>
        <!-- ���� -->
        <div class="contentWrap">
            <div class="contentLeft">
                <div>����</div>
                <div>����������</div>
            </div>
            <div class="contentCenter">
                �Խ���
            </div>
            <div class="contentRight">
                <div>��ư��</div>
            </div>

        </div>
    </main>

<jsp:include page="footer.jsp" flush="false"/>


</body>
</html>